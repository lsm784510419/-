package com.fh.shop.admin.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.fh.shop.admin.biz.user.IuserService;
import com.fh.shop.admin.po.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    //注入service
    @Autowired
    private IuserService iuserService;
    //去add页面
    @RequestMapping("/toAdd")
    public String toAdd(){

        return "user/add";
    }
    //新增方法
    @RequestMapping("/add")
    public String add(User user){
        iuserService.add(user);
        return "user/list";
    }

    //去展示页面方法
    @RequestMapping("toList")
    public String toList(){

        return "user/list";
    }
    //展示页面方法
    @RequestMapping("queryList")
    @ResponseBody
    public String queryList(
            Integer draw,
            Integer start,
            Integer length
        ){
        Map<String,Object> map=new HashMap<>();
        map.put("start",start);
        map.put("length",length);
        int count=iuserService.queryCount(map);
        List<User> list= iuserService.queryList(map);
        Map<String,Object> map1 =new HashMap<>();
        map1.put("draw",draw);
        map1.put("recordsTotal",count);
        map1.put("recordsFiltered",count);
        map1.put("data",list);
        String jsonString = JSONObject.toJSONString(map1);
        return jsonString;
    }

    //删除方法
    @RequestMapping("delUser")
    public String delUser(Long id){
        iuserService.delUser(id);
        return "user/list";
    }
    //回显方法
    @RequestMapping("toUpdate")
    @ResponseBody
    public String toUpdate(Long id){
        User user=iuserService.toUpdate(id);
        String jsonString = JSONObject.toJSONString(user);
        return jsonString;
    }
    @RequestMapping("update")
    public String update(User user){
        iuserService.update(user);
        return "user/list";
    }
}
