package com.whale.base.util;

import com.alibaba.fastjson.JSONObject;
import com.whale.base.exception.BaseException;
import com.whale.base.util.RestTemplateUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: sy
 * @Date: Created by 2021/7/30 16:03
 * @description:
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UploadFileUtil {

    private final RestTemplateUtil restTemplateUtil;



    @SneakyThrows
    public String  upload(MultipartFile file){
        LinkedMultiValueMap<String, Object> restMap = new LinkedMultiValueMap<>();
        ByteArrayResource is = new ByteArrayResource(file.getBytes()) {
            @Override
            public String getFilename() {
                return file.getOriginalFilename();
            }
        };
        restMap.add("key","7c1c43f083bcc36040eeb144555416");
        restMap.add("dir","rc");
        restMap.add("file",is);
        JSONObject jsonObject = restTemplateUtil.uploadByResource("http://rcfile.1qrs.cn/api/uploadApiController/upload" , restMap);
        if ((Integer)jsonObject.get("resultCode")==0){
            return (String) jsonObject.get("resultData");
        }
        throw new BaseException((String)jsonObject.get("resultMessage"));
    }



}
