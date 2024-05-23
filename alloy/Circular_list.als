--model of a linked circular list
var sig Node {
	var next: one Node
}

one sig List {
	var head: lone Node
}

pred allReacheable {
	all n : Node | n in List.head.^next
}

fact init {
	allReacheable
}

pred listEmpty {
	no List.head
}

pred deleteHead {	
	List.head.(~next).next' = List.head.next
	(Node - List.head - List.head.(~next)).next' = (Node - List.head - List.head.(~next)).next
	List.head' = ((no Node - List.head) => none else List.head.next)
	Node' = Node - List.head
}

pred onlyOne {
	not listEmpty and List.head.next = List.head
}

assert one_is_deletable {
	always deleteHead and after onlyOne  => listEmpty
}

assert always_deletable {
	always deleteHead => eventually always listEmpty and always allReacheable
}
--run {allReacheable; allReacheable ; allReacheable} for exactly 3 steps
--run {deleteHead}
--check one_is_deletable
check always_deletable

