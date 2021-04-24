package com.electronics.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtil {

	public Map<String, String> getMessage(String message) {
		Map<String, String> result = new HashMap<>();
		if (message.equals("update_success")) {
			result.put("message", "Swal.fire({position: 'top-end',icon: 'success',\r\n" + 
					"title: 'Cập nhật dữ liệu thành công',showConfirmButton: false,timer: 1800})");
		} else if (message.equals("add_success")) {
			result.put("message", "Swal.fire({position: 'center',icon: 'success',width: '25rem',\r\n" + 
					"title: 'Thành công !!!', text: 'Thêm dữ liệu thành công.',showConfirmButton: false,timer: 1800})");
		} else if (message.equals("delete_success")) {
			result.put("message", "Swal.fire({position: 'center',icon: 'success',width: '25rem',\r\n" + 
					"title: 'Thành công !!!', text: 'Xóa dữ liệu thành công.',showConfirmButton: false,timer: 1800})");
		} else if (message.equals("error_system")) {
			result.put("message", "Swal.fire({position: 'center',icon: 'error',width: '25rem',\r\n" + 
					"title: 'Xảy ra lỗi !!!', text: 'Vui lòng kiểm tra lại.',showConfirmButton: false,timer: 1800})");
		}else if (message.equals("error_login")) {
			result.put("message", "Swal.fire({position: 'center',icon: 'success',width: '25rem',\r\n" +
					"title: 'Đăng nhập thành công', text: '',showConfirmButton: false,timer: 1800})");
		}else if (message.equals("login_success")) {
			result.put("message", "Swal.fire({position: 'center',icon: 'error',width: '25rem',\r\n" +
					"title: 'Xảy ra lỗi !!!', text: '',showConfirmButton: false,timer: 1800})");
		}
		return result;
	}
}