package com.fh.shop.admin.biz.user;

import com.fh.shop.admin.po.user.User;

import java.util.List;
import java.util.Map;

public interface IuserService {

    public void add(User user);

    int queryCount(Map<String, Object> map);

    List<User> queryList(Map<String, Object> map);

    void delUser(Long id);

    User toUpdate(Long id);

    void update(User user);
}
