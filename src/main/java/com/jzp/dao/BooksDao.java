package com.jzp.dao;

import com.jzp.entity.Books;

import java.util.List;

/**
 * Created by renba on 2017/6/14.
 */
public interface BooksDao {
    boolean addbook(Books books);

    boolean deletebook(Books books);

    boolean updatebook(Books books);

    List<Books> allbook();

    Books selectId(int id);

    List<Books> selecttitle(String title);
}
