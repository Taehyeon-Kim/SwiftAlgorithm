import Foundation
// input
let n = Int(readLine()!)!
let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }

var answer = [arr[0], arr[n-1]] // 최초
var sum = arr[0] + arr[n-1]

var ab = abs(sum)
var lCur = 0, rCur = n-1

while lCur < rCur - 1 {
  if sum > 0 { 
    rCur -= 1 
  } else {
    lCur += 1
  }
    
  sum = arr[lCur] + arr[rCur]

  if ab >= abs(sum) {
    ab = abs(sum)
    answer[0] = arr[lCur]
    answer[1] = arr[rCur]
  }
}

print(answer[0], answer[1])