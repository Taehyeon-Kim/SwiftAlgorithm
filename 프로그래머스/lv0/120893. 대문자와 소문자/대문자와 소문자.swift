import Foundation

func solution(_ my_string:String) -> String {
    return my_string.map { $0.asciiValue! >= 65 && $0.asciiValue! <= 90 ? $0.lowercased() : $0.uppercased() }.joined()
}