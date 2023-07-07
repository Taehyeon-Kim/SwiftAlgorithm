/*
1. 문제 파악
포켓몬 도감이 있고, 도감을 바탕으로 문제(숫자 또는 이름)가 주어졌을 때 대응하는 답을 하면 문제

2. 전략 수립
숫자와 이름이 일대일 대응이 되어야 함
NM이 각각 최대 100,000이기 때문에 이중 forloop 불가
딕셔너리 2개 만들어서 풀어도 될 것 같음

3. 손코딩
int nm <- input
string a <- input   : 도감
string lst <- input : 문제

dict1 <- [int: string]
dict2 <- [string: int]

for i in 1...n {
  dict1[i, default: ""] = a[i-1]
  dict2[a[i-1], default: 0] = i
}

for key in lst {
  if let num = Int(key) {
    print(dict1[num]!)    
  } else {
    print(dict2[key]!)
  }
}

11m
*/

let nm = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,m) = (nm[0],nm[1])

var a = [String]()
for _ in 0..<n {
  a.append(readLine()!)
}

var lst = [String]()
for _ in 0..<m {
  lst.append(readLine()!)
}

var dict1: [Int: String] = [:]
var dict2: [String: Int] = [:]

for i in 1...n {
  dict1[i, default: ""] = a[i-1]
  dict2[a[i-1], default: 0] = i
}

for key in lst {
  if let num = Int(key) {
    print(dict1[num]!)
  } else {
    print(dict2[key]!)
  }
}