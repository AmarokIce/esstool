module esstool.csvbuilder;

public class CSVBuilder
{
    public string[][string] table;
    private string[] keys;

    this()
    {
    }

    public void add(string key, string value)
    {
        import esstool.arrayutil : len;

        orCreate(key);
        this.addAt(key, value, len(this.table[key]));
    }

    public void addAt(string key, string value, int index)
    {
        import esstool.arrayutil : expandAndInsert;

        orCreate(key);
        this.table[key] = expandAndInsert(this.table[key], value, index, "");
    }

    public void build(string file)
    {
        import std.file : write;
        import esstool : StringBuilder;

        StringBuilder builder = new StringBuilder();

        auto keys = this.keys;
        foreach (string key; keys)
        {
            builder.append(key).append(",");
        }

        builder.removeLast().appendNewLine();

        for (int i = 0; i < this.tableLength(); i++)
        {
            foreach (string key; keys)
            {
                string[] arr = this.table[key];
                if (arr.length > i)
                {
                    string value = arr[i];
                    builder.append(value);
                }

                builder.append(",");
            }

            builder.removeLast().appendNewLine();
        }

        write(file, builder.asString());
    }

    public int tableLength()
    {
        import esstool.arrayutil : len;

        int max = 0;
        foreach (string key; this.keys)
        {
            int size = len(this.table[key]);
            if (size > max)
            {
                max = size;
            }
        }

        return max;
    }

    private void orCreate(string key)
    {
        import esstool.arrayutil : contains;

        if (contains(this.keys, key))
        {
            return;
        }

        this.keys ~= key;
        this.table[key] = new string[0];

    }
}
