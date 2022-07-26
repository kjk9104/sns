package com.example.sns.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.sns.common.FileManagerService;


public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**") // 이미지의 웹주소 http://localhost/images/kjk9104_16874828147854/sum.png
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLODE_PATH); // 실제 파일이 있는 곳
	}

}
