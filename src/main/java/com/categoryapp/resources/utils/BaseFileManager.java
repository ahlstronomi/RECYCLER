package com.categoryapp.resources.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

public abstract class BaseFileManager implements FileManager {

    @Override
    public String storageFilePath() {
        return "";
    }

    @Override
    public boolean isFileNameExisted(String fileName) {
        String filePath = storageFilePath() + fileName;
        File file = new File(filePath);
        return file.exists();
    }

    @Override
    public void writeFileToDisk(InputStream inputStream, String fileName, boolean forceWrite) throws IOException {
        
        if (isFileNameExisted(fileName) && forceWrite == false) {
            return;
        }
        
        if (fileName == null || fileName.equals("")) {
            throw new IOException();
        }
        
        OutputStream outputStream = null;
        String filePath = storageFilePath() + fileName;
        
        outputStream = new FileOutputStream(new File(filePath));
        
        int read = 0;
        byte[] bytes = new byte[1024];
        
        while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
        }
        
        outputStream.flush();
        outputStream.close(); 
    }
    
    @Override
    public String getFileNameWithoutExtension(String fileName) {
        if (fileName == null || fileName.equals("")) {
            return null;
        }
        
        return fileName.substring(0, fileName.lastIndexOf("."));
    }
    
    @Override
    public String getFileExtension(String fileName) {
        try {
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        } catch (Exception e) {
            return null;
        }
    }
}

