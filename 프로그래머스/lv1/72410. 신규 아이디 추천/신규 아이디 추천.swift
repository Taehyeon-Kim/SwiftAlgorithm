import Foundation

extension String {
    func removed() -> String {
        var str = ""
        for s in Array(self) {
            let ascii = s.asciiValue!
            if ascii >= 97 && ascii <= 122 { str += String(s) }
            if ascii >= 48 && ascii <= 57 { str += String(s) }
            if ["-", "_", "."].contains(s) { str += String(s) }
        }
        return str
    }

    // .. -> . , ... -> .. -> .
    func reducePoint() -> String {
        var stack = [String]()
        
        for str in self.map { String($0) } {
            if stack.isEmpty { stack.append(str) }
            else if stack.last! == "." && str == "." {
                stack.popLast()!
                stack.append(str)
            } else {
                stack.append(str)
            }
        }
        
        if !stack.isEmpty {
            if let first = stack.first, first == "." {
                stack.removeFirst()
            }
            if let last = stack.last, last == "." {
                stack.popLast()!
            }
        }
        
        return stack.joined()
    }

    func adjustLength() -> String {
        var str = self
        if str == "" { 
            str += "a"
        }
        
        if self.count >= 16 { 
            return self.map {String($0)}[0..<15].joined().reducePoint()
        }
        return str
    }

    func increaseToMin() -> String {
        var str = self
        if str.count <= 2 {
            for i in 0..<(3 - str.count) {
                let last = self.map{String($0)}.last!
                str += last    
            }
        }
        return str
    }
}

func solution(_ new_id:String) -> String {
    
    let str = new_id
    .lowercased()
    .removed()
    .reducePoint()
    .adjustLength()
    .increaseToMin()
    
    return str
}