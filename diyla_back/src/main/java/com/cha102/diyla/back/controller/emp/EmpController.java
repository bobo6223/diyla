package com.cha102.diyla.back.controller.emp;

import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.empmodel.EmpJPADAO;
import com.cha102.diyla.empmodel.EmpSpringService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController //可以直接返回JSON格式 也是component的一種
@RequestMapping("/emp")
public class EmpController {

//  注入Service介面後可以多型同時降低耦合性
//  介面被入Autowired時,有實作該介面的類別其方法都可以被呼叫
    @Autowired
    private EmpSpringService empSpringService;
    @Autowired
    private EmpJPADAO empJPADAO;

//  限定用post方法映射到指定URL做請求 ,以處理網頁請求和回應
    @PostMapping("/getAllEmpList") // 等同於@webServlet = doPost
// 將請求(?後的Key Value)放入BODY裡面 , 不過因為前端fetch是傳入JSONString 所以要用String接
//  在將data轉型成JSONObject
    public String getAllEmpList(@RequestBody String data){
        JSONObject jsonObject = JSONObject.parseObject(data);
       return empSpringService.getAllEmp(jsonObject);
    }
    @PostMapping("/changeEmpStatus")
    public String updateEmpStatus(@RequestBody String statusData){
        JSONObject jsonObject = JSONObject.parseObject(statusData);
        return  empSpringService.changeEmpStatus(jsonObject);

    }
    @PostMapping("/login")
    public void login(@RequestParam("empAccount") String empAccount, @RequestParam("empPassword") String empPassword, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        empSpringService.validEmpLogin(empAccount,empPassword, req, resp);
    }

    @GetMapping("/logout")
    public void logout(@RequestParam("empId") String empId, HttpServletRequest req, HttpServletResponse resp){
        empSpringService.logout(empId, req, resp);
    }


//    @PostMapping("/memLogin")
//    public void memLogin


//  示範用SpringDataJPA 取得資料
//  findAll方法即為
//    @GetMapping("/emp/test")
//    public List<EmpVO> getAllEmp(){
//        List<EmpVO> all = empJPADAO.findAll();
//        return all;
//    }

}

