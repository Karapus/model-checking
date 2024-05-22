--model of a linked circular list
sig Node {
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

pred deleteHead {	
	all n, pn : Node | pn.next = n and n = List.head
		=>	pn.next' = n.next
		and	List.head' = pn
		and	n' = none
}

pred listEmpty {
	no List.head
}

pred onlyOne {
	not listEmpty and List.head.next = List.head
}

assert one_is_deletable {
	deleteHead and after onlyOne  => listEmpty
}

assert always_deletable {
	deleteHead => eventually always listEmpty and always allReacheable
}

check always_deletable
