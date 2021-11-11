package com.whale.data.util;


import com.whale.base.exception.BaseException;
import com.whale.data.constant.StatusCodeConstants;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.servlet.http.HttpServletRequest;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;

/**
 * @Author: sy
 * @Date: Created by 2021/7/30 9:51
 * @description:
 */
public class JwtTokenUtil {

    public static final String TOKEN_HEADER = "Authorization";
    private static String secretKey = Base64.getEncoder().encodeToString("123123".getBytes());


    private static long validityInMilliseconds = 3600000L*24*7;



    public  static String createToken( Integer userId) {

        HashMap<String,Object> map = new HashMap<>();
        Date now = new Date();
        Date validity = new Date(now.getTime() + validityInMilliseconds);
        return Jwts.builder()
                .setClaims(map)
                .setIssuedAt(now)
                .setExpiration(validity)
                .setSubject(userId+"")
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }


    public static String resolveToken(HttpServletRequest req) {
        return req.getHeader(TOKEN_HEADER);
    }

    public  static Claims getTokenBody(String token){
        try {
            return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
        }catch (ExpiredJwtException e){
            throw new BaseException(StatusCodeConstants.AUTH_ERROR,"token失效，请重新登录");
        }catch (Exception e){
            throw new BaseException(StatusCodeConstants.AUTH_ERROR,"非法token！");
        }

    }


    public static Integer getUserId(String token){
        Claims body = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
        String subject = body.getSubject();
        return Integer.parseInt(subject);
    }


    /**
     * 是否超时
     * @param token
     * @return
     */
    public static boolean validateToken(String token) {
        try {
            return getTokenBody(token).getExpiration().before(new Date());
        } catch (ExpiredJwtException e) {
            return true;
        }
    }


}
