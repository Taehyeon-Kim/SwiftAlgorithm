import sys
input = sys.stdin.readline

n = int(input())
liquids = list(map(int, input().split()))

left, right = 0, n-1
liquids.sort()
answer = [left, right]
m_val = 10e9

while left < right:
    s_val = liquids[left] + liquids[right]
    
    if abs(s_val) < m_val:
        answer = [left, right]
        m_val = abs(s_val)

    if s_val < 0:  # 음수
        left += 1
    else:
        right -= 1

print(liquids[answer[0]], liquids[answer[1]])