package com.cha102.diyla.member;

import java.sql.Date;
import java.util.List;

public class MemberService {
	private MemDAO_interface dao;
	
	public MemberService() {

		dao = new MemDAO();
	}
	
	public MemVO addMem(String mem_name,String mem_email,String mem_password,String mem_phone,Date mem_birthday,Integer mem_gender,String mem_address) {
		MemVO mem = new MemVO();
		mem.setMemName(mem_name);
		mem.setMemEmail(mem_email);
		mem.setMemPassword(mem_password);
		mem.setMemPhone(mem_phone);
		mem.setMemBirthday(mem_birthday);
		mem.setMemGender(mem_gender);
		mem.setMemAddress(mem_address);
		dao.insert(mem);
		return mem;
		
	}
	
	public MemVO updateMem(String mem_name,String mem_password,String mem_phone,String mem_address) {
		MemVO mem = new MemVO();
		mem.setMemName(mem_name);
		mem.setMemPassword(mem_password);
		mem.setMemPhone(mem_phone);
		mem.setMemAddress(mem_address);
		dao.update(mem);
		return mem;
		
	}
	
	public void deletMem(Integer memId) {
		dao.delete(memId);
	}
	
	public MemVO selectMem(Integer memId) {
		MemVO mem = new MemVO();
		dao.findByPrimaryKey(memId);
		return mem;
	}
	
	public List<MemVO> selectAll(){

		return dao.getAll();
	}

	public MemVO login(String email, String password){
		MemVO mem = dao.selectLogin(email,password);
		if(email == null || (email.trim()).isEmpty()){
			throw new IllegalArgumentException("未輸入信箱");
		}
		if(password == null || (password.trim()).isEmpty()){
			throw new IllegalArgumentException("未輸入密碼");
		}
		if(mem ==null){
			throw new IllegalArgumentException("無此信箱或密碼錯誤");
		}
//		String emailCheck = "[]";

		return mem;

	}
}
