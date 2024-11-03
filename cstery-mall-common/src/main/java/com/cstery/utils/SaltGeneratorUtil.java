package com.cstery.utils;

import java.security.SecureRandom;
import java.util.Base64;

public class SaltGeneratorUtil {

    private static final int SALT_LENGTH = 16; // 盐值长度

    public static String generateSalt() {
        byte[] salt = new byte[SALT_LENGTH];
        SecureRandom random = new SecureRandom();
        random.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt); // 将盐值编码为 Base64 字符串
    }

}
