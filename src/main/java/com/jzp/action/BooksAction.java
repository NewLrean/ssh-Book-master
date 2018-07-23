package com.jzp.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.jzp.entity.Books;
import com.jzp.service.BooksService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
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
public class BooksAction extends ActionSupport implements ModelDriven<Books>, ServletResponseAware {

    private Books books = new Books();
    private HttpServletResponse response;
    @Autowired
    private BooksService booksService;

    @Action("addbook")
    public void addbook() throws IOException {

        if (booksService.addbook(books)) {
            updatebooksession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    @Action("deletebook")
    public void deletebook() throws IOException {
        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("id");
        Books books1 = new Books();
        books1.setId(Integer.parseInt(id));
        if (booksService.deletebook(books1)) {
            updatebooksession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    @Action("updatebook")
    public void updatebook() throws IOException {
        System.out.println(books.getId());
        if (booksService.updatebook(books)) {
            updatebooksession();
            response.getWriter().print(true);
        } else {
            response.getWriter().print(false);
        }
    }

    public void updatebooksession() {
        ActionContext context = ActionContext.getContext();
        List<Books> allbooks = booksService.allbook();
        context.getSession().put("allbooks", allbooks);
        List<Books> books = new ArrayList<>();
        int pagenumber;
        if (allbooks.size() % 10 != 0) {
            pagenumber = (allbooks.size() / 10) + 1;
        } else {
            pagenumber = (allbooks.size() / 10);
        }
        if(allbooks.size()>10){
            for (int i = 0; i < 10; i++) {
                books.add(allbooks.get(i));
            }
        }
        else{
            for (int i = 0; i < allbooks.size(); i++) {
                books.add(allbooks.get(i));
            }
        }
        context.getSession().put("currentpage", "1");
        context.getSession().put("books", books);
        context.getSession().put("pagenumber", pagenumber);
    }

    @Override
    public Books getModel() {
        return books;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.response = httpServletResponse;
    }
}
