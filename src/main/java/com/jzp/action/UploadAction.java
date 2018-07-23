package com.jzp.action;

/**
 * Created by renba on 2017/6/13.
 */

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.stereotype.Controller;

import java.io.*;
@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class UploadAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    //设置文件的保存路径 
    private static final String PATH = "H:\\IDEA\\ssh-maven\\src\\main\\webapp\\img";
    private File upload;
    private String uploadFileName;

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    private String uploadContentType;

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    @Action(value = "upload",
            interceptorRefs={@InterceptorRef(value="fileUpload",
                    params={"allowTypes","image/bmp,image/png,image/gif,image/jpeg,image/pjpeg",
                            "maximumSize","5242880"}),@InterceptorRef("defaultStack")})
    public void execsuate()  {
        System.out.println("接收");
        //得到输入流，通过struts已经得到名为upload的控件的值
        InputStream is = null;
        try {
            is = new FileInputStream(upload);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        File tofile = new File(PATH, this.getUploadFileName());
        OutputStream os = null;
        System.out.println(tofile);
        try {
            os = new FileOutputStream(tofile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        //分配接受缓冲区
        byte buffer[] = new byte[1024];
        int lenght=0;
        try {
            while (-1 != is.read(buffer, 0, buffer.length)) {
                try {
                    os.write(buffer);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("写入成功");
    }
}
