package com.cha102.diyla.diyReserveResult;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class DiyReserveResultService {
    @Resource
    private DiyReserveResultEntityRepository reserveResultRepository;


    public List<DIYReserveVO[]> getItemQuantityByDateRange(Date endDate) {
        return reserveResultRepository.getItemQuantityByDateRange(endDate);
    }
}
