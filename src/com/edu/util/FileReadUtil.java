package com.edu.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class FileReadUtil {
	public static String fileRead(String path){
		Reader reader = null;
		BufferedReader br = null;
		try {
			reader = new FileReader(path);
			br = new BufferedReader(reader);
			StringBuffer sb = new StringBuffer();
			String data = null;
			while ((data = br.readLine()) != null) {
				sb.append(data);
			}
			data = sb.toString();
			System.out.println(data);
            return data;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "";
	}
}
