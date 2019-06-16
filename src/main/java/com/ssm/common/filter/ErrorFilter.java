package com.ssm.common.filter;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.ssm.common.web.ResultEnum;

/**
 * 异常信息记录为访问信息
 * @author ewind
 *
 */
public class ErrorFilter implements Filter{
	private final static Logger logger = Logger.getLogger(ErrorFilter.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss",Locale.ENGLISH);
	private static SimpleDateFormat sdfFile = new SimpleDateFormat("yyyy-MM-dd_HH'Hour'mm'Min'ss'.'S'.log'");

	private String logName;
	private String logPath;//日志存放文件夹

	public void destroy() {
		System.out.println("destroy ErrorFilter");
	}

	public void init(FilterConfig config) throws ServletException {
		logPath = config.getInitParameter("logPath");
		if(!logPath.endsWith("\\")){
			logPath += "\\";
		}
		logName = config.getInitParameter("logName")+".TIMETAG.log";
		System.out.println("initialization ErrorFilter ok");
		logger.info("initialization ErrorFilter ok");
	}

	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain){
		long timestamp = System.currentTimeMillis();
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		try{
			chain.doFilter(httpRequest, httpResponse);
		}catch (Exception e) {
			try {
				if(!httpResponse.isCommitted()){
					//TODO 异常页面处理
					try {
						//是否ajax请求
						boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(httpRequest.getHeader("x-requested-with"));
						if(isAjax){
							httpResponse.flushBuffer();
							httpResponse.getWriter().println(new ResultEnum<Object>(500,"Meeting a unknow error, Try agine later."));
						}else{
							httpRequest.getRequestDispatcher("/error/50X").forward(httpRequest, httpResponse);
						}
					} catch (ServletException e1) {
						logger.error("forward to 50x page error", e1);
						httpResponse.sendError(500);
						httpResponse.flushBuffer();
					}
				}
			} catch (IOException e1) {
				logger.error("writer log error", e);
			}
			try{
				JSONObject err = getERROR((HttpServletRequest)request, httpResponse, timestamp, e);
				writerLog(err);
			} catch (IOException e1) {
				logger.error("writer log error", e1);
			}
		}
	}

	private JSONObject getERROR(HttpServletRequest request,HttpServletResponse response,long timestamp,Exception e) throws IOException{
		//获取异常信息堆栈
		ByteArrayOutputStream cached = new ByteArrayOutputStream();
		PrintStream ps = new PrintStream(cached);
		e.printStackTrace(ps);
		String errInfo = new String(cached.toByteArray(),"utf-8");

		String domain = request.getServerName();//域名
		String referer = request.getHeader("referer");//引用页面
		String scheme = request.getScheme();//协议
		int port = request.getServerPort();//访问端口:用于NginxLogTask判断http&https
		String requestUrl = request.getRequestURI();//访问路径
		String query = request.getQueryString();//访问参数
		if(StringUtils.isNoneBlank(query)){
			requestUrl += "?"+query;
		}


		String userAgent = request.getHeader("user-agent");//useragent

		String x_forwarded_ip = request.getHeader("X-Forwarded-For");//client1, proxy1, proxy2
		String proxy_client_ip = request.getHeader("Proxy-Client-IP");//一般是经过apache http服务器的请求才会有
		String wl_proxy_client_ip = request.getHeader("WL-Proxy-Client-IP");//一般是经过apache http服务器的请求才会有
		String http_client_ip = request.getHeader("HTTP_CLIENT_IP");//有些代理服务器会加上此请求头
		String x_real_ip = request.getHeader("X-Real-IP");//nginx代理一般会加上此请求头。
		String remot_addr = request.getRemoteAddr();//最低优先级ip

		if(StringUtils.isNoneBlank(proxy_client_ip)){
			if(StringUtils.isNoneBlank(x_forwarded_ip)){
				if(proxy_client_ip.indexOf(proxy_client_ip) == -1){
					x_forwarded_ip += ","+proxy_client_ip;
				}
			}else{
				x_forwarded_ip = proxy_client_ip;
			}
		}

		if(StringUtils.isNoneBlank(wl_proxy_client_ip)){
			if(StringUtils.isNoneBlank(x_forwarded_ip)){
				if(proxy_client_ip.indexOf(wl_proxy_client_ip) == -1){
					x_forwarded_ip += ","+wl_proxy_client_ip;
				}
			}else{
				x_forwarded_ip = wl_proxy_client_ip;
			}
		}

		if(StringUtils.isNoneBlank(http_client_ip)){
			if(StringUtils.isNoneBlank(x_forwarded_ip)){
				if(proxy_client_ip.indexOf(http_client_ip) == -1){
					x_forwarded_ip += ","+http_client_ip;
				}
			}else{
				x_forwarded_ip = http_client_ip;
			}
		}

		StringBuilder cookies = new StringBuilder();
		try{
			for(Cookie cookie:request.getCookies()){
				cookies.append(cookie.getName());
				cookies.append("=");
				cookies.append(cookie.getValue());
				cookies.append(" ;");
			}
			cookies.append(cookies.toString());
		}catch (Exception ex) {}

		JSONObject json = new JSONObject();
		json.accumulate("timestamp",sdf.format(timestamp));
		json.accumulate("remote_addr",remot_addr);
		json.accumulate("x_forwarded",x_forwarded_ip);
		json.accumulate("x_real",x_real_ip);
		json.accumulate("referer",referer);
		json.accumulate("request",request.getMethod().toUpperCase()+" "+requestUrl+" HTTP/1.0");
		json.accumulate("http_host",domain);
		json.accumulate("host",domain);
		json.accumulate("server_port",port);
		json.accumulate("scheme",scheme);
		json.accumulate("status","50X");//返回状态码固定 50X ,方便查询
		json.accumulate("bytes","-");
		json.accumulate("user_agent",userAgent);
		json.accumulate("up_addr","-");
		json.accumulate("up_host","-");
		json.accumulate("up_resp_time","-");
		json.accumulate("cookie",cookies.toString());
		json.accumulate("error_info",errInfo);

		return json;
	}

	private void writerLog(JSONObject json) throws IOException{
		File log = new File(logPath+logName+sdfFile.format(System.currentTimeMillis()));
		log.createNewFile();
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(log,true)));
		writer.write(json.toString()+"\r\n");
		writer.flush();
		writer.close();
	}
}
