module dutil.reader;

import dutil.arrayutil : count, len;

@safe unittest
{
    static void main(string[] args)
    {
        LineReader reader = new LineReader("./LICENSE");
        while (reader.readly())
        {
            writeln(reader.read());
        }
    }
}

class LineReader
{
    private ubyte[] bufferedArray;
    private ubyte[] buffered;

    this(string filePath)
    {
        import std.file : read, exists, isFile, FileException;

        if (!exists(filePath) || !isFile(filePath))
        {
            throw new FileException("The file not exits!");
        }

        this.bufferedArray = (cast(ubyte[]) read(filePath));
        itor();
    }

    public bool readly()
    {
        return len(this.buffered) > 0 || len(this.bufferedArray) > 0;
    }

    public ubyte[] readRaw()
    {
        const int len = len(buffered);
        ubyte[] bytes = new ubyte[len];

        for (int i = 0; i < len; i++)
        {
            bytes[i] = buffered[i];
        }

        itor();
        return bytes;
    }

    public string read()
    {
        import std.conv : to;
        import dutil.stringbuilder;

        StringBuilder builder = new StringBuilder();

        foreach (ubyte bt; this.buffered)
        {
            builder.append(to!char(bt));
        }

        itor();
        return builder.asString();
    }

    private void itor()
    {
        if (count(this.bufferedArray) > 0)
        {
            this.buffered = new ubyte[0];
        }

        import std.container : Array;

        auto bytes = Array!ubyte();
        int end = -1;

        for (int i = 0; i < len(this.bufferedArray); i++)
        {
            ubyte bt = this.bufferedArray[i];
            if (this.bufferedArray[i] == 13)
            {
                end = i;
                break;
            }

            bytes.insertBack(bt);
        }

        if (end == -1)
        {
            this.bufferedArray = new ubyte[0];
        }
        else
        {
            this.bufferedArray = this.bufferedArray[end + 2 .. $];
        }

        this.buffered = bytes.data();
    }
}
