package com.whale.auth.handler;

import com.whale.data.handler.BaseMetaObjectHandler;
import com.whale.security.util.SecurityUtil;
import org.springframework.stereotype.Component;

/**
 * @author entfrm
 * @date 2019/8/10
 * @description 公共字段填充
 */
@Component
public class WahleMetaObjectHandler extends BaseMetaObjectHandler {

    @Override
    protected Object getUserName() {
        try {
            return SecurityUtil.getUser().getUsername();
        } catch (Exception e) {
            return "";
        }
    }
}
