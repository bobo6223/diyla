package com.cha102.diyla.empmodel;

import java.util.List;

public interface EmpDao {
    public void insert(EmpVo empVo);

    public  void update(EmpVo empVo);

    public void delete(EmpVo empVo);

    public EmpVo findByPrimaryKey(Integer empId);

    public List<EmpVo> getAll();

}
