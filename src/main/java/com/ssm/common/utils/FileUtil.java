package com.ssm.common.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * @version 创建时间：Mar 20, 2008 11:34:10 PM
 */
public class FileUtil
{
    
    public static void deleteFile(String path)
    {
        if (path != null && path.length() > 0)
        {
            File file = new File(path);
            if (file.exists())
            {
                file.delete();
            }
        }
    }
    
    public static void deleteAttFile(File file, String path)
    {
        if (!StringUtils.isEmpty(path))
        {
            File f = new File(file, path);
            if (f.exists())
            {
                f.delete();
            }
            File initFile = new File(file, "init/" + path);
            if (initFile.exists())
            {
                initFile.delete();
            }
        }
    }
    
    public static boolean write(File file, String content)
    {
        if (!file.exists())
        {
            file.getParentFile().mkdirs();
        }
        try
        {
            FileWriter fw = new FileWriter(file);
            BufferedWriter write = new BufferedWriter(fw);
            write.write(content);
            write.close();
            fw.close();
            return true;
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean write(File file, String content, String charset)
    {
        if (!file.exists())
        {
            file.getParentFile().mkdirs();
        }
        try
        {
            OutputStream fw = new FileOutputStream(file);
            OutputStreamWriter write = new OutputStreamWriter(fw, charset);
            write.write(content);
            write.close();
            fw.close();
            return true;
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return false;
    }
    
    public static String read(File file)
    {
        if (!file.exists())
        {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        Reader fis = null;
        try
        {
            fis = new InputStreamReader(new FileInputStream(file));
            char[] buf = new char[4 * 1024]; // 4K
            int n;
            while ((n = fis.read(buf)) != -1)
            {
                sb.append(buf, 0, n);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (fis != null)
                try
                {
                    fis.close();
                }
                catch (IOException e)
                {
                    // TODO Auto-generated catch
                    // block
                    e.printStackTrace();
                }
        }
        String ret = sb.toString();
        sb.setLength(0);
        return ret;
    }
    
    public static String read(File file, String charset)
    {
        if (!file.exists())
        {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        Reader fis = null;
        try
        {
            fis = new InputStreamReader(new FileInputStream(file), charset);
            char[] buf = new char[4 * 1024]; // 4K
            int n;
            while ((n = fis.read(buf)) != -1)
            {
                sb.append(buf, 0, n);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (fis != null)
                try
                {
                    fis.close();
                }
                catch (IOException e)
                {
                    // TODO Auto-generated catch
                    // block
                    e.printStackTrace();
                }
        }
        String ret = sb.toString();
        sb = null;
        return ret;
    }
    
    /**
     * 得到文件后缀名
     * 
     * @param name
     * @return
     */
    public static String getExtension(String name)
    {
        int i = name.lastIndexOf('.');
        if (i >= 0)
        {
            return name.substring(i + 1).toLowerCase();
        }
        return "";
    }
    
    public static String getFileName(String path)
    {
        try
        {
            char separatorChar = '/';
            int index = path.lastIndexOf(separatorChar);
            if (index < 0)
            {
                separatorChar = '\\';
                index = path.lastIndexOf(separatorChar);
            }
            return path.substring(index + 1);
        }
        catch (Exception ex)
        {
            return "Unknown";
        }
    }
    
    public static SimpleDateFormat DIR_PATH_DATA_FORMAT = new SimpleDateFormat("yyyy/MM/dd/");
    
    private static int currTime = (int)(System.currentTimeMillis() / 1000);
    
    private static synchronized long getNext()
    {
        return currTime++;
    }
    
    /**
     * 获取文件路径及文件名 格式 年/月/日/时间戳 〈一句话功能简述〉 <br/>
     * 〈功能详细描述〉
     * 
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getUniqueFileName()
    {
        return DIR_PATH_DATA_FORMAT.format(new Date()) + getNext();
    }
    
    /**
     * 生成文件路径 格式 年/ 〈一句话功能简述〉 <br/>
     * 〈功能详细描述〉
     * 
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String createDateDir()
    {
        return DateUtils.dateToString(DateUtils.DEFAULT_TO_YEAR, new Date()) + "/";
    }
    /**
     * 生成文件路径 格式 年/ 〈一句话功能简述〉 <br/>
     * 〈功能详细描述〉
     * 
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String createDateDirDAY()
    {
        return DateUtils.dateToString(DateUtils.PATTERN_YYYYMMDD, new Date()) + "/";
    }
    /**
     * ddHHmmss
     * 
     *〈一句话功能简述〉 <br/>
     * 〈功能详细描述〉
     * @return
     * @see  [类、类#方法、类#成员]
     */
    public static String createDate()
    {
        return DateUtils.dateToString(DateUtils.VERSION_DATE_FORMAT, new Date());
    }
    
    /**
     * 根据修改时间升序排序
     * @param file
     */
    public static void sortByLastModified(File[] files){
    	Arrays.sort(files, new Comparator<File>() {
            public int compare(File f1, File f2) {
                long diff = f1.lastModified() - f2.lastModified();
                if (diff > 0)
                    return 1;
                else if (diff == 0)
                    return 0;
                else
                    return -1;//如果 if 中修改为 返回-1 同时此处修改为返回 1  排序就会是递减
            }

            public boolean equals(Object obj) {
                return true;
            }

        });
    }
}
