package com.cha102.diyla.front.controller.member;

import com.cha102.diyla.front.MailService;
import com.cha102.diyla.member.*;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/member/updatePw")
public class updatePwServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs", exMsgs);
        String action = req.getParameter("action");
        MemberService memSer = new MemberService();
        MailService mailService = new MailService();
        //臨時密碼隨機
        String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        String code = "";
        for (int r = 1; r <= 10; r++) {
            code += String.valueOf(s.charAt((int) (Math.random() * 61)));
        }
//        res.getWriter().write("{\"status\": \"success\"}");

        //忘記密碼
        if ("forgetPw".equals(action)) {
            String email = req.getParameter("email");
            String phone = req.getParameter("phonenumber");
            MemVO memVO = memSer.forgetPw(exMsgs, email, phone);
            //AJAX
            BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()));
            StringBuffer strb = new StringBuffer();
            String line;
            while ((line = reader.readLine()) !=null){
                strb.append(line);
            }
            String json = strb.toString();
            System.out.println(json);
//            JSONObject datas = new JSONObject(json);
//            HashMap jsonMap = new HashMap();
//            jsonMap.put("memVO",memVO);
//            JSONObject mem = new JSONObject(json);


            String title = "【DIYLA】密碼重置信";
            String context = "親愛的會員您好，您的臨時密碼為"+code+"，請點選以下連結輸入臨時密碼並盡快修改密碼";
            if (exMsgs.isEmpty()){
                mailService.sendEmail(email,title,context);
                memSer.updateNewPw(exMsgs,code,email);
                res.getWriter().write("{\"status\": \"success\"}");
//                res.getWriter().print("success");
//                res.getWriter().write(String.valueOf(mem));

            }

            req.setAttribute("memVO",memVO);

        }

//        修改密碼
        if ("updatePw".equals(action)) {
            String upemail = req.getParameter("upemail");
            String upPw = req.getParameter("upPw");
            String upPwcheck = req.getParameter("upPwcheck");

            if (!upPwcheck.equals(upPw)){
                exMsgs.add("該密碼與您設定的密碼不一致");
            }

            MemVO memVO = memSer.updateNewPw(exMsgs,upPw,upemail);

            HttpSession session = req.getSession();
            session.setAttribute("memVO", memVO);
            RequestDispatcher failure = req.getRequestDispatcher("/member/updatePw.jsp");
            failure.forward(req, res);

        }

    }
}