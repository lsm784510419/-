package com.fh.shop.admin.biz.user;

import com.fh.shop.admin.mapper.user.IuserMapper;
import com.fh.shop.admin.po.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements IuserService {

    @Autowired
    private IuserMapper userMapper;
    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public int queryCount(Map<String, Object> map) {
        return userMapper.queryCount(map);
    }

    @Override
    public List<User> queryList(Map<String, Object> map) {
        return userMapper.queryList(map);
    }

    @Override
    public void delUser(Long id) {
        userMapper.delUser(id);
    }

    @Override
    public User toUpdate(Long id) {
        return userMapper.toUpdate(id);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }
}
