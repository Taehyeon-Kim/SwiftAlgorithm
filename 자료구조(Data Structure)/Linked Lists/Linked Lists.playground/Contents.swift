example(of: "Linking node") {
  let node1 = Node(1)
  let node2 = Node(2)
  let node3 = Node(3)
  
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

example(of: "removing the last node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()
  
  print("After removing last node: \(list)")
  print("Removed valud " + String(describing: removedValue))
}

example(of: "remove a particular node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before removing a particular index: \(list)")
  let index = 1
  let node = list.node(at: index - 1)!
  let removedValue = list.remove(after: node)
  
  print("After removing a particular index \(index): \(list)")
  print("Removed value: " + String(describing: removedValue))
}
