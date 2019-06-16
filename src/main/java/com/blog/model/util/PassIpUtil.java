package com.blog.model.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class PassIpUtil {
	private static List<String> ipList = new ArrayList<String>();
	
	public static boolean addAll(Collection<String> c){
		return ipList.addAll(c);
	}
	
	/**
	 * 〈一句话功能简述〉 白名单验证<br/>
	 * 〈功能详细描述〉 
	 * @param IP
	 * @return false 表示白名单   true 非白名单
	 * @see  [类、类#方法、类#成员]
	 */
	public static boolean isNotWhiteIp(String IP)
	{
	    if(StringUtils.isNotEmpty(IP))
	    {
	        for (Iterator<String> iterator = ipList.iterator(); iterator.hasNext();)
	        {
	            String whiteIp = (String)iterator.next();
	            if(IP.indexOf(whiteIp) != -1)
	            {
	                return false;
	            }
	        }
	    }
	    
        return true;
	}
	
	public static boolean clear(){
		ipList.clear();
		return true;
	}

	public static boolean add(String ip) {
		return ipList.add(ip);
	}
	
	public static void setIpList(List<String> list){
		ipList = list;
	}
}
