extends Node


class node:
	var data
	var next

	
	func _init(data):
		self.data = data
		self.next = null



class queue:
	var head 
	var tail 

	
	func _init():
		self.head = null
		self.tail = null

	
	func is_empty():
		return self.head == null

	
	func enqueue(data):
		var new_node = node.new(data) 
		if self.is_empty():
			self.head = new_node 
			self.tail = new_node
		else: 
			self.tail.next = new_node 
			self.tail = new_node 

	
	func dequeue():
		if self.is_empty(): 
			return null
		else: 
			var data = self.head.data 
			self.head = self.head.next 
			if self.head == null: 
				self.tail = null 
			return data 

	
	func front():
		if self.is_empty(): 
			return null
		else: 
			return self.head.data

	
	func destroy():
		while not self.is_empty(): 
			self.dequeue() 

var queue1 = queue.new()
var queue2 = queue.new()
var count = 0
