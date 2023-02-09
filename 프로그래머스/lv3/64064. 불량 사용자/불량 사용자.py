from itertools import permutations

def check(user, ban):
    if len(user) != len(ban): # 길이 다르면 비교X
        return False
    else:
        for i, j in zip(user, ban):
            if j == '*':
                continue
            if i != j:
                return False
        return True

def solution(user_id, banned_id):
    answer = []
    
    for i in permutations(user_id, len(banned_id)):
        count = 0
        for a, b in zip(i, banned_id):
            # print(a, b)
            if check(a, b):
                count += 1
        
        if count == len(banned_id):
            if set(i) not in answer:
                answer.append(set(i))
    
    return len(answer)