import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    return commands.map { cmd in
        return array[cmd[0]-1...cmd[1]-1].sorted()[cmd[2]-1]
    }
}