package com.epam.repository;

import com.epam.entity.News;

import java.util.List;

public interface NewsDAO {

    News saveOrUpdateNews(News news);

    News getNewsById(long id);

    List<News> getAllNews();

    List<News> getAllNewsByLanguage(String language);

    void deleteNews(long id);

}
