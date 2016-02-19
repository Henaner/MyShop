package cn.wangchenhui.test;
import java.security.MessageDigest;
import java.util.Scanner;

/**

* 采用MD5加密解密

* @author tfq

* @datetime 2011-10-13

*/

public class MD5Util {

/***

* MD5加码 生成32位md5码

*/

	public static String md5Encode(String inStr){
	
		MessageDigest md5 = null;
		
		try{
		
		md5 = MessageDigest.getInstance("MD5");
		
		}catch (Exception e){
		
		System.out.println(e.toString());
		
		e.printStackTrace();
		
		return "";
	
	}

	char[] charArray = inStr.toCharArray();
	
	byte[] byteArray = new byte[charArray.length];
	
	for (int i = 0; i < charArray.length; i++)
	
	byteArray[i] = (byte) charArray[i];
	
	byte[] md5Bytes = md5.digest(byteArray);
	
	StringBuffer hexValue = new StringBuffer();
	
	for (int i = 0; i < md5Bytes.length; i++){
	
	int val = ((int) md5Bytes[i]) & 0xff;
	
	if (val < 16)
	
	hexValue.append("0");
	
	hexValue.append(Integer.toHexString(val));
	
	}
	
	return hexValue.toString();
	
	}
	
	/**
	
	* 加密解密算法 执行一次加密，两次解密
	
	*/
	
	public static String md5Decode(String inStr){
	
		char[] a = inStr.toCharArray();
		
		for (int i = 0; i < a.length; i++){
		
			a[i] = (char) (a[i] ^ 't');
		
		}
		
		String s = new String(a);
		
		return s;
		
	}
	
	// 测试主函数
	
	public static void main(String args[]) {
	
//		String s = new String("0505@Love@0622");
//		
//		System.out.println("原始：" + s);
//		
//		System.out.println("MD5后：" + md5Encode(s));
//		
//		System.out.println("加密的：" + md5Decode(s));//执行该方法一次相当于是加密
//		
//		System.out.println("解密的：" + md5Decode(md5Decode(s)));
		String md5_password = md5Encode("05050622");
		//3e5725d67a6b244868c6517c5370085a
		System.out.println("请输入口令：");
		Scanner scanner = new Scanner(System.in);
		String password = md5Encode(scanner.nextLine().trim()); //这一行要去空格的的
		if(password.equals(md5_password)){
			System.out.println("密码验证通过");
		}else{
			System.out.println("密码验证不通过");
		}
	}

}