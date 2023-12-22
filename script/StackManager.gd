extends Node

class_name Stack

var stack1 = []
var stack2 = []
var stack3 = []
var stack4 = []

func push1(item):
   stack1.push_front(item)
   
func pop1():
   return stack1.pop_front()

func push2(item):
   stack2.push_front(item)
   
func pop2():
   return stack2.pop_front()

func push3(item):
   stack3.push_front(item)
   
func pop3():
   return stack3.pop_front()

func push4(item):
   stack4.push_front(item)
   
func pop4():
   return stack4.pop_front()
