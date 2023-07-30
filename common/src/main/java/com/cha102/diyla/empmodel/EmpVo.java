package com.cha102.diyla.empmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EmpVo implements java.io.Serializable {

    private Integer empId;
    private String empName;
    private String empAccount;
    private String empPassword;
    private Boolean empStatus;


}
