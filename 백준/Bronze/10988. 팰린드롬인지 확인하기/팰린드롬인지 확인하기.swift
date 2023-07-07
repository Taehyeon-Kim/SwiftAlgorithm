let str = readLine()!
let tmp = String(str.reversed()) // O(N)

if str == tmp {
    print(1)
} else {
    print(0)
}