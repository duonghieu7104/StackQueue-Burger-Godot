extends Node


class node:
	var data 
	var next 

	
	func _init(data):
		self.data = data
		self.next = null


class stack:
	var head 

	
	func _init():
		self.head = null

	
	func is_empty():
		return self.head == null

	
	func push(data):
		var new_node = node.new(data) 
		if self.is_empty(): 
			self.head = new_node 
		else: 
			new_node.next = self.head 
			self.head = new_node 

	
	func pop():
		if self.is_empty(): 
			return null
		else: 
			var data = self.head.data 
			self.head = self.head.next 
			return data 

	
	func top():
		if self.is_empty(): 
			return null
		else: 
			return self.head.data

	
	func destroy():
		while not self.is_empty(): 
			self.pop() 

var stack1 = stack.new()
var stack2 = stack.new()
var stack3 = stack.new()
var count = 0
