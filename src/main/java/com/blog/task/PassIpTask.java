package com.blog.task;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.blog.model.util.PassIpUtil;
import com.ssm.common.utils.FileUtil;

public class PassIpTask {
	private final String FILE_PATH = PassIpTask.class.getClassLoader().getResource("pass_ip_file").getPath();

	public void execute(){
		File file = new File(FILE_PATH);
		String content=FileUtil.read(file,"utf-8");
		String arr[]=content.split("\n");
		List<String> list = new ArrayList<String>();
		for(String ip:arr){
			list.add(ip.trim());
		}
		PassIpUtil.setIpList(list);
	}
}