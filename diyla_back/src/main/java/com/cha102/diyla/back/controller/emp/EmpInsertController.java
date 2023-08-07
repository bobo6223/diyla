package com.cha102.diyla.back.controller.emp;

import com.cha102.diyla.empmodel.EmpDAO;
import com.cha102.diyla.empmodel.EmpDAOImpl;
import com.cha102.diyla.empmodel.EmpService;
import com.cha102.diyla.empmodel.EmpVO;
import org.springframework.util.ObjectUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/emp/empInsert")
public class EmpInsertController extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String statusStr = req.getParameter("status");
        Boolean status = null;
        if(!ObjectUtils.isEmpty(statusStr)) {
            status = Boolean.valueOf(statusStr);
        }
        List<String> errorMsgs = new LinkedList<String>();
        // Store this set in the request scope, in case we need to
        // send the ErrorPage view.
        EmpService empService = new EmpService();
        EmpVO empVO = empService.insertValidEmpParam(errorMsgs, name, account, password, email, status);


        if(!ObjectUtils.isEmpty(errorMsgs)) {
            req.setAttribute("empVO", empVO);
            req.setAttribute("errorMsgs", errorMsgs);
            RequestDispatcher failureView = req.getRequestDispatcher("/emp/insert.jsp");
            // RequestDispatcher為物件,裡面的failureView方法可設定將資料打包帶往專案的相對路徑
            failureView.forward(req, res);
            return;//程式中斷
        } else {
            empService.empInsert(empVO);
            String url = "/emp/form.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
            successView.forward(req, res);
    }
}

}
