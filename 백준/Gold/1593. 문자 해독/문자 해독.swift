func toASCII(_ x: Character) -> Int {
  let n = Int(x.asciiValue!)
  return n < 97 ? n - 65 : n - 97 + 26
}

let gs = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (g,s) = (gs[0],gs[1])

let W = Array(readLine()!)
let S = Array(readLine()!)

var pattern: UInt64 = 0
for w in W {
  pattern += 1 << toASCII(w)
}

var cnt: UInt64 = 0
for i in 0..<g {
  cnt += 1 << toASCII(S[i])
}

var ans = cnt == pattern ? 1 : 0

for idx in stride(from: g, to: s, by: 1) {
  cnt += 1 << toASCII(S[idx])
  cnt -= 1 << toASCII(S[idx-g])
  ans += cnt == pattern ? 1 : 0
}

print(ans)