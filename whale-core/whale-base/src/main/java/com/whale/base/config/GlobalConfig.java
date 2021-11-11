package com.whale.base.config;

import cn.hutool.core.util.StrUtil;
import com.whale.base.util.YamlUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Configuration
public class GlobalConfig {

    @Resource
    private WhaleConfig whaleConfig;

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = new HashMap<String, String>();


    @PostConstruct
    public void asdf(){
        map.put("wahle.lang", whaleConfig.getLang());
        map.put("wahle.profile", whaleConfig.getProfile());
    }



    /**
     * 静态工厂方法 获取当前对象实例 多线程安全单例模式(使用双重同步锁)
     */

    /**
     * 获取配置
     */
    public static String getConfig(String key) {
        return map.get(key);
    }

    /**
     * 获取系统语言
     */
    public static String getLang() {
        return StrUtil.nullToDefault(getConfig("wahle.lang"), "zh_CN");
    }

    /**
     * 获取文件上传路径
     */
    public static String getProfile() {
        return getConfig("wahle.profile");
    }



    /**
     * 获取下载路径
     */
    public static String getDownloadPath() {
        return getConfig("wahle.profile") + "download/";
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath() {
        return getConfig("wahle.profile") + "upload/";
    }

}
