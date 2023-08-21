package com.cha102.diyla.track;

import com.cha102.diyla.commodityModel.CommodityDao;
import com.cha102.diyla.commodityModel.CommodityDaoImpl;
import com.cha102.diyla.commodityModel.CommodityVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommodityTrackService {

    private CommodityTrackDAO commodityTrackDAO;
    private CommodityDao commodityDao = new CommodityDaoImpl();
    public CommodityTrackService(CommodityTrackDAO commodityTrackDAO) {
        this.commodityTrackDAO = commodityTrackDAO;
    }

    public List<CommodityVO> findAllByMemId(Integer memId) {
        List<CommodityTrackVO> commodityTrackVOS = commodityTrackDAO.findAllByMemId(memId);
        List<Integer> comNOs = commodityTrackVOS.stream().map(vo -> vo.getComNO()).collect(Collectors.toList());
        if (comNOs.size() != 0) {
            return commodityDao.getAllByComNo(comNOs);
        }
        return null;
    }
}