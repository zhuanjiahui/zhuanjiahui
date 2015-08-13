package com.frame.core.util;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.ObjectMetadata;
import com.aliyun.openservices.oss.model.PutObjectResult;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;


import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;


@Service
public class OSSClientService {
    public static final String KEY = "3SAv5TtItwa5TkoQ";
    public static final String SECRET = "BqMMf9of0jcc9GITjZskJYrWF2duLC";
    public static final String ENDPOINT = "http://oss-cn-beijing.aliyuncs.com";
    public static final String BUCKETNAME="zhuanjiahui";

    /**
     * 上传文件到阿里云存储
     *
     * @param url
     * @param content
     * @param size
     * @return
     */
    public static boolean putObject(String bucketName, String url, InputStream content, long size) {

        try {
            OSSClient client = new OSSClient(ENDPOINT, KEY, SECRET);
            ObjectMetadata meta = new ObjectMetadata();
            meta.setContentLength(size);
            PutObjectResult result = client.putObject(bucketName, url, content, meta);//PutObjectResult可用于校验上传的文件是否与本地一致
            content.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
    /**
     * 获取文件从阿里云存储
     * @param key bucket下object的完整路径
     * @return
     */
    private static InputStream getObject(String bucketName, String key) {

        try {
            OSSClient client = new OSSClient(ENDPOINT, KEY, SECRET);
            InputStream is=null;
            is = client.getObject(bucketName, key).getObjectContent();//PutObjectResult可用于校验上传的文件是否与本地一致
            return is;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
    /**
     * 对图片裁剪，并把裁剪新图片上传
     * @param srcPath 读取源图片路径
     * @param toPath    写入图片路径
     * @param x 剪切起始点x坐标
     * @param y 剪切起始点y坐标
     * @param width 剪切宽度
     * @param height     剪切高度
     * @param readImageFormat  读取图片格式
     * @param writeImageFormat 写入图片格式
     * @throws java.io.IOException
     */
    public static String cropImage(String srcPath,String toPath,
                          int x,int y,int width,int height,
                          String readImageFormat,String writeImageFormat) throws IOException {
        InputStream fis = null ;
        ImageInputStream iis =null ;
        File file=new File(toPath);
        file=File.createTempFile("cut","png",file);
        try{
            //读取图片文件
            fis = OSSClientService.getObject("zhuanjiahui",srcPath);
            Iterator it = ImageIO.getImageReadersByFormatName(readImageFormat);
            ImageReader reader = (ImageReader) it.next();
            //获取图片流
            iis = ImageIO.createImageInputStream(fis);
            reader.setInput(iis,true) ;
            ImageReadParam param = reader.getDefaultReadParam();
            //定义一个矩形
            Rectangle rect = new Rectangle(x, y, width, height);
            //提供一个 BufferedImage，将其用作解码像素数据的目标。
            param.setSourceRegion(rect);
            BufferedImage bi = reader.read(0,param);
            //保存新图片
            ImageIO.write(bi, writeImageFormat, file);
            InputStream is=new FileInputStream(file);
            putObject("bucketName", toPath, is,file.length());
            return toPath;
        }finally{
            if(fis!=null)
                fis.close();
            if(iis!=null)
                iis.close();
        }
    }

}
