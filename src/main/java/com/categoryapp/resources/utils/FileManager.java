package com.categoryapp.resources.utils;

import java.io.IOException;
import java.io.InputStream;

public interface FileManager {
    
    public String storageFilePath();
    
    public boolean isFileNameExisted(String fileName);
    
    public void writeFileToDisk(InputStream inputStream, String fileName, boolean forceWrite) throws IOException;
    
    public String getFileNameWithoutExtension(String fileName);
    
    public String getFileExtension(String fileName);
}
