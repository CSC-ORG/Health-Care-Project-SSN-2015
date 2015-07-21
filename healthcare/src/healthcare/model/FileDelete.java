/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package healthcare.model;
import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileDeleteStrategy;
 
/**
 *
 * @author K!R@N
 */
public class FileDelete {
    public static void processFile (String path,String filename)throws Exception
    {
        try
        {
        	
            File f=new File(path);
            if(!f.exists())
                f.mkdir();
            File savedFile=new File(f.getAbsolutePath()+File.separator+""+filename);
            FileDeleteStrategy.NORMAL.delete(savedFile);
            
        }
        catch(IOException e)
        {        	
            e.printStackTrace();
        }
    }
    
}
