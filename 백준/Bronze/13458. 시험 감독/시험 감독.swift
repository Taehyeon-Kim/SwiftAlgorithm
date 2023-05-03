// 총감독관으로 감시가능한지 먼저 체크
// 남은 인원에 대해서 부감독관 몇명체크할지 계산
// O(n)으로 풀이 가능

let n = Int(readLine()!)!
var students = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let bc = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (b, c) = (bc[0], bc[1])

func manager(for student: Int) -> Int {
  let student = student - b
  var ret = 1
  
  if student <= 0 {
    return ret
  }

  if student % c == 0 {
    ret += student / c
  } else {
    ret += student / c + 1
  }
  
  return ret
}

let managers = students.map(manager)
print(managers.reduce(0,+))