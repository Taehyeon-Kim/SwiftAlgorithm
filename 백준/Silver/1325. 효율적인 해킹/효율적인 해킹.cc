#include <cstdio>
#include <vector>
#include <cstring>
#define MAX 10001

using namespace std;

int N, M;
int maximum, cnt;

vector<int> computer[MAX];
int counter[MAX];
bool visited[MAX];

void DFS(int num, int start);

int main(void) {
    scanf("%d %d", &N, &M);

    for(int i = 0; i < M; i++) {
        int num1, num2;
        scanf("%d %d", &num1, &num2);

        computer[num2].push_back(num1);
    }

    for(int i = 1; i <= N; i++) {
        memset(visited, false, N + 1);
        cnt = 0;
        DFS(i, i);
        maximum = (counter[i] > maximum ? counter[i] : maximum);
    }

    for(int i = 1; i <= N; i++) {
        if(counter[i] == maximum)
            printf("%d ", i);
    }
    printf("\n");
    return 0;
}

void DFS(int num, int start) {
    visited[num] = true;
    int len = computer[num].size();

    for(int i = 0; i < len; i++) {
        int next = computer[num][i];

        if(!visited[next]) {
            cnt++;
            DFS(next, start);
        }
    }

    counter[start] = (counter[start] > cnt ? counter[start] : cnt);
}