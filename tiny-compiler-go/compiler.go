package main

import (
	"strings"
	"unicode"
)

type TokenType string

const (
	TokenTypeParen  TokenType = "paren"
	TokenTypeName   TokenType = "name"
	TokenTypeNumber TokenType = "number"
	TokenTypeString TokenType = "string"
)

type Token struct {
	tokenType TokenType
	value     string
}

type ASTNodeType string

const (
	ASTNodeTypeProgram             ASTNodeType = "Program"
	ASTNodeTypeNumberLiteral       ASTNodeType = "NumberLiteral"
	ASTNodeTypeStringLiteral       ASTNodeType = "StringLiteral"
	ASTNodeTypeCallExpression      ASTNodeType = "CallExpression"
	ASTNodeTypeExpressionStatement ASTNodeType = "ExpressionStatement"
)

type Callee struct {
	calleeType string
	name       string
}

type ASTNode struct {
	nodeType   ASTNodeType
	value      string
	callee     Callee
	expression *ASTNode
	params     []*ASTNode

	// reference from old ast to new ast
	context *[]*ASTNode
}

type Methods struct {
	enter func(*ASTNode, *ASTNode)
	exit  func(*ASTNode, *ASTNode)
}

func Tokenizer(input string) []Token {
	current := 0
	tokens := make([]Token, 0)
	for current < len(input) {
		char := input[current]
		charStr := string(char)
		if charStr == "(" || charStr == ")" {
			tokens = append(tokens, Token{TokenTypeParen, charStr})
			current++
			continue
		}

		charRune := rune(char)
		if unicode.IsSpace(charRune) {
			current++
			continue
		}

		if unicode.IsDigit(charRune) {
			value := ""
			for unicode.IsDigit(rune(char)) {
				value = value + string(char)
				current++
				char = input[current]
			}
			tokens = append(tokens, Token{TokenTypeNumber, value})
			continue
		}

		if charStr == "\"" {
			value := ""
			// skip opening parenthesis
			current++
			char = input[current]

			for string(char) != "\"" {
				value = value + string(char)
				current++
				char = input[current]
			}

			// skip closing parenthesis
			current++
			char = input[current]

			tokens = append(tokens, Token{TokenTypeString, value})
			continue
		}

		if unicode.IsLetter(charRune) {
			value := ""
			for unicode.IsLetter(rune(char)) {
				value = value + string(char)
				current++
				char = input[current]
			}
			tokens = append(tokens, Token{TokenTypeName, value})
			continue
		}

	}
	return tokens
}

func Parser(tokens []Token) ASTNode {
	current := 0

	// recursively
	var walk func() ASTNode
	walk = func() ASTNode {
		token := tokens[current]

		if token.tokenType == TokenTypeNumber {
			current++
			return ASTNode{
				nodeType: ASTNodeTypeNumberLiteral,
				value:    token.value,
			}
		}

		if token.tokenType == TokenTypeString {
			current++
			return ASTNode{
				nodeType: ASTNodeTypeStringLiteral,
				value:    token.value,
			}
		}

		if token.tokenType == TokenTypeParen && token.value == "(" {
			// skip opening
			current++
			token = tokens[current]

			node := ASTNode{
				nodeType: ASTNodeTypeCallExpression,
				value:    token.value,
				params:   []*ASTNode{},
			}
			// skip name token
			current++
			token = tokens[current]

			for token.tokenType != TokenTypeParen || (token.tokenType == TokenTypeParen && token.value != ")") {
				tmp := walk()
				node.params = append(node.params, &tmp)
				token = tokens[current]
			}

			// skip closing
			current++
			return node
		}

		// Should not get here
		return ASTNode{}
	}

	ast := ASTNode{
		nodeType: ASTNodeTypeProgram,
	}
	for current < len(tokens) {
		tmp := walk()
		ast.params = append(ast.params, &tmp)
	}
	return ast
}

func Traverser(ast *ASTNode, visitor map[ASTNodeType]Methods) {
	var traverseNode func(*ASTNode, *ASTNode)
	var traverseArray func([]*ASTNode, *ASTNode)

	traverseArray = func(array []*ASTNode, parent *ASTNode) {
		for i := 0; i < len(array); i++ {
			traverseNode(array[i], parent)
		}
	}

	traverseNode = func(node *ASTNode, parent *ASTNode) {
		methods := visitor[node.nodeType]
		if methods.enter != nil {
			methods.enter(node, parent)
		}
		switch node.nodeType {
		case ASTNodeTypeProgram, ASTNodeTypeCallExpression:
			traverseArray(node.params, node)
		case ASTNodeTypeNumberLiteral, ASTNodeTypeStringLiteral, ASTNodeTypeExpressionStatement:
			break
		}
		if methods.exit != nil {
			methods.exit(node, parent)
		}
	}

	traverseNode(ast, nil)
}

func Transformer(ast *ASTNode) ASTNode {
	newAst := ASTNode{
		nodeType: ASTNodeTypeProgram,
		params:   []*ASTNode{},
	}

	// so we can push nodes to parent's context
	ast.context = &newAst.params

	Traverser(ast, map[ASTNodeType]Methods{
		ASTNodeTypeNumberLiteral: Methods{
			enter: func(node *ASTNode, parent *ASTNode) {
				tmp := ASTNode{
					nodeType: ASTNodeTypeNumberLiteral,
					value:    node.value,
				}
				*parent.context = append(*parent.context, &tmp)
			},
		},
		ASTNodeTypeStringLiteral: Methods{
			enter: func(node *ASTNode, parent *ASTNode) {
				tmp := ASTNode{
					nodeType: ASTNodeTypeStringLiteral,
					value:    node.value,
				}
				*parent.context = append(*parent.context, &tmp)
			},
		},
		ASTNodeTypeCallExpression: Methods{
			enter: func(node *ASTNode, parent *ASTNode) {
				expression := ASTNode{
					nodeType: ASTNodeTypeCallExpression,
					callee:   Callee{"Identifier", node.value},
					params:   []*ASTNode{},
				}

				// context of CallExpression refer to express's params so
				// that we can push parameters
				node.context = &expression.params

				if parent.nodeType != ASTNodeTypeCallExpression {
					// if not CallExpression, we need to wrap
					newExpression := ASTNode{
						nodeType:   ASTNodeTypeExpressionStatement,
						expression: &expression,
					}
					*parent.context = append(*parent.context, &newExpression)
					return
				}

				*parent.context = append(*parent.context, &expression)
			},
		},
	})

	return newAst
}

func CodeGenerator(node ASTNode) string {
	switch node.nodeType {
	case ASTNodeTypeProgram:
		res := []string{}
		for _, param := range node.params {
			res = append(res, CodeGenerator(*param))
		}
		return strings.Join(res, "\n")

	case ASTNodeTypeExpressionStatement:
		return CodeGenerator(*node.expression) + ";"

	case ASTNodeTypeCallExpression:
		params := []string{}
		for _, param := range node.params {
			params = append(params, CodeGenerator(*param))
		}
		return node.callee.name + "(" + strings.Join(params, ", ") + ")"

	case ASTNodeTypeNumberLiteral:
		return node.value

	case ASTNodeTypeStringLiteral:
		return "\"" + node.value + "\""

	default:
		return ""
	}
}

func Compiler(input string) string {
	tokens := Tokenizer(input)
	ast := Parser(tokens)
	newAst := Transformer(&ast)
	output := CodeGenerator(newAst)
	return output
}
