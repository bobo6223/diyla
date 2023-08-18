package com.cha102.diyla.empmodel;

import com.mysql.cj.x.protobuf.MysqlxDatatypes;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.ObjectUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EmpVO implements java.io.Serializable {

    private Integer empId;
    private String empName;
    private String empAccount;
    private String empPassword;
    private String empEmail;
    private Boolean empStatus;

    public EmpVO(String empName, String empAccount, String empPassword, String empEmail, Boolean empStatus){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empEmail = empEmail;
        this.empStatus = empStatus;

    }
    public EmpVO(String empName,String empAccount,String empPassword,String empEmail,Boolean empStatus, Integer empId){
        this.empName = empName;
        this.empAccount = empAccount;
        this.empPassword = empPassword;
        this.empEmail = empEmail;
        this.empStatus = empStatus;
        this.empId =empId;
    }
}

