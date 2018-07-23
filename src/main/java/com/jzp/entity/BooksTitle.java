package com.jzp.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by renba on 2017/6/12.
 */
public class BooksTitle {
    private int pagenumber;
    private int totalnumber;
    List<Books> list = new ArrayList<>();

    public int getPagenumber() {
        return pagenumber;
    }

    public void setPagenumber(int pagenumber) {
        this.pagenumber = pagenumber;
    }

    public int getTotalnumber() {
        return totalnumber;
    }

    public void setTotalnumber(int totalnumber) {
        this.totalnumber = totalnumber;
    }

    public List<Books> getList() {
        return list;
    }

    public void setList(List<Books> list) {
        this.list = list;
    }
}
