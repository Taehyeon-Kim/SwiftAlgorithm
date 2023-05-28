import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    var aNum = arrayA[0]
    for a in arrayA {
        aNum = gcd(aNum, a)
    }

    var bNum = arrayB[0] 
    for b in arrayB {
        bNum = gcd(bNum, b)
    }
    
    for b in arrayB {
        if b % aNum == 0 { aNum = 0; break }
    }
    
    for a in arrayA {
        if a % bNum == 0 { bNum = 0; break }
    }

    if aNum == 0 && bNum == 0 {
        return 0
    } else {
        return max(aNum, bNum)
    }
}