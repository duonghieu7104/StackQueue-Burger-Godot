extends Node

var n
var sprite_queue = []
var sprite_queue2 = []
var front = -1
var rear = -1

func enqueue_sprite(sprite):
	if not sprite_queue.is_empty():
		return
	elif front == -1:
		front = 0
		rear = 0
	else:
		rear = (rear + 1)
	sprite_queue[rear] = sprite

func dequeue_sprite():
	if front == -1:
		return
	var value = sprite_queue[front]
	if front == rear:
		front = -1
		rear = -1
	else:
		front = (front + 1)
	return value

func enqueue_sprite2(sprite):
	if not sprite_queue2.is_empty():
		return
	elif front == -1:
		front = 0
		rear = 0
	else:
		rear = (rear + 1)
	sprite_queue2[rear] = sprite

func dequeue_sprite2():
	if front == -1:
		return
	var value = sprite_queue2[front]
	if front == rear:
		front = -1
		rear = -1
	else:
		front = (front + 1)
	return value
