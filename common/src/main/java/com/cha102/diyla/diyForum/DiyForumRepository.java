package com.cha102.diyla.diyForum;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface DiyForumRepository extends JpaRepository<DiyForumEntity,Integer>, JpaSpecificationExecutor<DiyForumEntity> {

}
