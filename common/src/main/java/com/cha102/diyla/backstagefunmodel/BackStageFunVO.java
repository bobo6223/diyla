package com.cha102.diyla.backstagefunmodel;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BackStageFunVO implements java.io.Serializable {
    private String authFun;
    private Integer authId;
    private String typeFun;
}
