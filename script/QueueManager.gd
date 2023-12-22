extends Node

class_name QueueManager

var sprite_queue = []
var sprite_queue2 = []

func enqueue_sprite(sprite):
	sprite_queue.push_back(sprite)

func dequeue_sprite():
	return sprite_queue.pop_front()

func enqueue_sprite2(sprite):
	sprite_queue2.push_back(sprite)
	print("Added Queue")

func dequeue_sprite2():
	return sprite_queue2.pop_front()
