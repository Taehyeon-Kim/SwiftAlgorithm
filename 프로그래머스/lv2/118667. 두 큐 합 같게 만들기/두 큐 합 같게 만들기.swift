import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var (q1, q2) = (queue1, queue2)
    var (asum, bsum) = (q1.reduce(0,+), q2.reduce(0,+))
    var (aidx, bidx) = (0, 0)
    var cnt = 0
    
    if asum == bsum { return cnt }

    while true {
        if q1.count >= queue1.count * 2 { return -1 }
        if asum == bsum { return cnt }
        
        if asum > bsum {
            let a = q1[aidx]
            aidx += 1
            q2.append(a)
            asum -= a
            bsum += a
            cnt += 1
        } else {
            let b = q2[bidx]
            bidx += 1
            q1.append(b)
            asum += b
            bsum -= b
            cnt += 1
        }
    }
}