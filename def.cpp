#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

void *printEvenNum(int arg)
{
    int count = 0;
    while(count < arg)
    {
            printf("Event");
            count++;
    }
    pthread_exit(0);
}
void *printOddNum(int arg)
{
 int count  = 0;
    while(count < arg)
    {
            printf("Festival\n");
            count++;
    }
    printf("\n");
    pthread_exit(0);
}
int main()
{
    pthread_t t1;
    pthread_t t2;
    pthread_create(&t1, 0, &printEvenNum, 5);
    pthread_create(&t2, 0, &printOddNum, 5);
    pthread_join(t1, 0);
    pthread_join(t2, 0);
    return  0;
}
