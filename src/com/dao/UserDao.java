package com.dao;

import com.bean.*;

public interface UserDao {
	int save(UserBean user);
    int modifyUser(UserBean user);
    boolean login(String num, String pwd);
    boolean checkNum(String num);
    UserBean find(String num);
    int del(String num);
}
