package com.cha102.diyla.diyForum;

import java.util.List;

public interface DiyForumDAO_Interface {
	public void insert(DiyForumDAO LatestnewsVO);
    public void update(DiyForumDAO LatestnewsVO);
    public void delete(Integer newsNo);
    public DiyForumDAO findByPrimaryKey(Integer newsNo);
    public List<DiyForumDAO> getAll();
}