#include <bits/stdc++.h>
using namespace std;
const int INF = 987654321;
int n, m, h, a, b, ret = INF, visited[34][34];
bool check(){
    for(int i = 1; i <= n; i++){
        int start = i;
        for(int j = 1; j <= h; j++){
            if(visited[j][start])start++;
            else if(visited[j][start - 1])start--;
        }
        if(start != i) return false;
    }
    return true;
}
void go(int here, int cnt){ 
    if(cnt > 3 || cnt >= ret) return;
    if(check()){
        ret = min(ret, cnt); return;
    }
    for(int i = here; i <= h; i++){
        for(int j = 1; j <= n; j++){
            if(visited[i][j] || visited[i][j - 1] || visited[i][j + 1]) continue;
            visited[i][j] = 1;
            go(i, cnt + 1);
            visited[i][j] = 0;
        }
    }
}
int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
    cout.tie(NULL);
    cin >> n >> m >> h;
    for(int i = 0; i < m; i++){
        cin >> a >> b; visited[a][b] = 1;
    }
    go(1, 0);
    cout << ((ret == INF) ? -1 : ret) << "\n";
	return 0;
}