module dutil.stringbuilder;

import dutil;
import std.conv : to;

class StringBuilder
{
	private string strbuffered = "";
	this()
	{
	}

	this(string def)
	{
		this.strbuffered = def;
	}

	public StringBuilder append(byte b)
	{
		return this(to!char(b));
	}

	public StringBuilder append(ubyte b)
	{
		return this(to!char(b));
	}

	public StringBuilder append(char c)
	{
		this.strbuffered ~= c;
		return this;
	}

	public StringBuilder append(string s)
	{
		this.strbuffered ~= s;
		return this;
	}

	public StringBuilder append(int i)
	{
		this.strbuffered ~= i;
		return this;
	}

	public StringBuilder append(uint i)
	{
		this.strbuffered ~= i;
		return this;
	}

	public StringBuilder append(float f)
	{
		this.strbuffered ~= to!string(f);
		return this;
	}

	public StringBuilder append(double d)
	{
		this.strbuffered ~= to!string(d);
		return this;
	}

	public StringBuilder clean()
	{
		this.strbuffered = "";
		return this;
	}

	public StringBuilder appendNewLine()
	{
		this.strbuffered ~= "\r\n";
		return this;
	}

	public int indexOf(string str)
	{
		int index = 0;
		int startAt = 0;
		int maxIndex = len(str) - 1;

		for (int i = 0; i < len(this.strbuffered); i++)
		{
			char c = this.strbuffered[i];
			char pChar = str[index];
			if (c != pChar)
			{
				index = 0;
				continue;
			}

			if (index++ == 0)
			{
				startAt = i;
			}

			if (index == maxIndex)
			{
				return startAt;
			}
		}

		return -1;
	}

	public StringBuilder replaceFirst(string oldStr, string newStr)
	{
		int startAt = this.indexOf(oldStr);
		if (startAt == -1)
		{
			return this;
		}

		int endAt = startAt + len(oldStr);

		string head = this.strbuffered[0 .. startAt - 1];
		string end = this.strbuffered[endAt .. $ - 1];

		this.strbuffered = "";
		this.append(head).append(newStr).append(end);

		return this;
	}

	public StringBuilder remove(char s)
	{
		string newStr = "";
		for (int i = 0; i < len(this.strbuffered); i++)
		{
			char c = this.strbuffered[i];
			if (c == s)
			{
				continue;
			}

			newStr ~= c;
		}

		this.strbuffered = newStr;
		return this;
	}

	public string asString()
	{
		return this.strbuffered;
	}
}
