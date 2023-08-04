package controller;

import com.cha102.diyla.member.MemDAO;
import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        String user = req.getParameter("user");
        String password = req.getParameter("password");

        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs",exMsgs);
        MemberService memVo = new MemberService();
        MemVO m = memVo.login(user,password);
        try{
            RequestDispatcher success = req.getRequestDispatcher("");
            success.forward(req,res);//導入登入成功頁面或是回到原頁面
        } catch (IllegalArgumentException e){
            exMsgs.add(e.getMessage());
        }



    }



//    登入後會有等待畫面或是登入成功畫面後再跳轉？
//    忘記密碼
//    驗證碼
//    三次密碼錯誤要發驗證信
//    記住我
}
