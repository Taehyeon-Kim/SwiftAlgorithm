var n = Int(readLine()!)!
var i = 666

while true {
  if i.isDevilNumber() { n -= 1 }
  if n == 0 { print(i); break }
  i += 1
}

extension Int {
    func isDevilNumber() -> Bool {
        var number = self
        while number >= 666 {
            if number % 1000 == 666 {
                return true
            }
            number /= 10
        }
        return false
    }
}