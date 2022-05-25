package com.epam.repository;

import com.epam.entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDAOImpl implements NewsDAO {


    private final SessionFactory sessionFactory;

    @Autowired
    public NewsDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public News getNewsById(final long id) {
        try (final Session currentSession = sessionFactory.getCurrentSession()) {

            currentSession.beginTransaction();
            News news = currentSession.get(News.class, id);
            currentSession.getTransaction().commit();

            return news;
        }
    }

    @Override
    public News saveOrUpdateNews(final News news) {
        try (final Session currentSession = sessionFactory.getCurrentSession()) {

            currentSession.beginTransaction();
            currentSession.merge(news);
            currentSession.getTransaction().commit();

            return news;
        }
    }

    @Override
    public List<News> getAllNews() {
        try (final Session currentSession = sessionFactory.getCurrentSession()) {
            currentSession.beginTransaction();

            Query<News> query = currentSession.createQuery("from News ", News.class);
            List<News> newsList = query.getResultList();

            currentSession.getTransaction().commit();

            return newsList;
        }
    }

    @Override
    public List<News> getAllNewsByLanguage(String language) {
        try (final Session currentSession = sessionFactory.getCurrentSession()) {

            currentSession.beginTransaction();

            Query<News> query = currentSession.createQuery("FROM News WHERE language=:LANG", News.class);
            query.setParameter("LANG", language);
            List<News> newsList = query.getResultList();

            currentSession.getTransaction().commit();

            return newsList;
        }
    }

    @Override
    public void deleteNews(final long id) {
        try (final Session currentSession = sessionFactory.getCurrentSession()) {

            currentSession.beginTransaction();

            News news = new News();
            news.setId(id);

            currentSession.delete(news);
            currentSession.getTransaction().commit();
        }
    }
}
