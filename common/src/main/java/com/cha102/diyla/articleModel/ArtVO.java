package com.cha102.diyla.articleModel;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ARTICLE")
public class ArtVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ART_NO")
    private Integer artNo;
    @NotEmpty(message = "請輸入文章標題")
    @Column(name = "ART_TITLE")
    private String artTitle;
    @Column(name = "ART_PIC")
    private byte[] artPic;
    @NotEmpty(message = "請輸入文章內容")
    @Column(name = "ART_CONTEXT")
    private String artContext;
    @Column(name = "ART_TIME", insertable = false, updatable = false)
    private Timestamp artTime;
    @Column(name = "ART_STATUS", insertable = false)
    private byte artStatus;
    @Column(name = "MEM_ID", updatable = false)
    private Integer memId;
}