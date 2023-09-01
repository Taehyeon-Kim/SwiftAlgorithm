/*
1. 완전탐색 -> 팩토리얼 너무 큼
2. 선형탐색 -> 10억 너무 큼
3. 관찰(나눠보고, 적어보고...), 히스토그램

*/

let tc = Int(readLine()!)!

for _ in 0..<tc {
  let a = Int(readLine()!)!

  var counter2 = 1
  var counter5 = 1

  var ret2 = 0
  var ret5 = 0

  while counter2 <= a {
    counter2 *= 2
    ret2 += a/counter2
  }

  while counter5 <= a {
    counter5 *= 5
    ret5 += a/counter5
  }

  print(ret5)
}