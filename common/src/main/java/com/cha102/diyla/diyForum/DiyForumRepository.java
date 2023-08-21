package com.cha102.diyla.diyForum;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


public interface DiyForumRepository extends JpaRepository<DiyForumEntity,Integer>, JpaSpecificationExecutor<DiyForumEntity> {

}
