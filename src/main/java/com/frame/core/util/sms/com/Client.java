/*
package com.frame.core.util.sms.com;

import java.util.ArrayList;
import java.util.List;

import com.frame.core.util.sms.util.HttpUtil;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

*/
/*
import util.HttpUtil;
*//*


public class Client {

	// 企业ID
	private String userid;
	
	// 服务器地址
	private String serverUrl;
	
	// 用户帐号，由系统管理员
	private String account;

	// 用户账号对应的密码
	private String password;

	public Client(String userid, String account, String password, String serverUrl) {
		this.userid = userid;
		this.account = account;
		this.password = password;
		this.serverUrl = serverUrl;
	}

	public String getAccount() {
		return account;
	}





	public String getPassword() {
		return password;
	}

	public String getServerUrl() {
		return serverUrl;
	}

	public String getUserid() {
		return userid;
	}
	*/
/**
	 * 发送短信（utf-8格式内容）
	 * 
	 * @param mobile
	 *            手机号，多个使用半角逗号分隔
	 * @param content
	 *            内容
	 * @param sendTime
	 *            定时时间，格式2010-10-24 09:08:10，小于当前时间或为空表示立即发送
	 * @param extno
	 *            扩展码
	 * @return 发送返回值
	 * @throws Exception
	 *             抛出异常
	 *//*

	public String sendSms(String mobile, String content, String sendTime,
			String extno) throws Exception {

		// 参数赋值
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("userid", userid));
		params.add(new BasicNameValuePair("account", account));
		params.add(new BasicNameValuePair("password", password));
		params.add(new BasicNameValuePair("mobile", mobile));
		params.add(new BasicNameValuePair("content", content));
		params.add(new BasicNameValuePair("sendTime", sendTime));
		params.add(new BasicNameValuePair("action", "send"));
		params.add(new BasicNameValuePair("extno", extno));

		// 提交请求
		String result = HttpUtil.request(serverUrl, params);
		return result;

	}
	
	public void setAccount(String account) {
		this.account = account;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}

}
*/
