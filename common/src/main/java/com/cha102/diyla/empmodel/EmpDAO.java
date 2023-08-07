package com.cha102.diyla.empmodel;

import java.util.List;

public interface EmpDAO {
    public void insertEmp(EmpVO empVO);

    public  void updateEmp(EmpVO empVO);

    public void deleteEmp(Integer empId);

    public void checkEmpEmailForRegister(String empEmail);

    public EmpVO getOne(Integer empId);

    public List<EmpVO> getAll();



}
