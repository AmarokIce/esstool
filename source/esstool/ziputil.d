module esstool.ziputil;

import std.zip;
import std.file;
import std.string;

public class ZipCaches
{
    ZipArchive archive = new ZipArchive();

    public void addFile(string filepath, string path = "", CompressionMethod compress = CompressionMethod
            .none)
    {
        if (!exists(filepath) || !isFile(filepath))
        {
            throw new FileException("The file not exits!");
        }

        ArchiveMember cache = new ArchiveMember();
        cache.compressionMethod = compress;

        cache.name = path ~ "/" ~ filepath.split("/")[$];
        cache.expandedData(cast(ubyte[]) read(filepath));

        archive.addMember(cache);
    }

    public void addDirectory(string directory, string basePath = "",
        CompressionMethod compress = CompressionMethod.none)
    {
        if (!exists(directory) || !isDir(directory))
        {
            throw new FileException("Dir not exits!");
        }

        foreach (DirEntry dir; dirEntries(directory, SpanMode.depth))
        {
            if (!dir.isFile())
            {
                continue;
            }

            addFile(dir, basePath);
        }
    }

    public void createZip(string zipName)
    {
        void[] compressed_data = this.archive.build();
        write(zipName, compressed_data);
    }
}
