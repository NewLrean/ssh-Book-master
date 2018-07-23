package com.jzp.action;

import com.opensymphony.xwork2.ActionContext;
import com.jzp.entity.Admin;
import com.jzp.service.BooksService;
import com.jzp.service.UserInfoService;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.jzp.entity.Books;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class AdmiInfoAction extends ActionSupport implements
        ModelDriven<Admin>, ServletResponseAware {
    private static final long serialVersionUID = -2301203156032690317L;
    private static final Logger LOGGER = Logger.getLogger(AdmiInfoAction.class);
    private Admin admin = new Admin();
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    BooksService booksService;
    HttpServletResponse response;


    @Action(value = "loginout", results = {@Result(location = "/login.jsp")})
    public String loginout() {
        ActionContext context = ActionContext.getContext();
        context.getSession().remove("username");
        context.getSession().clear();
        return SUCCESS;
    }

    /**
     * 登录验证
     *
     * @throws IOException
     */
    @Action(value = "validation")
    public void validation() throws IOException {
        ActionContext context = ActionContext.getContext();
        context.getSession().put("username", admin.getUsername());
        if (userInfoService.selectAdmin(admin.getUsername(), admin.getPassword())) {
            context.getSession().put("username", admin.getUsername());
            List<Books> allbooks = booksService.allbook();
            context.getSession().put("allbooks", allbooks);
            List<Books> books = new ArrayList<>();
            int pagenumber;
            if (allbooks.size() > 10) {
                if (allbooks.size() % 10 != 0) {
                    pagenumber = (allbooks.size() / 10) + 1;
                } else {
                    pagenumber = (allbooks.size() / 10);
                }
                for (int i = 0; i < 10; i++) {
                    books.add(allbooks.get(i));

                }
                context.getSession().put("books", books);
            } else {
                pagenumber = 1;
                context.getSession().put("books", allbooks);
            }
            context.getSession().put("currentpage", "1");
            context.getSession().put("pagenumber", pagenumber);
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    /**
     * 翻页
     *
     * @throws IOException
     */
    @Action("indexpage")
    public void indexpage() throws IOException {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String title = request.getParameter("title");
        int index = Integer.parseInt(request.getParameter("index"));
        LOGGER.info(title + index);
        List<Books> allbooks = (List<Books>) context.getSession().get("allbooks");
        List<Books> books = new ArrayList<>();
        int pagenumber;
        if (allbooks.size() % 10 != 0) {
            pagenumber = (allbooks.size() / 10) + 1;
        } else {
            pagenumber = (allbooks.size() / 10);
        }
        if (index == pagenumber) {
            for (int i = (10 * (index - 1)); i < allbooks.size(); i++) {
                books.add(allbooks.get(i));
            }
            context.getSession().put("currentpage", index + "");
            context.getSession().put("books", books);
            context.getSession().put("title", title);
            context.getSession().put("pagenumber", pagenumber);
            response.getWriter().print(true);

        } else if (allbooks.size() != 0) {
            for (int i = (10 * (index - 1)); i < 10 * index; i++) {
                books.add(allbooks.get(i));
            }
            context.getSession().put("currentpage", index + "");
            context.getSession().put("books", books);
            context.getSession().put("title", title);
            context.getSession().put("pagenumber", pagenumber);
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    /**
     * 根据id查询书籍
     */
    @Action(value = "selectId", results = {@Result(location = "/index.jsp")})
    public void selectId() {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("selectid");
        LOGGER.info("selectid" + id);
        context.getSession().put("selectid", booksService.selectId(Integer.parseInt(id)));
    }

    /**
     * 根据书名查询
     *
     * @throws IOException
     */
    @Action("selecttitle")
    public void selecttitle() throws IOException {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String title = request.getParameter("title");
        LOGGER.info("selectid" + title);
        List<Books> booksList = booksService.selecttitle(title);
        System.out.println(booksList.size());
        context.getSession().put("allbooks", booksList);
        List<Books> books = new ArrayList<>();
        int pagenumber;
        if (booksList.size() % 10 != 0) {
            pagenumber = (booksList.size() / 10) + 1;
        } else {
            pagenumber = (booksList.size() / 10);
        }
        if (booksList.size() != 0) {
            if (booksList.size() > 10) {
                for (int i = 0; i < 10; i++) {
                    books.add(booksList.get(i));
                }
            } else {
                for (int i = 0; i < booksList.size(); i++) {
                    books.add(booksList.get(i));
                }
            }
            context.getSession().put("currentpage", "1");
            context.getSession().put("books", books);
            context.getSession().put("title", title);
            context.getSession().put("pagenumber", pagenumber);
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }


    public Admin getModel() {
        return admin;
    }


    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
}
