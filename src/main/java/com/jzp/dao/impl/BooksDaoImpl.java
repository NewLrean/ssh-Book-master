package com.jzp.dao.impl;

import com.jzp.dao.BooksDao;
import com.jzp.entity.Users;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jzp.entity.Books;

import java.util.List;

/**
 * Created by renba on 2017/6/14.
 */
@Repository
public class BooksDaoImpl implements BooksDao {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean addbook(Books books) {
        boolean flag;
        try {
            this.getCurrentSession().save(books);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;

    }

    @Override
    public boolean deletebook(Books books) {
        boolean flag;
        try {
            this.getCurrentSession().delete(books);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;
    }

    @Override
    public boolean updatebook(Books books) {
        boolean flag;
        try {
            this.getCurrentSession().update(books);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;
    }

    @Override
    public List<Books> allbook() {
        Query query = this.getCurrentSession().createQuery("from Books");
        return query.list();
    }

    @Override
    public Books selectId(int id) {
        Criteria criteria = this.getCurrentSession().createCriteria(Users.class);
        criteria.add(Restrictions.eq("id", id));
        return (Books) criteria.list();
    }

    @Override
    public List<Books> selecttitle(String title) {
        Criteria criteria = this.getCurrentSession().createCriteria(Books.class);
        criteria.add(Restrictions.like("title", "%" + title + "%"));
        return criteria.list();
    }
}
