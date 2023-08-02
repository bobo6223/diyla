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
		mem.setMem_name(mem_name);
		mem.setMem_email(mem_email);
		mem.setMem_password(mem_password);
		mem.setMem_phone(mem_phone);
		mem.setMem_birthday(mem_birthday);
		mem.setMem_gender(mem_gender);
		mem.setMem_address(mem_address);
		dao.insert(mem);
		return mem;
		
	}
	
	public MemVO updateMem(String mem_name,String mem_password,String mem_phone,String mem_address) {
		MemVO mem = new MemVO();
		mem.setMem_name(mem_name);
		mem.setMem_password(mem_password);
		mem.setMem_phone(mem_phone);
		mem.setMem_address(mem_address);
		dao.update(mem);
		return mem;
		
	}
	
	public void deletMem(Integer mem_id) {
		dao.delete(mem_id);
	}
	
	public MemVO selectMem(Integer mem_id) {
		MemVO mem = new MemVO();
		dao.findByPrimaryKey(mem_id);
		return mem;
	}
	
	public List<MemVO> selectAll(){
		return dao.getAll();
	}
}
