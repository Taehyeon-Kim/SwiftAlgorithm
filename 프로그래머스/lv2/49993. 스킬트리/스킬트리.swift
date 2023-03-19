import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var priority: [Character: Int] = [:]
    for (idx, alphabet) in skill.enumerated() {
        priority[alphabet, default: -1] = idx
    }
    
    var newSkillTree: [String] = []
    var count = 0
    
    for skills in skill_trees {
        var newSkill = ""
        for ch in skills {
            if !skill.contains(ch) { continue }
            newSkill += String(ch)
        }

        if String(skill.prefix(newSkill.count)) == newSkill {
            count += 1
        }
    }
    
    return count
}