package com.jzp.service.impl;

import com.jzp.dao.BooksDao;
import com.jzp.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jzp.entity.Books;

import java.util.List;

/**
 * Created by renba on 2017/6/14.
 */
@Service
public class BooksServiceImpl implements BooksService {


    @Autowired
    BooksDao booksDao;

    @Override
    public boolean addbook(Books books) {
        return booksDao.addbook(books);
    }

    @Override
    public boolean deletebook(Books books) {
        return booksDao.deletebook(books);
    }

    @Override
    public boolean updatebook(Books books) {
        return booksDao.updatebook(books);
    }

    @Override
    public List<Books> allbook() {
        return booksDao.allbook();
    }

    @Override
    public Books selectId(int id) {
        return booksDao.selectId(id);
    }

    @Override
    public List<Books> selecttitle(String title) {
        return booksDao.selecttitle(title);
    }
}
