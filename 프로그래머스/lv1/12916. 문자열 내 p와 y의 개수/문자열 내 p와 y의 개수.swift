import Foundation

func solution(_ s:String) -> Bool
{
    let p = s.lowercased().filter { $0 == "p" }.count
    let y = s.lowercased().filter { $0 == "y" }.count
    return p == y
}