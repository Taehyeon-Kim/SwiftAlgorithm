#include <bits/stdc++.h>
using namespace std;
string s, ret;
int cnt[200], flag;
char mid;
int main() {
    // Counting
    cin >> s;
    for(char a : s) cnt[a]++;
    for(int i='Z'; i>='A';i--) {
        // 1개 이상
        if(cnt[i]) {
            // 홀수라면
            if(cnt[i] & 1) {
                mid = char(i); flag++;
                cnt[i]--;
            }
            
            // 홀수 2개 이상이면 불가능
            if(flag == 2) break;
            
            // 2개씩 앞뒤로 붙이기
            for(int j=0; j<cnt[i]; j+=2) {
                ret = char(i) + ret;
                ret += char(i);
            }
        }
    }
    if(mid)ret.insert(ret.begin() + ret.size() / 2, mid);
    if(flag == 2) cout << "I'm Sorry Hansoo\n";
    else cout << ret << "\n";
}