module arrayutil;

import errors;

T[] copy(T)(T[] origin, int start, int end)
{
	if (end < start)
		throw new IllegalArgumentError("The end cannot bigger than start!");

	int size = end - start;
	if (end > len(origin))
		throw new IllegalArgumentError("The end cannot bigger than arror origin!");
	T[] target = new T[size];
	for (int i = start; i < size; i++)
	{
		target[i] = origin[start + i];
	}

	return target;
}

T[] copy(T)(T[] origin)
{
	return copy(origin, 0, len(origin));
}

bool contains(T)(T[] array, T obj)
{
	foreach (T o; array)
	{
		if (o == obj)
		{
			return true;
		}
	}

	return false;
}

int len(T)(T[] obj)
{
	import std;
	return to!int(obj.length);
}
