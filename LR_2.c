#include <stdio.h>

#define N 5
#define M 6

void FindPositiveAndNegativeNumbersCount(int n, int m, int* arr, int* positiveNumbersCount, int* negativeNumbersCount)
{
    for (int row = 0; row < n; row++)
    {
        for (int column = 0; column < m; column++)
        {
            if (arr[row * m + column] > 0)
            {
                (*positiveNumbersCount)++;
            }
            else if (arr[row * m + column] < 0)
            {
                (*negativeNumbersCount)++;
            }
        }
    }
}

int main(int argc, char** argv)
{
    int matrix[N][M] = { {-1, -1, -1,  1,  1,  1 }, 
                         { 1,  1,  1,  1,  1,  1 }, 
                         { 1,  1,  1,  1,  1,  1 }, 
                         { 1,  1,  1,  1,  1,  1 }, 
                         { 1,  1,  1,  1,  1,  1 } };

    int positiveNumbersCount = 0;
    int negativeNumbersCount = 0;

    FindPositiveAndNegativeNumbersCount(N, M, &matrix[0][0], &positiveNumbersCount, &negativeNumbersCount);

    printf("%d\n", positiveNumbersCount);
    printf("%d\n", negativeNumbersCount);

    return 0;
}



