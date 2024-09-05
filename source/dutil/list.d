module dutil.list;

interface List(T)
{
    public void add(T value);
    public T get(int index);
    public T remove(int index);
    public T pop(T value);
    public int getSize();
}
