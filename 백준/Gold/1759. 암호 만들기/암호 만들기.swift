/*
4 6
a t c i s w
*/

let lc = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (l, c) = (lc[0], lc[1])

// 알파벳 정렬(사전식으로 출력해야 함)
var alphabets = readLine()!.split(separator: " ").map{String($0)}
alphabets.sort()

var used = Array(repeating: false, count: c)  // 사용 여부 체크하는 배열
var ret = Set<String>()
let vowels = Set(["a", "e", "i", "o", "u"])   // 모음 집합

func check(_ str: String) -> Bool {
  var hasVowel = false  // 모음 개수 판단
  var consCount = 0  // 자음 개수 판단
  
  for ch in str {
    if hasVowel && consCount >= 2 {
      return true
    }
    
    if vowels.contains(String(ch)) {
      hasVowel = true
    } else {
      consCount += 1
    }
  }

  return hasVowel && consCount >= 2
}

func dfs(_ str: String, _ idx: Int) {
  // base condition
  // 조건 만족하는 것만 출력하면서 return
  if str.count == l && check(str) {
    print(str)
    return
  }

  for i in idx..<c {
    if used[i] { continue }
    
    used[i] = true
    dfs(str + alphabets[i], i)  // 자꾸 i 대신에 idx를 넣어서 시간이 너무 많이 소요됐다.
    used[i] = false
  }
}

dfs("", 0)