package com.cha102.diyla.sweetclass.classModel;

import com.cha102.diyla.sweetclass.teaModel.TeacherDAO;
import com.cha102.diyla.sweetclass.teaModel.TeacherDAOImpl;
import com.cha102.diyla.sweetclass.teaModel.TeacherVO;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class ClassService {
    private ClassDAO claDAO;
    private ClassReserveDAO resDAO;
    private ClassINGDAO ingDAO;
    public  ClassService(){
        claDAO = new ClassDAOImpl();
        resDAO = new ClassReserveDAOImpl();
        ingDAO = new ClassINGDAOImpl();
    }
    public ClassVO addClass(Integer category, Integer teaID, java.sql.Date regEndTime, java.sql.Date classDate, Integer classSEQ,
                            byte[] classPic, Integer classLimit, Integer price, String intro, String className,
                            Integer headcount, Integer classStatus) throws RuntimeException{
        ClassVO classVO = new ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setClassLimit(classLimit);
        classVO.setPrice(price);
        classVO.setIntro(intro);
        classVO.setClassName(className);
        classVO.setHeadcount(headcount);
        classVO.setClassStatus(classStatus);
        claDAO.insert(classVO);

        return classVO;
    }
    public ClassVO updateClass(Integer category, Integer teaID, Date regEndTime, Date classDate, Integer classSEQ,
                               byte[] classPic, Integer classLimit, Integer price, String intro, String className,
                               Integer headcount, Integer classStatus){

        ClassVO classVO = new ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setClassLimit(classLimit);
        classVO.setPrice(price);
        classVO.setIntro(intro);
        classVO.setClassName(className);
        classVO.setHeadcount(headcount);
        classVO.setClassStatus(classStatus);
        claDAO.update(classVO);
        return classVO;
    }
    public void deleteClass(Integer claID) {
        claDAO.delete(claID);
    }
    public ClassVO getOneClass(Integer claID) {
        return claDAO.findByPrimaryKey(claID);
    }
    public ClassVO getByDate(Date classDate) {
        return claDAO.findByDate(classDate);
    }
    public List<ClassVO> getAllClass(){
        return claDAO.getAll();
    }
    public ClassReserveVO userAddReserve(Integer classID, Integer memID, Integer headcount)  {
        ClassReserveVO classReserveVO = new ClassReserveVO();
        ClassDAO classDAO = new ClassDAOImpl();
        ClassVO classVO = classDAO.findByPrimaryKey(classID);
        classReserveVO.setClassId(classID);
        classReserveVO.setMemId(memID);
        classReserveVO.setHeadcount(headcount);
        classReserveVO.setStatus(0);
        classReserveVO.setTotalPrice(classVO.getPrice() * headcount);
        resDAO.insert(classReserveVO);
        return classReserveVO;
    }
    public boolean checkMemBlacklist(Integer memID){
        return false;
    }
    public String[] confirmUserReserve(Integer classID, Integer memID, Integer headcount, java.util.Date reserveDate){
        ClassDAO classDAO = new ClassDAOImpl();
        ClassReserveDAO classReserveDAO = new ClassReserveDAOImpl();
        ClassVO classVO = classDAO.findByPrimaryKey(classID);
        //抓取該member是否有預約課程的權利
        int blacklistStatus = classReserveDAO.findMemBlackListStatus(memID);
        //宣告需要比較的參數以及回傳的array
        int result = classVO.getClassStatus();
        String[] resultArray = new String[2];
        int currentHeadcount = classVO.getHeadcount();
        int limit = classVO.getClassLimit();
        Date courseEndDate = classVO.getRegEndTime();
        int dateCompareResult = courseEndDate.compareTo(reserveDate);
        if(result == 0 || result == 2 || result == 3){
            resultArray[0] = "false";
            resultArray[1] = "非常抱歉該課程無法報名,請報名其他課程";
        } else if (headcount > (limit - currentHeadcount)){
            resultArray[0] = "false";
            resultArray[1] = "非常抱歉該課程人數已滿, 請報名其他課程";
        } else if (dateCompareResult < 0) {
            resultArray[0] = "false";
            resultArray[1] = "非常抱歉,該課程報名已截止,請報名其他課程";
        } else if (blacklistStatus == 1) {
            resultArray[0] = "false";
            resultArray[1] = "非常抱歉,似乎您沒有預約課程的權利,若有疑慮請聯絡客服";
        } else {
            resultArray[0] = "true";
            resultArray[1] = "報名成功";
        }
        return resultArray;
    }


    public ClassReserveVO updateReserve(Integer classID, Integer memID, Integer headcount, Integer status, Timestamp createTime, Integer totalPrice, Integer reserveID){
        ClassReserveVO classReserveVO = new ClassReserveVO();
        classReserveVO.setClassId(classID);
        classReserveVO.setMemId(memID);
        classReserveVO.setHeadcount(headcount);
        classReserveVO.setStatus(status);
        classReserveVO.setCreateTime(createTime);
        classReserveVO.setTotalPrice(totalPrice);
        classReserveVO.setReserveId(reserveID);
        resDAO.update(classReserveVO);
        return classReserveVO;
    }
    public void delReserve(Integer resID){
        resDAO.delete(resID);
    }
    public JSONArray getReserveByTeaId(Integer teaId) {
        ClassService classService = new ClassService();
        List<ClassReserveVO> courseList = classService.getAllReserve();
        JSONArray jsonArray = new JSONArray();
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        ClassReserveDAO reserveDAO = new ClassReserveDAOImpl();
        ClassVO course;
        TeacherVO teacherVO = teacherDAO.findByPrimaryKey(teaId);
        ClassDAO classDAO = new ClassDAOImpl();
        String pattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);

        for (ClassReserveVO reserves : courseList) {
            Integer reserveTeaId = classDAO.findByPrimaryKey(reserves.getClassId()).getTeaId();
            Integer courseSeq = classDAO.findByPrimaryKey(reserves.getClassId()).getClassSeq();
            Date courseDate = classDAO.findByPrimaryKey(reserves.getClassId()).getClassDate();
            String courseDateSeq = classService.combineDateSeq(courseDate, courseSeq);
            course = classDAO.findByPrimaryKey(reserves.getClassId());
            //-1 means get all reserve for admin viewing all the reserve detail.
            if (teaId == -1 || reserveTeaId == teaId){
                JSONObject jsonCourse = new JSONObject();
                jsonCourse.put("reserveId", reserves.getReserveId());
                jsonCourse.put("memId", reserves.getMemId());
                jsonCourse.put("memName", reserveDAO.getMemName(reserves.getMemId()));
                jsonCourse.put("headcount", reserves.getHeadcount());
                jsonCourse.put("status", getReserveStatus(reserves.getStatus()));
                jsonCourse.put("courseId", reserves.getClassId());
                jsonCourse.put("courseName", course.getClassName());
                jsonCourse.put("courseDateSeq", courseDateSeq);
                System.out.println(reserves.getCreateTime());
                jsonCourse.put("createTime", dateFormat.format(reserves.getCreateTime()));
                jsonCourse.put("totalPrice", reserves.getTotalPrice());
                jsonArray.put(jsonCourse);
            }
        }
        return jsonArray;
    }
    public String getReserveStatus (Integer status) {
        ReserveStatus reserveStatus = ReserveStatus.getByValue(status);
        if (reserveStatus != null) {
            return reserveStatus.getDescription();
        } else {
            throw new IllegalArgumentException("Invalid reserve status value: " + status);
        }
    }
    public enum ReserveStatus {
        CREATED(0, "預約單建立"),
        PAID(1, "付款完成"),
        CANCELED_UNREFUNDED(2, "預約單取消(未退款)"),
        CANCELED_REFUNDED(3, "預約單取消(已退款)"),
        COMPLETED(4, "預約單完成");


        private final int value;
        private final String description;

        ReserveStatus(int value, String description) {
            this.value = value;
            this.description = description;
        }

        public int getValue() {
            return value;
        }

        public String getDescription() {
            return description;
        }

        public static ReserveStatus getByValue(int value) {
            for (ReserveStatus reserveStatus : ReserveStatus.values()) {
                if (reserveStatus.getValue() == value) {
                    return reserveStatus;
                }
            }
            return null;
        }
    }

    public String combineDateSeq(Date courseDate, Integer courseSeq) {
        String Time = "";
        if (courseSeq == 0) {
            Time = "早上";
        } else if (courseSeq == 1) {
            Time = "下午";
        } else if (courseSeq == 2) {
            Time = "晚上";
        }
        String courseDateSeq = courseDate + " " + Time;
        return courseDateSeq;
    }
    public void updateReserveStatus(Integer resID, Integer status) {
        ClassReserveVO classReserveVO = resDAO.findByPrimaryKey(resID);
        classReserveVO.setStatus(status);
        resDAO.update(classReserveVO);
    }
    public ClassReserveVO getOneReserve(Integer resID) {
        return resDAO.findByPrimaryKey(resID);
    }
    public List<ClassReserveVO> getAllReserve(){
        return resDAO.getAll();
    }
    public ClassINGVO addClassING(Integer classID, Integer ingId, Integer ingNums){
        ClassINGVO classINGVO =new ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.insert(classINGVO);
        return classINGVO;
    }
    public ClassINGVO updateClassING(Integer classID, Integer ingId, Integer ingNums){
        ClassINGVO classINGVO =new ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.update(classINGVO);
        return classINGVO;
    }
    public void deleteClassIng(Integer classID, Integer ingID){
        ingDAO.delete(classID,ingID);
    }
    public ClassINGVO getOneClassIng(Integer classID, Integer ingID){
        return ingDAO.findByPrimaryKey(classID,ingID);
    }
    public List<Integer> getOneClassIngID(Integer classID) {
        return ingDAO.findIngIdByClaId(classID);
    }
    public List<ClassINGVO> findAllClassIng(){
        return ingDAO.getAll();
    }
}