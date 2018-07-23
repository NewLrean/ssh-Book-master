package com.jzp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.jzp.entity.Users;
import com.jzp.service.UserInfoService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by renba on 2017/6/14.
 */
@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class UsersAction extends ActionSupport implements ModelDriven<Users>, ServletResponseAware {
    private Users users = new Users();
    @Autowired
    private UserInfoService userInfoService;
    HttpServletResponse response;

    @Action(value = "allusers", results = {@Result(location = "/usermanagement.jsp")})
    public String alluser() {
        ActionContext context = ActionContext.getContext();
        List<Users> usersList = userInfoService.alluser();
        context.getSession().put("allusers", usersList);
        List<Users> users = new ArrayList<>();
        int userpagenumber;
        if (usersList.size() > 10) {
            if (usersList.size() % 10 != 0) {
                userpagenumber = (usersList.size() / 10) + 1;
            } else {
                userpagenumber = (usersList.size() / 10);
            }
            for (int i = 0; i < 10; i++) {
                users.add(usersList.get(i));

            }
            context.getSession().put("users", users);
        } else {
            userpagenumber = 1;
            context.getSession().put("users", usersList);
        }
        context.getSession().put("usercurrentpage", "1");
        context.getSession().put("userpagenumber", userpagenumber);
        return SUCCESS;
    }

    /**
     * 翻页
     *
     * @throws IOException
     */
    @Action("userindexpage")
    public void indexpage() throws IOException {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String selectusername = request.getParameter("selectusername");
        System.out.println(selectusername + "dsfdghfuiuiytr");
        int index = Integer.parseInt(request.getParameter("index"));
        List<Users> usersList = (List<Users>) context.getSession().get("allusers");
        List<Users> users = new ArrayList<>();
        int userpagenumber;
        if (usersList.size() % 10 != 0) {
            userpagenumber = (usersList.size() / 10) + 1;
        } else {
            userpagenumber = (usersList.size() / 10);
        }
        if (index == userpagenumber) {
            for (int i = (10 * (index - 1)); i < usersList.size(); i++) {
                users.add(usersList.get(i));
            }
            context.getSession().put("usercurrentpage", index + "");
            context.getSession().put("users", users);
            context.getSession().put("selectusername", selectusername);
            context.getSession().put("userpagenumber", userpagenumber);
            response.getWriter().print(true);

        } else if (usersList.size() != 0) {
            for (int i = (10 * (index - 1)); i < 10 * index; i++) {
                users.add(usersList.get(i));
            }
            context.getSession().put("usercurrentpage", index + "");
            context.getSession().put("users", users);
            context.getSession().put("selectusername", selectusername);
            context.getSession().put("userpagenumber", userpagenumber);
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    /**
     * 根据书名查询
     *
     * @throws IOException
     */
    @Action("selectuser")
    public void selectuser() {
        try {
            ActionContext context = ActionContext.getContext();
            HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
            String username = request.getParameter("selectusername");
            List<Users> usersList = userInfoService.selectuser(username);
            System.out.println(usersList.size());
            context.getSession().put("allusers", usersList);
            List<Users> users = new ArrayList<>();
            int userpagenumber;
            if (usersList.size() % 10 != 0) {
                userpagenumber = (usersList.size() / 10) + 1;
            } else {
                userpagenumber = (usersList.size() / 10);
            }
            if (usersList.size() != 0) {
                if (usersList.size() > 10) {
                    for (int i = 0; i < 10; i++) {
                        users.add(usersList.get(i));
                    }
                } else {
                    for (int i = 0; i < usersList.size(); i++) {
                        users.add(usersList.get(i));
                    }
                }
                context.getSession().put("usercurrentpage", "1");
                context.getSession().put("users", users);
                context.getSession().put("selectusername", username);
                context.getSession().put("userpagenumber", userpagenumber);
                response.getWriter().print(true);
            } else {
                response.getWriter().print(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Action("adduser")
    public void adduser() throws IOException {
        if (userInfoService.adduser(users)) {
            updateusersession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    @Action("updateuser")
    public void updateuser() throws IOException {
        if (userInfoService.updateuser(users)) {
            updateusersession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    @Action("deleteuser")
    public void deleteuser() throws IOException {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("id");
        Users users = new Users();
        users.setId(Integer.parseInt(id));
        if (userInfoService.deleteuser(users)) {
            updateusersession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    private void updateusersession() {
        ActionContext context = ActionContext.getContext();
        List<Users> usersList = userInfoService.alluser();
        context.getSession().put("allusers", usersList);
        List<Users> users = new ArrayList<>();
        int userpagenumber;
        if (usersList.size() % 10 != 0) {
            userpagenumber = (usersList.size() / 10) + 1;
        } else {
            userpagenumber = (usersList.size() / 10);
        }
        if (usersList.size() > 10) {
            for (int i = 0; i < 10; i++) {
                users.add(usersList.get(i));
            }
        } else {
            for (int i = 0; i < usersList.size(); i++) {
                users.add(usersList.get(i));
            }
        }
        context.getSession().put("usercurrentpage", "1");
        context.getSession().put("users", users);
        context.getSession().put("userpagenumber", userpagenumber);
    }

    @Override
    public Users getModel() {
        return users;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
}
