module dutil.ziputil;

import std.zip;
import std.file;

class ZipCaches
{
    ZipArchive archive = ZipArchive();

    public void add_file(string filepath, string path = "", CompressionMethod compress = CompressionMethod
            .none)
    {
        if (!exists(filepath) || !isFile(filepath))
        {
            throw FileException;
        }

        ArchiveMember cache = ArchiveMember;
        cache.compressionMethod = compress;

        cache.name = path ~ "/" ~ filepath.split("/")[$];
        cache.expandedData(cast(ubyte[]) read(filepath));

        archive.addMember(cache);
    }

    public void add_directory(string directory, string basePath = "",
        CompressionMethod compress = CompressionMethod.none)
    {
        if (!exists(filepath) || !isDir(filepath))
        {
            throw FileException;
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

    public void create_zip(string zipName)
    {
        void[] compressed_data = zip.build();
        write(zipName, compressed_data);
    }
}
