#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <bits/stdc++.h>
using namespace std;
struct arg_struct {
    int arg1;
};

void *printEvenNum(void *arguments)
{
    struct arg_struct *args = (struct arg_struct *)args;
    int count = 0;
    while(count < args -> arg1)
    {
            printf("Event\n");
            count++;
    }
    pthread_exit(0);
}
void *printOddNum(void *arguments)
{
    struct arg_struct *args = (struct arg_struct *)args;
    int count = 0;
    while(count < args -> arg1)
    {
            printf("Festival\n");
            count++;
    }
    printf("\n");
    pthread_exit(0);
}
int main()
{
    cout << "fbsgy";
    pthread_t t1;
    pthread_t t2;
    cout << "FBer";
    struct arg_struct args1, args2;
    args1.arg1 = 0;
    args2.arg1 = 1;
    pthread_create(&t1, 0, printEvenNum, (void *)&args1);
    cout << "sfs";
    pthread_create(&t2, 0, printOddNum, (void *)&args2);
    cout << "Ger";
    pthread_join(t1, 0);
    pthread_join(t2, 0);
    return  0;
}
