package com.tedu.dao;

import java.util.List;

import com.tedu.classes.worker;

public interface worker_manageDao {
	public List<worker> getallworkers();
	public void workerinsert(worker w);
	public void deleteworker(worker w);
	public void workerupdate(worker w);
	public List<worker> getworkerbyId(String value);
}
