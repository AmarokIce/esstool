module dutil.arrayutil;

import dutil.errors;

T[] copy(T)(T[] origin, int start, int end)
{
	if (end < start)
		throw new IllegalArgumentError("The end cannot bigger than start!");

	if (end > len(origin))
		throw new IllegalArgumentError("The end cannot bigger than arror origin!");

	return origin[start .. end];
}

T[] copy(T)(T[] origin)
{
	return copy(origin, 0, len(origin));
}

void copyTo(T)(T[] origin, T[] target, int start, int end)
{
	if (end < start)
		throw new IllegalArgumentError("The end cannot bigger than start!");

	if (end > len(origin))
		throw new IllegalArgumentError("The end cannot bigger than arror origin!");

	target[0 .. end - start] = origin[start .. end];
}

void copyTo(T)(T[] origin, T[] target)
{
	copyTo(origin, target, 0, len(origin));
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
	import std.conv : to;

	return to!int(obj.length);
}

int count(T)(T[] obj)
{
	import std.typecons;

	int counter = 0;
	foreach (T o; obj)
	{
		auto j = o.nullable;
		if (!j.isNull)
		{
			counter++;
		}
	}

	return counter;
}
