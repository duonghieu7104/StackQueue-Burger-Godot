extends Node

var n
var stack1 = []
var stack2 = []
var stack3 = []
var stack4 = []
var top = -1

func push1(sprite):
	if not stack1.is_empty():
		return
	elif top == -1:
		top = 0
	else:
		top = (top + 1)
	stack1[top] = sprite

func pop1():
	if top == -1:
		return
	var current = stack1[top]
	if top == 0:
		top = -1
	else:
		top = (top - 1)
	return current

func push2(sprite):
	if not stack2.is_empty():
		return
	elif top == -1:
		top = 0
	else:
		top = (top + 1)
	stack2[top] = sprite

func pop2():
	if top == -1:
		return
	var current = stack2[top]
	if top == 0:
		top = -1
	else:
		top = (top - 1)
	return current

func push3(sprite):
	if not stack3.is_empty():
		return
	elif top == -1:
		top = 0
	else:
		top = (top + 1)
	stack3[top] = sprite

func pop3():
	if top == -1:
		return
	var current = stack3[top]
	if top == 0:
		top = -1
	else:
		top = (top - 1)
	return current
