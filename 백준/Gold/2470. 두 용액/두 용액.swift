let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").compactMap {Int(String($0))}
arr = arr.sorted()

var (left, right) = (0, n-1)
var sums = arr[left] + arr[n-1]
var ab = abs(sums)
var ans = [arr[left], arr[right]]

while left < right - 1 {
    if sums > 0 {
        right -= 1
    } else {
        left += 1
    }
    
    sums = arr[left] + arr[right]
  
    if abs(sums) < ab {
        ans[0] = arr[left]
        ans[1] = arr[right]
        ab = abs(sums)
    }
}

print(ans[0], ans[1])