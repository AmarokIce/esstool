module app;

import esstool : CSVBuilder;

void main(string[] args)
{
    auto builder = new CSVBuilder();

    builder.add("test1", "value1");
    builder.add("test1", "value2");
    builder.add("test1", "value3");
    builder.add("test1", "value4");
    builder.add("test1", "value5");

    builder.add("test2", "value1");
    builder.add("test2", "value2");
    builder.add("test2", "value3");
    builder.add("test2", "value4");
    builder.add("test2", "value5");
    builder.add("test2", "valueA");
    builder.add("test2", "valueB");
    builder.add("test2", "valueC");
    builder.add("test2", "valueD");

    builder.add("test3", "valueTest");
    builder.add("test3", "valueTest");
    builder.add("test3", "valueTest");

    builder.build("./.test/test.csv");
}
