package controller;

import com.cha102.diyla.member.MemVO;
import com.cha102.diyla.member.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/member/register")
public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        doPost(req,res);
    }

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        List<String> exMsgs = new LinkedList<String>();
        req.setAttribute("exMsgs",exMsgs);

        String name = req.getParameter("newName");
        String email = req.getParameter("user");
        String pw = req.getParameter("password");
        String pwcheck = req.getParameter("pwcheck");
        Integer gender = Integer.valueOf(req.getParameter("gender"));
        Date birthday = null;
        try {
            birthday = Date.valueOf(req.getParameter("birthday"));
        }catch (IllegalArgumentException e){
            exMsgs.add("請輸入日期");
        }

        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        MemberService memSer = new MemberService();
        MemVO newMem=memSer.addMem(exMsgs,name,email,pw,phone,birthday,gender,address);
        if (!pw.equals(pwcheck)){
            exMsgs.add("該密碼與您設定的密碼不一致");
        }

        if (!exMsgs.isEmpty()){
            RequestDispatcher failure = req.getRequestDispatcher("/member/mem_register.jsp");
            failure.forward(req,res);
            return;
        } else {
            RequestDispatcher success = req.getRequestDispatcher("/member/mem_login.jsp");
            success.forward(req,res);
            return;
        }


    }
}
//要連接google 信箱
//未驗證不能登入
