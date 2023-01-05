example(of: "Linking node") {
  let node1 = Node(value: 1)
  let node2 = Node(value: 2)
  let node3 = Node(value: 3)
  
  node1.next = node2
  node2.next = node3
  
  print(node1)
}

example(of: "Push") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print(list)
}

example(of: "Append") {
  var list = LinkedList<Double>()
  list.append(1.0)
  list.append(2.0)
  list.append(3.0)
  print(list)
}

example(of: "Insert") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in stride(from: 1, through: 4, by: 1) {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}

example(of: "pop") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before popping list: \(list)")
  let poppedValue = list.pop()
  print("After popping list: \(list)")
  print("Popped value: " + String(describing: poppedValue))
}
