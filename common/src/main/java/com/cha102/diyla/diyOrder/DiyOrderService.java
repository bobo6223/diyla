package com.cha102.diyla.diyOrder;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

public class DiyOrderService {
	private DiyOrderDAO_interface dao;

	public DiyOrderService() {
		dao = new DiyOrderDAO();
	}

	public void addOD(int memId, int diyNo, String contactPerson, String contactPhone, int reservationNum,
			int diyPeriod, Date diyReserveDate, Timestamp createTime, Byte reservationStatus, Byte paymentStatus,
			int diyPrice) {
		DiyOrderVO DOVO = new DiyOrderVO();
		DOVO.setMemId(memId);
		DOVO.setDiyNo(diyNo);
		DOVO.setContactPerson(contactPerson);
		DOVO.setContactPhone(contactPhone);
		DOVO.setReservationNum(reservationNum);
		DOVO.setDiyPeriod(diyPeriod);
		DOVO.setDiyReserveDate(diyReserveDate);
		DOVO.setReservationStatus(reservationStatus);
		DOVO.setPaymentStatus(paymentStatus);
		DOVO.setDiyPrice(diyPrice);
		dao.insert(DOVO);
	}

	public void upOD(int memId, int diyNo, String contactPerson, String contactPhone, int reservationNum,
			int diyPeriod, Date diyReserveDate, Timestamp createTime, Byte reservationStatus, Byte paymentStatus,
			int diyPrice) {

		DiyOrderVO DOVO = new DiyOrderVO();
		DOVO.setMemId(memId);
		DOVO.setDiyNo(diyNo);
		DOVO.setContactPerson(contactPerson);
		DOVO.setContactPhone(contactPhone);
		DOVO.setReservationNum(reservationNum);
		DOVO.setDiyPeriod(diyPeriod);
		DOVO.setDiyReserveDate(diyReserveDate);
		DOVO.setCreateTime(createTime);
		DOVO.setReservationStatus(reservationStatus);
		DOVO.setPaymentStatus(paymentStatus);
		DOVO.setDiyPrice(diyPrice);
		dao.update(DOVO);

	}

	public void deleteDO(Integer diyOrderNo) {
		dao.delete(diyOrderNo);
	}

	public DiyOrderVO getOneDO(Integer diyOrderNo) {
		return dao.findByPrimaryKey(diyOrderNo);
	}
	
	public List<DiyOrderVO> getAllDO(){
		return dao.getAll();
	}

}
