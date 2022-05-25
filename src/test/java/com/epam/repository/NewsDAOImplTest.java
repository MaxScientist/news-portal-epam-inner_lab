package com.epam.repository;

import com.epam.entity.News;
import junit.framework.TestCase;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.time.LocalDate;

import static com.epam.NewsTestData.*;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class NewsDAOImplTest extends TestCase {

    @Mock
    private NewsDAO newsDAO;

    @Rule
    public ExpectedException expectedException = ExpectedException.none();

    public News news;
    public LocalDate testDate;

    @Before
    public void setUp() {
        testDate = LocalDate.parse(TEST_STRING_DATE, FORMATTER);
        news = new News(TEST_TEXT, TEST_TEXT, TEST_TEXT, TEST_LANG_RU, testDate);
        news.setId(1L);
    }


    @Test
    public void testSaveOrUpdateNews_WhenEverythingIsOk() {
        when(newsDAO.saveOrUpdateNews(news)).thenReturn(news);
        News resultNews = newsDAO.saveOrUpdateNews(news);
        Assert.assertEquals(resultNews, news);
    }

}
