// logN의 시간복잡도로 최대공약수를 구할 수 있음
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    else { return gcd(b, a % b) }
}

// 전체의 수에 대해 최소공배수를 구하는 작업 O(NlgN)
func lcm(_ nums: [Int]) -> Int {
    var ret = nums[0]
    for i in stride(from: 1, to: nums.count, by: 1) {
        let div = gcd(ret, nums[i])
        ret = div * (ret/div) * (nums[i]/div)
    }
    return ret
}

func solution(_ arr:[Int]) -> Int {
    return lcm(arr)
}