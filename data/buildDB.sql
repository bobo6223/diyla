DROP
    DATABASE IF EXISTS DIYLA;

CREATE
    DATABASE DIYLA;

USE
    DIYLA;

CREATE TABLE MEMBER
(
    MEM_ID          INT PRIMARY KEY AUTO_INCREMENT,
    MEM_NAME        VARCHAR(30)  NOT NULL,
    MEM_EMAIL       VARCHAR(50)  NOT NULL UNIQUE,
    MEM_PASSWORD    VARCHAR(50)  NOT NULL,
    MEM_PHONE       VARCHAR(10)  NOT NULL,
    MEM_BIRTHDAY    DATE         NOT NULL,
    MEM_GENDER      TINYINT COMMENT '男0,女1',
    MEM_ADDRESS     VARCHAR(100) NOT NULL,
    MEM_STATUS      TINYINT      NOT NULL DEFAULT '0' COMMENT '未驗證0,已驗證1',
    MEM_TOKEN       INT                   DEFAULT '0',
    MEM_DATE        DATE         NOT NULL DEFAULT (CURRENT_DATE),
    BLACKLIST_COM   TINYINT      NOT NULL DEFAULT '0' COMMENT '正常0,停用1',
    BLACKLIST_ART   TINYINT      NOT NULL DEFAULT '0' COMMENT '正常0,停用1',
    BLACKLIST_DIY   TINYINT      NOT NULL DEFAULT '0' COMMENT '正常0,停用1',
    BLACKLIST_CLASS TINYINT      NOT NULL DEFAULT '0' COMMENT '正常0,停用1',
    RPMSG_COUNT     TINYINT               DEFAULT '0'
);

CREATE TABLE EMPLOYEE
(
    EMP_ID       INT PRIMARY KEY AUTO_INCREMENT COMMENT '管理員編號',
    EMP_NAME     VARCHAR(50) UNIQUE NOT NULL COMMENT    '管理員名稱',
	EMP_PIC      LONGBLOB					 COMMENT	'管理員照片',
    EMP_ACCOUNT  VARCHAR(50) UNIQUE NOT NULL COMMENT    '管理員帳號',
	EMP_PASSWORD VARCHAR(50)        NOT NULL COMMENT    '管理員密碼',
    EMP_EMAIL	 VARCHAR(50) UNIQUE NOT NULL COMMENT    '管理員信箱',
    EMP_STATUS   TINYINT            NOT NULL DEFAULT    '0' COMMENT '狀態(1:啟用,0:停權)'
) COMMENT '後台管理員';


CREATE TABLE BACKSTAGE_FUN
(
    AUTH_ID  INT PRIMARY KEY AUTO_INCREMENT COMMENT '權限編號',
    AUTH_FUN VARCHAR(50) 			NOT NULL COMMENT '權限功能',
    TYPE_FUN VARCHAR(50) 			NOT NULL COMMENT'類別功能'
) COMMENT '後台權限功能';

CREATE TABLE BACKSTAGE_AUTH
(
    EMP_ID  INT,
    CONSTRAINT FK_BACKSTAGE_AUTH_EMPLOYEE
        FOREIGN KEY (EMP_ID) REFERENCES DIYLA.EMPLOYEE (EMP_ID),

    AUTH_ID INT,
    CONSTRAINT FK_BACKSTAGE_AUTH_BACKSTAGE_FUN
        FOREIGN KEY (AUTH_ID) REFERENCES DIYLA.BACKSTAGE_FUN (AUTH_ID),
    PRIMARY KEY (EMP_ID, AUTH_ID)
) COMMENT '後台管理員權限';


CREATE TABLE COMMODITY_CLASS
(
    COM_CLASS_NO   INT AUTO_INCREMENT COMMENT '商品類別編號'
        PRIMARY KEY,
    COM_CLASS_NAME VARCHAR(50)                         NOT NULL COMMENT '商品類別名稱',
    UPDATE_TIME    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間'
)
    COMMENT '商品類別';

CREATE TABLE COMMODITY
(
    COM_NO        INT AUTO_INCREMENT COMMENT '商品編號'
        PRIMARY KEY,
    COM_CLASS_NO  INT                                 NOT NULL COMMENT '商品類別編號',
    COM_NAME      VARCHAR(50)                         NOT NULL COMMENT '商品名稱',
    COM_PIC       LONGBLOB COMMENT '商品圖片',
    COM_DES       VARCHAR(200)                        NULL COMMENT '商品描述',
    COM_PRI       INT                                 NOT NULL,
    COM_QUA       INT                                 NOT NULL COMMENT '數量',
    COM_STATE   TINYINT   DEFAULT 0                 NOT NULL COMMENT '商品狀態，(0:下架，1:上架中，2:完售)',
    COMMENT_TOTAL INT     DEFAULT 0                            NOT NULL COMMENT '評論總人數',
    RATING_SUM    INT     DEFAULT 0                            NOT NULL COMMENT '評論總分',
    UPDATE_TIME   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間',
    CONSTRAINT COMMODITY_COMMODITY_CLASS_COM_CLASS_NO_FK
        FOREIGN KEY (COM_CLASS_NO) REFERENCES DIYLA.COMMODITY_CLASS (COM_CLASS_NO)
)
    COMMENT '商店商品';


CREATE TABLE COMMODITY_ORDER
(
    ORDER_NO       INT AUTO_INCREMENT COMMENT '訂單編號'
        PRIMARY KEY,
    MEM_ID         INT                                 NOT NULL COMMENT '會員編號',
    ORDER_TIME     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '下訂時間',
    ORDER_STATUS   TINYINT   DEFAULT 1                 NOT NULL COMMENT '訂單狀態，(0:已結帳，1:未結帳，2:備貨中，3:已完成)',
    ORDER_PRICE    INT COMMENT '訂單原始金額',
    DISCOUNT_PRICE INT                                 NOT NULL COMMENT '訂單折扣金額',
    ACTUAL_PRICE   INT                                 NOT NULL COMMENT '訂單實付金額',
    UPDATE_TIME    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新時間',
	RECIPIENT        VARCHAR(45)                         NOT NULL COMMENT '收件人姓名',
    RECIPIENT_ADDRESS VARCHAR(45)                        NOT NULL COMMENT '收件地址',
    PHONE            VARCHAR(45)                         NOT NULL COMMENT '電話號碼',
    CONSTRAINT COMMODITY_ORDER_MEMBER_MEM_ID_FK
        FOREIGN KEY (MEM_ID) REFERENCES DIYLA.MEMBER (MEM_ID)
)
    COMMENT '商品訂單';


CREATE TABLE COMMODITY_ORDER_DETAIL
(
    ORDER_NO     INT NOT NULL COMMENT '訂單編號',
    COM_NO       INT NOT NULL COMMENT '商品編號',
    COM_QUANTITY INT NOT NULL COMMENT '商品購買數量',
    COM_PRICE    INT NOT NULL COMMENT '商品購買價格',
    PRIMARY KEY (ORDER_NO, COM_NO),
    CONSTRAINT COMMODITY_ORDER_DETAIL_COMMODITY_COM_NO_FK
        FOREIGN KEY (COM_NO) REFERENCES DIYLA.COMMODITY (COM_NO),
    CONSTRAINT COMMODITY_ORDER_DETAIL_COMMODITY_ORDER_ORDER_NO_FK
        FOREIGN KEY (ORDER_NO) REFERENCES DIYLA.COMMODITY_ORDER (ORDER_NO)
)
    COMMENT '商品訂單明細';

CREATE TABLE COMMODITY_TRACK
(
    TRACK_ID INT NOT NULL AUTO_INCREMENT COMMENT '追蹤編號',
    MEM_ID INT NOT NULL COMMENT '會員編號',
    COM_NO INT NOT NULL COMMENT '商品編號',
    PRIMARY KEY (TRACK_ID),
    CONSTRAINT COMMODITY_TRACK_COMMODITY_COM_NO_FK
        FOREIGN KEY (COM_NO) REFERENCES DIYLA.COMMODITY (COM_NO),
    CONSTRAINT COMMODITY_TRACK_MEMBER_MEM_ID_FK
        FOREIGN KEY (MEM_ID) REFERENCES DIYLA.MEMBER (MEM_ID)
)
    COMMENT '追蹤商品';

CREATE TABLE COMMODITY_COMMENT
(
    COM_COMMENT_NO INT AUTO_INCREMENT COMMENT '商品評論編號'
        PRIMARY KEY,
    COM_NO         INT                                 NOT NULL COMMENT '商品編號',
    MEM_ID         INT                                 NOT NULL COMMENT '會員編號',
    RATING         TINYINT   DEFAULT 5                 NOT NULL COMMENT '評分，(1~5分)',
    COM_CONTENT    VARCHAR(200)                        NULL COMMENT '評論內容',
    COM_TIME       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '評論時間',
    CONSTRAINT COMMODITY_COMMENT_COMMODITY_COM_NO_FK
        FOREIGN KEY (COM_NO) REFERENCES DIYLA.COMMODITY (COM_NO),
    CONSTRAINT COMMODITY_COMMENT_MEMBER_MEM_ID_FK
        FOREIGN KEY (MEM_ID) REFERENCES DIYLA.MEMBER (MEM_ID)
)
    COMMENT '商品評論';

CREATE TABLE SHOPPING_CART_LIST
(
    MEM_ID     INT NOT NULL COMMENT '會員編號',
    COM_NO     INT NOT NULL COMMENT '商品編號',
    COM_AMOUNT INT NOT NULL COMMENT '商品數量',
    CONSTRAINT SHOPPING_CART_LIST_COMMODITY_COM_NO_FK
        FOREIGN KEY (COM_NO) REFERENCES DIYLA.COMMODITY (COM_NO),
    CONSTRAINT SHOPPING_CART_LIST_MEMBER_MEM_ID_FK
        FOREIGN KEY (MEM_ID) REFERENCES DIYLA.MEMBER (MEM_ID)
) COMMENT '購物車清單';


CREATE TABLE LATESTNEWS
(
    NEWS_NO      INT PRIMARY KEY AUTO_INCREMENT,
    NEWS_CONTEXT VARCHAR(8000) NOT NULL,
    ANN_PIC      LONGBLOB,
    ANN_STATUS   TINYINT       NOT NULL DEFAULT '0' COMMENT '0:下架，1:上架',
    ANN_TIME     TIMESTAMP     NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE COMMONPROBLEM
(
    PBM_NO      INT PRIMARY KEY AUTO_INCREMENT,
    PBM_SORT    TINYINT      NOT NULL COMMENT '0:課程，1:DIY，2:商店，3:其他',
    PBM_TITLE   VARCHAR(40)  NOT NULL,
    PBM_CONTEXT VARCHAR(200) NOT NULL
);

CREATE TABLE ARTICLE
(
    ART_NO      INT PRIMARY KEY AUTO_INCREMENT,
    ART_TITLE   VARCHAR(45) NOT NULL,
    ART_PIC     LONGBLOB,
    ART_CONTEXT VARCHAR(8000),
    ART_TIME    TIMESTAMP   NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    ART_STATUS  TINYINT     NOT NULL DEFAULT '0' COMMENT '0:不顯示、不發代幣，1:顯示、發代幣，2:顯示、不發代幣',
    MEM_ID      INT         NOT NULL,
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID)
);

CREATE TABLE ARTICLE_MESSAGE
(
    MSG_NO      INT PRIMARY KEY AUTO_INCREMENT,
    MSG_CONTEXT VARCHAR(800) NOT NULL,
    MSG_TIME    TIMESTAMP    NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    MSG_STATUS  TINYINT      NOT NULL DEFAULT '1' COMMENT '0:不顯示，1:顯示',
    MEM_ID      INT          NOT NULL,
    ART_NO      INT          NOT NULL,
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID),
    FOREIGN KEY (ART_NO) REFERENCES ARTICLE (ART_NO)
);

CREATE TABLE ARTICLE_MESSAGE_REPORT
(
    RPMSG_NO      INT PRIMARY KEY AUTO_INCREMENT,
    RPMSG_CONTEXT VARCHAR(100) NOT NULL,
    RPMSG_TIME    TIMESTAMP    NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    RPMSG_STATUS  TINYINT      NOT NULL DEFAULT '0' COMMENT '0:審核中，1:已刪除，2:取消檢舉',
    MEM_ID        INT          NOT NULL,
    MSG_NO        INT          NOT NULL,
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID),
    FOREIGN KEY (MSG_NO) REFERENCES ARTICLE_MESSAGE (MSG_NO)
);

CREATE TABLE TOKEN
(
    TOKEN_NO     INT PRIMARY KEY AUTO_INCREMENT,
    TOKEN_COUNT  INT       NOT NULL COMMENT '正:獲得，負:使用',
    TOKEN_GETUSE TINYINT   NOT NULL COMMENT '0:文章，1:商店，2:課程，3:逾期',
    TOKEN_TIME   TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    MEM_ID       INT       NOT NULL,
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID)
);


CREATE TABLE TEACHER
(
    `TEA_ID`     INT          NOT NULL AUTO_INCREMENT,
    `EMP_ID`     INT          NOT NULL,
    `TEA_NAME`   VARCHAR(20)  NOT NULL,
    `TEA_GENDER` TINYINT      NOT NULL,
    `TEA_PHONE`  VARCHAR(20)  NOT NULL,
    `TEA_INTRO`  VARCHAR(500) NOT NULL,
    `TEA_PIC`    LONGBLOB,
    `TEA_EMAIL`  VARCHAR(50)  NOT NULL,
    `TEA_STATUS` TINYINT      NOT NULL,
    FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`),
    PRIMARY KEY (`TEA_ID`)
);

CREATE TABLE CLASS
(
    `CLASS_ID`     INT          NOT NULL AUTO_INCREMENT,
    `CATEGORY`     TINYINT      NOT NULL, -- (1:蛋糕，2:餅乾，3:麵包，4:法式點心，5:中式甜點，6:其他)
    `TEA_ID`       INT          NOT NULL,
    `REG_END_TIME` DATETIME     NOT NULL,
    `CLASS_DATE`   DATE         NOT NULL, -- +CLASS_SEQ為UK
    `CLASS_SEQ`    TINYINT      NOT NULL, -- (0:早上，1:下午，2:晚上) + CLASS_DATE為UK
    `CLASS_PIC`    LONGBLOB,
    `LIMIT`        INT          NOT NULL,
    `PRICE`        INT          NOT NULL,
    `INTRO`        VARCHAR(500) NOT NULL,
    `CLASS_NAME`   VARCHAR(20)  NOT NULL,
    `HEADCOUNT`    INT          NOT NULL,
    `CLASS_STATUS`  TINYINT      NOT NULL, -- (0:下架，1:上架，2:已結束，3:取消)
    PRIMARY KEY (`CLASS_ID`),
    FOREIGN KEY (`TEA_ID`) REFERENCES `TEACHER` (`TEA_ID`),
    UNIQUE KEY `UK_CLASS_DATE_SEQ` (`CLASS_DATE`, `CLASS_SEQ`)
);

CREATE TABLE CLASS_RESERVE
(
    `RESERVE_ID`  INT       NOT NULL AUTO_INCREMENT,
    `CLASS_ID`    INT       NOT NULL,
    `MEM_ID`      INT       NOT NULL,
    `HEADCOUNT`   INT       NOT NULL,
    `STATUS`      TINYINT   NOT NULL, -- (0:預約單建立，1:預約單付款完成，2:預約單取消(未退款)，3.預約單取消(退款完成)，4.預約單完成)'
    `CREATE_TIME` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `TOTAL_PRICE` INT       NOT NULL,
    FOREIGN KEY (`MEM_ID`) REFERENCES `MEMBER` (`MEM_ID`),
    FOREIGN KEY (`CLASS_ID`) REFERENCES `CLASS` (`CLASS_ID`),
    PRIMARY KEY (`RESERVE_ID`)
);


CREATE TABLE SPECIALITY
(
    `SPE_ID`   INT         NOT NULL,
    `SPE_NAME` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`SPE_ID`)
);


CREATE TABLE TEA_SPECIALITY
(
    `TEA_ID` INT NOT NULL,
    `SPE_ID` INT NOT NULL,
    FOREIGN KEY (`TEA_ID`) REFERENCES `TEACHER` (`TEA_ID`),
    FOREIGN KEY (`SPE_ID`) REFERENCES `SPECIALITY` (`SPE_ID`),
    PRIMARY KEY (`TEA_ID`, `SPE_ID`)
);


CREATE TABLE ING_STORAGE
(
    `ING_ID`       INT         NOT NULL AUTO_INCREMENT,
    `BRAND`        VARCHAR(20) NOT NULL,
    `ING_NUMS`     INT         NOT NULL,
    `ING_NAME`     VARCHAR(20) NOT NULL,
    `STATUS`       TINYINT     NOT NULL DEFAULT 0,
    `SERVING_SIZE` INT         NOT NULL DEFAULT 1,
    PRIMARY KEY (`ING_ID`)
);


CREATE TABLE CLASS_INGREDIENT
(
    `CLASS_ID`  INT NOT NULL,
    `ING_ID`    INT NOT NULL,
    `ING_COUNT` INT NOT NULL,
    FOREIGN KEY (`CLASS_ID`) REFERENCES `CLASS` (`CLASS_ID`),
    FOREIGN KEY (`ING_ID`) REFERENCES `ING_STORAGE` (`ING_ID`),
    PRIMARY KEY (`CLASS_ID`, `ING_ID`)
);


CREATE TABLE ING_IMPORT
(
    `IMP_ID`    INT      NOT NULL,
    `ING_ID`    INT      NOT NULL,
    `ING_COUNT` INT      NOT NULL,
    `IMP_TIME`  DATETIME NOT NULL,
    FOREIGN KEY (`ING_ID`) REFERENCES `ING_STORAGE` (`ING_ID`),
    PRIMARY KEY (`IMP_ID`, `ING_ID`)
);

CREATE TABLE DIY_CATE
(
    DIY_NO            INT           NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'DIY品項編號',
    DIY_NAME          VARCHAR(20)   NOT NULL COMMENT 'DIY品項名稱',
    DIY_STATUS        TINYINT       NOT NULL DEFAULT 0 COMMENT '狀態，(0:上架，1:下架)',
    DIY_CATE_NAME     TINYINT       NOT NULL DEFAULT 0 COMMENT 'DIY類別，(0:小點心，1:蛋糕，2:塔派，3:生乳酪)',
    DIY_PIC           longblob COMMENT 'DIY圖片',
    ITEM_DETAILS      VARCHAR(1000) NOT NULL COMMENT '品項詳情',
    AMOUNT            INT           NOT NULL COMMENT 'DIY金額'
);

-- DIY訂單
CREATE TABLE DIY_ORDER
(
    DIY_ORDER_NO       INT         NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'DIY訂單編號',
    MEM_ID             INT         NOT NULL COMMENT '會員編號',
    DIY_NO             INT         NOT NULL COMMENT 'DIY品項編號',
    CONTACT_PERSON     VARCHAR(20) NOT NULL COMMENT '聯絡人',
    CONTACT_PHONE      VARCHAR(20) NOT NULL COMMENT '聯絡電話',
    RESERVATION_NUM    INT         NOT NULL COMMENT '預約人數',
    DIY_PERIOD         INT         NOT NULL DEFAULT 0 COMMENT '預約時段，(0:上午，1:下午，2:晚上)',
    DIY_RESERVE_DATE   DATE        NOT NULL COMMENT 'DIY預約日期',
    CREATE_TIME        TIMESTAMP            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '預約單建立時間',
    RESERVATION_STATUS TINYINT     NOT NULL DEFAULT 0 COMMENT '預約狀態',
    PAYMENT_STATUS     TINYINT     NOT NULL DEFAULT 0 COMMENT '付款狀態',
    DIY_PRICE          INT         NOT NULL COMMENT 'DIY訂單金額',
    CONSTRAINT DIY_ORDER_MEM_ID_FK
        FOREIGN KEY (MEM_ID) REFERENCES DIYLA.MEMBER (MEM_ID),
    CONSTRAINT DIY_ORDER_DIY_NO_FK
        FOREIGN KEY (DIY_NO) REFERENCES DIYLA.DIY_CATE (DIY_NO)
);

CREATE TABLE DIY_FORUM
(
    ARTI_NO           INT PRIMARY KEY AUTO_INCREMENT,
    MEM_ID            INT             NOT NULL,
    DIY_NO            INT             NOT NULL,
    ARTI_CONT         VARCHAR(1000)   NOT NULL,
    DIY_GRA           TINYINT         NOT NULL DEFAULT '5' COMMENT '1:一分,2:兩分,3:三分,4:四分,5:五分',
    CREATE_TIME       TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立評論時間',
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID),
    FOREIGN KEY (DIY_NO) REFERENCES DIY_CATE (DIY_NO)
) COMMENT 'DIY討論區';

CREATE TABLE DIY_RESERVE_RESULT
(
    DIY_RESERVE_NO   INT PRIMARY KEY AUTO_INCREMENT,
    DIY_RESERVE_DATE DATE      NOT NULL,
    DIY_PERIOD       TINYINT   NOT NULL DEFAULT '0' COMMENT '0:上午,1:下午,2:晚上',
    PEO_COUNT        INT       NOT NULL,
    RESERVE_STATUS   TINYINT   NOT NULL DEFAULT '0' COMMENT '0:正常,1:不可預約',
    RESERVE_UPD_TIME TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    PEO_LIMIT        INT       NOT NULL,
    ITEM_QUANTITY    INT       NOT NULL
) COMMENT 'DIY預約匯總結果';

CREATE TABLE DIY_ING
(
    DIY_NO    INT NOT NULL,
    ING_ID    INT NOT NULL,
    ING_COUNT INT NOT NULL,
    PRIMARY KEY (DIY_NO, ING_ID),
    FOREIGN KEY (DIY_NO) REFERENCES DIY_CATE (DIY_NO),
    FOREIGN KEY (ING_ID) REFERENCES ING_STORAGE (ING_ID)
) COMMENT 'DIY使用食材明細';

CREATE TABLE NOTICE
(
    NOTICE_NO      INT PRIMARY KEY AUTO_INCREMENT,
    MEM_ID         INT           NOT NULL,
    NOTICE_TITLE   VARCHAR(50)   NOT NULL,
    NOTICE_TIME    TIMESTAMP     NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    NOTICE_STATUS  TINYINT       NOT NULL DEFAULT '0' COMMENT '未讀取0,讀取1',
    CONSTRAINT FK_MEMBER_MEMID
        FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID)
);

CREATE TABLE CHATROOM
(
    CHAT_NO      INT PRIMARY KEY AUTO_INCREMENT,
    MEM_ID       INT           NOT NULL,
    TEA_ID       INT           NOT NULL,
    CHAT_TIME    TIMESTAMP     NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    CHAT_CONTEXT VARCHAR(1000) NOT NULL,
    CHAT_DIR     TINYINT       NOT NULL COMMENT '師傅對會員0,會員對師傅1',
    CONSTRAINT FK_MEMCHAT_MEMID
        FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID)
);







