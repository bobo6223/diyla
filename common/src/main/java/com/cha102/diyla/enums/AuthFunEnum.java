package com.cha102.diyla.enums;

import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

public enum AuthFunEnum {
    auth_1(1, "商品訂單管理", "商店管理員", "SHOP"),
    auth_2(2, "商品管理", "商店管理員", "SHOP"),
    auth_3(3, "DIY類別設定", "課程管理員", "CLASS"),
    auth_4(4,"DIY訂單管理","課程管理員","CLASS"),
    auth_5(5,"甜點課程訂單管理","師傅","MASTER"),
    auth_6(6,"師傅資料管理","師傅","MASTER"),
    auth_7(7,"回覆聊天室訊息","師傅","MASTER"),
    auth_8(8,"甜點課程管理","師傅","MASTER"),
    auth_9(9,"會員帳號管理","會員權限管理人員","MEMADMIN"),
    auth_10(10,"黑名單管理","會員權限管理人員","MEMADMIN"),
    auth_11(11,"食材管理","倉儲管理人員","STORADMIN"),
    auth_12(12,"進貨管理","倉儲管理人員","STORADMIN"),
    auth_13(13,"常見問題管理","客服人員","CUSTORSERVICE"),
    auth_14(14,"帖子討論區管理","客服人員","CUSTORSERVICE"),
    auth_15(15,"後台帳號管理","後台管理員","BACKADMIN");

    @Getter
    private Integer authId;
    @Getter
    private String authFun;
    @Getter
    private String typeFunChinese;
    @Getter
    private String typeFun;

    AuthFunEnum(int authId, String authFun, String typeFunChinese, String typeFun) {
        this.authId = authId;
        this.authFun = authFun;
        this.typeFunChinese = typeFunChinese;
        this.typeFun = typeFun;
    }

    public static List<Integer> getAuthFunByAuthId(String typeFun) {
        List<Integer> list = new ArrayList<>();
        //AuthFunEnum.values將 Enum所有值取出
        for (AuthFunEnum authFunEnum : AuthFunEnum.values()) {
//            比對TYPE_FUN 英文取得相對應的AUTH_ID 放入list
            if (authFunEnum.getTypeFun().equalsIgnoreCase(typeFun)) {
                list.add(authFunEnum.getAuthId());
            }
        }
        return list;
    }
}
