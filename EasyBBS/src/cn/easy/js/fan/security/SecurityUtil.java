package cn.easy.js.fan.security;

import com.sun.crypto.provider.SunJCE;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPublicKey;
import java.sql.SQLException;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import sun.misc.BASE64Encoder;

public class SecurityUtil {
	String defaulturl = "../index.jsp";

	static boolean debug = false;

	private static String Algorithm = "DES";

	public SecurityUtil() {
		Security.addProvider(new SunJCE());
	}

	public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; ++n) {
			stmp = Integer.toHexString(b[n] & 0xFF);
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}

		return hs.toLowerCase();
	}

	public static String MD5(String input) throws Exception {
		MessageDigest alg = MessageDigest.getInstance("MD5");

		alg.update(input.getBytes());
		byte[] digest = alg.digest();
		return byte2hex(digest);
	}

	public void setdefaulturl(String myurl) {
		this.defaulturl = myurl;
	}

	public String getdefaulturl() {
		return this.defaulturl;
	}

	public boolean isRequestValid(HttpServletRequest request)
			throws SQLException {
		return (request.getRequestURL().indexOf(request.getServerName()) != -1);
	}

	public static byte[] getKey() throws Exception {
		KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
		SecretKey deskey = keygen.generateKey();
		if (debug)
			System.out.println("生成密钥:" + byte2hex(deskey.getEncoded()));
		return deskey.getEncoded();
	}

	public static byte[] encode(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new SecretKeySpec(key, Algorithm);
		if (debug) {
			System.out.println("加密前的二进串:" + byte2hex(input));
			System.out.println("加密前的字符串:" + new String(input));
		}
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(1, deskey);
		byte[] cipherByte = c1.doFinal(input);
		if (debug) {
			System.out.println("加密后的二进串:" + byte2hex(cipherByte));
			System.out.println("加密后的字符串:" + new String(cipherByte));
		}
		return cipherByte;
	}

	public static String encode2hex(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new SecretKeySpec(key, Algorithm);
		if (debug) {
			System.out.println("加密前的二进串:" + byte2hex(input));
			System.out.println("加密前的字符串:" + new String(input));
		}
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(1, deskey);
		byte[] cipherByte = c1.doFinal(input);
		if (debug) {
			System.out.println("加密后的二进串:" + byte2hex(cipherByte));
			System.out.println("加密后的字符串:" + new String(cipherByte));
		}
		return byte2hex(cipherByte);
	}

	public static byte[] decode(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new SecretKeySpec(key, Algorithm);
		if (debug)
			System.out.println("解密前的信息:" + byte2hex(input));
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(2, deskey);
		byte[] clearByte = c1.doFinal(input);
		if (debug) {
			System.out.println("解密后的二进串:" + byte2hex(clearByte));
			System.out.println("解密后的字符串:" + new String(clearByte));
		}
		return clearByte;
	}

	public static byte hex2byte(char hex) {
		int k = 0;
		if ((hex >= '0') && (hex <= '9'))
			k = hex - '0';
		else if ((hex >= 'A') && (hex <= 'F'))
			k = '\n' + hex - 65;
		else if ((hex >= 'a') && (hex <= 'f'))
			k = '\n' + hex - 97;
		else {
			System.out.println("Wrong hex digit!");
		}
		return (byte) (k & 0xFF);
	}

	public static byte hex2byte(char a1, char a2) {
		int k;
		if ((a1 >= '0') && (a1 <= '9'))
			k = a1 - '0';
		else if ((a1 >= 'a') && (a1 <= 'f'))
			k = a1 - 'a' + 10;
		else if ((a1 >= 'A') && (a1 <= 'F'))
			k = a1 - 'A' + 10;
		else {
			k = 0;
		}
		k <<= 4;

		if ((a2 >= '0') && (a2 <= '9'))
			k += a2 - '0';
		else if ((a2 >= 'a') && (a2 <= 'f'))
			k += a2 - 'a' + 10;
		else if ((a2 >= 'A') && (a2 <= 'F'))
			k += a2 - 'A' + 10;
		else {
			k += 0;
		}
		return (byte) (k & 0xFF);
	}

	public static byte[] hexstr2byte(String str) {
		int len = str.length();
		if (len % 2 != 0) {
			System.out.println("十六进制字符串的长度为" + len + ",不为2的倍数！");
			return null;
		}
		byte[] r = new byte[len / 2];
		int k = 0;
		for (int i = 0; i < str.length() - 1; i += 2) {
			r[k] = hex2byte(str.charAt(i), str.charAt(i + 1));
			++k;
		}
		return r;
	}

	public static byte[] decodehexstr(String hexstr, byte[] key)
			throws Exception {
		byte[] input = hexstr2byte(hexstr);
		if (input == null)
			return null;
		SecretKey deskey = new SecretKeySpec(key, Algorithm);
		if (debug)
			System.out.println("解密前的信息:" + hexstr);
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(2, deskey);
		byte[] clearByte = c1.doFinal(input);
		if (debug) {
			System.out.println("解密后的二进串:" + byte2hex(clearByte));
			System.out.println("解密后的字符串:" + new String(clearByte));
		}
		return clearByte;
	}

	public boolean verifysignature(String filename, byte[] oridata,
			byte[] signatureData) {
		X509Certificate cert = null;
		try {
			InputStream inStream = new FileInputStream(filename);
			try {
				CertificateFactory cf = CertificateFactory.getInstance("X.509");
				cert = (X509Certificate) cf.generateCertificate(inStream);
			} catch (CertificateException e) {
				System.out.println("generateCertificate error:"
						+ e.getMessage());
				return false;
			}
			inStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("read " + filename + " error:" + e.getMessage());
			return false;
		} catch (IOException e) {
			System.out
					.println("close " + filename + " error:" + e.getMessage());
			return false;
		}

		RSAPublicKey publicKey = (RSAPublicKey) cert.getPublicKey();

		Signature signer = null;
		try {
			signer = Signature.getInstance("MD5withRSA");
			signer.initVerify(publicKey);
		} catch (NoSuchAlgorithmException noAlgorithm) {
			System.out.println(noAlgorithm);
			return false;
		} catch (InvalidKeyException badKey) {
			System.out.println(badKey);
			return false;
		}
		try {
			signer.update(oridata);
		} catch (SignatureException signError) {
			System.out.println(signError);
			return false;
		}

		boolean signatureVerified = false;
		try {
			signatureVerified = signer.verify(signatureData);
		} catch (SignatureException signError) {
			System.out.println(signError);
			return false;
		}
		return signatureVerified;
	}

	public static boolean isValidSqlParam(String sql) {
		return (sql.toLowerCase().indexOf(";") == -1);
	}

	public static boolean isValidSql(String sql) {
		return (sql.toLowerCase().indexOf(";delete") == -1);
	}

	public static boolean sql_inj(String str) {
		String inj_str = "'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,";
		String[] inj_stra = inj_str.split("\\|");
		for (int i = 0; i < inj_stra.length; ++i) {
			if (str.indexOf(inj_stra[i]) >= 0) {
				return true;
			}
		}
		return false;
	}

	public static String SHA_BASE64_24(String input) throws Exception {
		MessageDigest alg = MessageDigest.getInstance("SHA");

		alg.update(input.getBytes());
		byte[] digest = alg.digest();
		return new BASE64Encoder().encode(digest).substring(0, 24);
	}
}
