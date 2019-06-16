package com.ssm.common.utils;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;


public class Base64Util {
    /**
     * des 加密
     * @param plainText
     * @param desKeyParameter 加密秘钥,长度大于等于8
     * @return 二进制字节数组
     * @throws Exception
     */
    public static byte[] desEncrypt(byte[] plainText, String desKeyParameter) throws Exception {
        SecureRandom sr = new SecureRandom();
        byte rawKeyData[] = desKeyParameter.getBytes();
        DESKeySpec dks = new DESKeySpec(rawKeyData);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey key = keyFactory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.ENCRYPT_MODE, key, sr);
        byte data[] = plainText;
        byte encryptedData[] = cipher.doFinal(data);
        return encryptedData;
    }

    /**
     * des 解密
     * @param encryptText
     * @param desKeyParameter 解密秘钥,长度大于等于8
     * @return 二进制字节数组
     * @throws Exception
     */
    public static byte[] desDecrypt(byte[] encryptText, String desKeyParameter) throws Exception {
        SecureRandom sr = new SecureRandom();
        byte rawKeyData[] = desKeyParameter.getBytes();
        DESKeySpec dks = new DESKeySpec(rawKeyData);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey key = keyFactory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.DECRYPT_MODE, key, sr);
        byte encryptedData[] = encryptText;
        byte decryptedData[] = cipher.doFinal(encryptedData);
        return decryptedData;
    }
}
