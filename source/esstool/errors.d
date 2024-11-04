module esstool.errors;

class RuntimeError : Error
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}

class IllegalArgumentError : RuntimeError
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}

class IllegalAccessError : RuntimeError
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}

class IllegalAskError : RuntimeError
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}

class InstanceError : RuntimeError
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}

class IllegalInstanceError : IllegalAccessError
{
    @nogc @safe pure nothrow this(string msg)
    {
        super(msg);
    }

    @nogc @safe pure nothrow this(string msg, string file, size_t line)
    {
        super(msg, file, line);
    }
}
