package com.mygroup.powerpets.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtil {
    //检测邮箱是否合法
    public static final String emailPattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";

    /**
     * @author Kwanho
     * @param email 待检测邮箱
     * @return 是否符合邮箱规范
     */
    public static boolean emailValidator(String email) {
        Pattern emailPattern = Pattern.compile(ValidationUtil.emailPattern);
        Matcher matcher = emailPattern.matcher(email);
        return matcher.matches();
    }
}