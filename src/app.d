module app;

import std;

void main()
{
    import arrayutil;

    int[] arr = new int[11];
    for (int i = 0; i < 11; i++)
    {
        arr[i] = i;
    }
    writeln(arrayutil.copy(arr));
}
