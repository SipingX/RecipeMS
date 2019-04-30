package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;

public class ValiMsgUtils {

	//璐﹀彿
	public static final String ACCOUNT_SID = "15b9d507e5804208be4ab302d47f47d6";

	//TOKEN
	public static final String AUTH_TOKEN = "cc57e9b935cf422c9b8f3e2c0dd18207";
	
	//绛惧悕
	public static final String SIGNATURE = "WebApp";
	
	//妯℃澘
	public static final String Content = "鎮ㄧ殑楠岃瘉鐮佷负锛�$锛岃浜�3鍒嗛挓鍐呮纭緭鍏ワ紝濡傞潪鏈汉鎿嶄綔锛岃蹇界暐姝ょ煭淇°��";
	
	//鍙互涓嶄慨鏀�
	public static final String RESP_DATA_TYPE = "json";	//JSON鎴朮ML
	public static final String operation = "/industrySMS/sendSMS";
	public static final String BASE_URL = "https://api.miaodiyun.com/20150822";
	
	private ValiMsgUtils(){}
	
	/**
	 * 鐢熸垚鎸囧畾浣嶆暟闅忔満鏁�
	 * @return 
	 */
	static Random random = new Random();
	public static String randNum(int number){
		String result = "";
		for(int i=0;i<number;i++){
			result += random.nextInt(10);
		}
		return result;
	}
	
	/**
	 * 鍙戦�佹寚瀹氫綅鏁扮煭淇￠獙璇佺爜
	 */
	public static String send(String phone,int length){
		String num = randNum(length);
		System.out.println("valim:"+phone);
		return execute(phone,num)? num : "0";
	}
	
	/**
	 * 鍙戦��6浣嶆暟鐭俊楠岃瘉鐮�
	 */
	public static String send(String phone){
		return send(phone,6);
	}
	
	/**
	 * 鍙戦�侀獙璇佺爜
	 */
	public static boolean execute(String phone,String num){
		String tmpSmsContent = null;
		String smsContent = "銆�" + SIGNATURE + "銆�" + Content.replace("$", num);
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	    	
	    }
	    String url = BASE_URL + operation;
	    String body = "accountSid=" + ACCOUNT_SID + "&to=" + phone + "&smsContent=" + tmpSmsContent + createCommonParam();

	    // 鎻愪氦璇锋眰
	    String result = post(url, body);
	    //System.out.println("result:" + System.lineSeparator() + result);
	    return result.indexOf("璇锋眰鎴愬姛")!=-1 ? true : false;
	}
	
	/**
	 * 鏋勯�犻�氱敤鍙傛暟timestamp銆乻ig鍜宺espDataType
	 * 
	 * @return
	 */
	public static String createCommonParam(){
		// 鏃堕棿鎴�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = sdf.format(new Date());

		// 绛惧悕
		String sig = DigestUtils.md5Hex(ACCOUNT_SID + AUTH_TOKEN + timestamp);
		
		return "&timestamp=" + timestamp + "&sig=" + sig + "&respDataType=" + RESP_DATA_TYPE;
	}

	/**
	 * post璇锋眰
	 * 
	 * @param url
	 *            鍔熻兘鍜屾搷浣�
	 * @param body
	 *            瑕乸ost鐨勬暟鎹�
	 * @return
	 * @throws IOException
	 */
	public static String post(String url, String body){
		//System.out.println("url:" + System.lineSeparator() + url);
		//System.out.println("body:" + System.lineSeparator() + body);

		String result = "";
		try{
			OutputStreamWriter out = null;
			BufferedReader in = null;
			URL realUrl = new URL(url);
			URLConnection conn = realUrl.openConnection();

			// 璁剧疆杩炴帴鍙傛暟
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(20000);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			// 鎻愪氦鏁版嵁
			out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out.write(body);
			out.flush();

			// 璇诲彇杩斿洖鏁版嵁
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = "";
			boolean firstLine = true; // 璇荤涓�琛屼笉鍔犳崲琛岀
			while ((line = in.readLine()) != null){
				if (firstLine){
					firstLine = false;
				} else{
					result += System.lineSeparator();
				}
				result += line;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 鍥炶皟娴嬭瘯宸ュ叿鏂规硶
	 * 
	 * @param url
	 * @param reqStr
	 * @return
	 */
	public static String postHuiDiao(String url, String body){
		String result = "";
		try{
			OutputStreamWriter out = null;
			BufferedReader in = null;
			URL realUrl = new URL(url);
			URLConnection conn = realUrl.openConnection();

			// 璁剧疆杩炴帴鍙傛暟
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(20000);

			// 鎻愪氦鏁版嵁
			out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out.write(body);
			out.flush();

			// 璇诲彇杩斿洖鏁版嵁
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = "";
			boolean firstLine = true; // 璇荤涓�琛屼笉鍔犳崲琛岀
			while ((line = in.readLine()) != null){
				if (firstLine){
					firstLine = false;
				} else{
					result += System.lineSeparator();
				}
				result += line;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
}
