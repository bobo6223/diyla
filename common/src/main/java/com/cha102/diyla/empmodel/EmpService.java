package com.cha102.diyla.empmodel;

import org.springframework.util.ObjectUtils;

import java.util.List;
import java.util.regex.Pattern;

public class EmpService {
    private EmpDAOImpl daoImpl;

    public void empInsert(EmpVO empVO) {
//        EmpVO empVO = insertValidEmpParam(errorMsgs, empName, empAccount, empPassword, empEmail, empStatus);
//        if (!ObjectUtils.isEmpty(errorMsgs) || ObjectUtils.isEmpty(empVO)) {
//            return errorMsgs;
//        }
//        EmpVO empVO = new EmpVO(empName, empAccount, empPassword, empEmail, empStatus);
        daoImpl = new EmpDAOImpl();
        daoImpl.insertEmp(empVO);

    }


    public EmpVO insertValidEmpParam(List<String> errorMsgs, String empName, String empAccount, String empPassword,
                                     String empEmail, Boolean empStatus) {
        // 驗證
        if (ObjectUtils.isEmpty(empName)) {
            errorMsgs.add("請輸入管理員名稱");
        } else {
            empName = empName.trim();
            if (empName.length() > 10) {
                errorMsgs.add(("管理員名稱不得超過10個字"));
            }
        }
        if (ObjectUtils.isEmpty(empAccount)) {
            errorMsgs.add("請輸入管理員帳號");
        } else {
            empAccount = empAccount.trim();
        }

        if (ObjectUtils.isEmpty(empPassword)) {
            errorMsgs.add("請輸入管理員密碼");
        } else {
            empPassword = empPassword.trim();
        }

        // TODO e-mail驗證(正則表達式)
//        if(empEmail.matches(     )){
//        }
        if (ObjectUtils.isEmpty(empEmail)) {
            errorMsgs.add("請輸入管理員email");
        } else {
            empEmail = empEmail.trim();
            daoImpl.checkEmpEmailForRegister(empEmail);
        }

        if (ObjectUtils.isEmpty(empStatus)) {

            errorMsgs.add("請輸入管理員狀態");
        }
        return new EmpVO(empName, empAccount, empPassword, empEmail, empStatus);
//       此處為call by reference ,不需return errorMsgs但有透過記憶體位置有操作到heap的物件
    }


    public EmpVO empGetOne(List<String> errorMsgs, String empIdStr) {
        Integer empId = getOneValidEmpParam(empIdStr);
        if (empId <= 0) {
            errorMsgs.add("請輸入正確管理員編號");
            return null;
        }
        EmpDAOImpl dao = new EmpDAOImpl();
        EmpVO empVO = dao.getOne(empId);
        return empVO;
    }

    /**
     * 驗證EmpGetOneController傳入的id輸入是否為數字
     *
     * @param empIdStr
     */
    private Integer getOneValidEmpParam(String empIdStr) {
        if (!ObjectUtils.isEmpty(empIdStr)) {
            empIdStr = empIdStr.trim();
            if (Pattern.compile("^[0-9]*$").matcher(empIdStr).matches()) {
                return Integer.valueOf(empIdStr);
            }
        }
        return -1;
    }
};
