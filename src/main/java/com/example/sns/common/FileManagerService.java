package com.example.sns.common;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	public final static String FILE_UPLODE_PATH = "D:\\kyu\\Spring_project\\sns\\images/";
//	public final static String FILE_UPLODE_PATH = "C:\\Users\\kyu01\\Desktop\\SpringProject\\workspace\\images/";

	
	public String saveFile(String userLoginId, MultipartFile file) {
		
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLODE_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());	// TODO 파일명을 영어로 만들게
			Files.write(path, bytes);
			
			return "/images/" + directoryName + file.getOriginalFilename(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
