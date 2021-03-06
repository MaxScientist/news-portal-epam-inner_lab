package com.epam.service;

import com.epam.dto.NewsDTO;
import com.epam.entity.News;
import com.epam.exception.BusinessException;
import com.epam.repository.NewsDAO;
import org.junit.*;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static com.epam.NewsTestData.*;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class NewsServiceImplTest {

    @InjectMocks
    private NewsServiceImpl newsService;

    @Mock
    private NewsDAO newsDAO;

    public NewsDTO newsDTO;
    public News news;

    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();

    @Before
    public void init() {
        newsDTO = new NewsDTO(NEWS_ID_1, TEST_TEXT, TEST_TEXT,TEST_TEXT, TEST_STRING_DATE, TEST_LANG_RU);
        news = new News(TEST_TEXT, TEST_TEXT,TEST_TEXT, TEST_LANG_RU, TEST_DATE);
        news.setId(1L);
    }

    @Test
    @Ignore
    public void testSaveOrUpdateNews_WhenEverythingIsOk() throws BusinessException {
        // TODO NPE
        when(newsDAO.saveOrUpdateNews(news)).thenReturn(news);
        NewsDTO resultNewsDTO = newsService.saveOrUpdateNews(newsDTO);
        Assert.assertTrue(
                (resultNewsDTO.getId() == newsDTO.getId())
                        && (resultNewsDTO.getTitle().equals(newsDTO.getTitle()))
                        && (resultNewsDTO.getBrief().equals(newsDTO.getBrief()))
                        && (resultNewsDTO.getContent().equals(newsDTO.getContent()))
                        && (resultNewsDTO.getNewsDate().equals(newsDTO.getNewsDate()))
        );
    }

    @Test
    public void testSaveOrUpdateNews_WhenThrowsBusinessExceptionDateNotValid() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Not valid format of date");
        newsDTO.setNewsDate("wrong date");
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testSaveOrUpdateNews_WhenThrowsBusinessExceptionInvalidTitleLength() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Invalid title length");
        newsDTO.setTitle("0123456789".repeat(11));
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testSaveOrUpdateNews_WhenThrowsBusinessExceptionInvalidBriefLength() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Invalid brief length");
        newsDTO.setBrief("0123456789".repeat(51));
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testSaveOrUpdateNews_WhenThrowsBusinessExceptionInvalidContentLength() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Invalid content length");

        newsDTO.setId(1);
        newsDTO.setContent("0123456789".repeat(201));
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testSaveOrUpdateNews_WhenThrowsBusinessExceptionInvalidDateLength() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Invalid date length");
        newsDTO.setNewsDate("01234567890");
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testSaveOrUpdateNews_BusinessException_EmptyField() throws BusinessException {
        exceptionRule.expect(BusinessException.class);
        exceptionRule.expectMessage("Empty field");
        // TODO test every field and variant in diff test-method
        newsDTO.setTitle("");
        newsDTO.setBrief("a");
        newsDTO.setContent("a");
        newsDTO.setNewsDate("2020-01-01");
        newsService.saveOrUpdateNews(newsDTO);
    }

    @Test
    public void testGetNewsById_WhenEverythingIsOk() {
        when(newsDAO.getNewsById(news.getId())).thenReturn(news);
        NewsDTO resultNewsDTOFromService = newsService.getNewsById(news.getId());
        Assert.assertEquals(news.getId(), resultNewsDTOFromService.getId());
        Assert.assertEquals(news.getTitle(), resultNewsDTOFromService.getTitle());
        Assert.assertEquals(news.getBrief(), resultNewsDTOFromService.getBrief());
        Assert.assertEquals(news.getContent(), resultNewsDTOFromService.getContent());
        Assert.assertEquals(news.getNewsDate().toString(), resultNewsDTOFromService.getNewsDate());
    }

    @Test
    public void testGetNewsById_WhenThrowsNPE() {
        long testId = 1L;
        exceptionRule.expect(NullPointerException.class);
        when(newsDAO.getNewsById(testId)).thenThrow(new NullPointerException());
        newsService.getNewsById(testId);
    }

    @Test
    public void testGetAllNews_WhenEverythingIsOk() {
        List<News> testNewsList = new ArrayList<>();
        testNewsList.add(news);
        List<NewsDTO> expectedNewsDTOList =  new ArrayList<>();
        expectedNewsDTOList.add(newsDTO);
        when(newsDAO.getAllNews()).thenReturn(testNewsList);
        List<NewsDTO> resultList = newsService.getAllNews();
        Assert.assertEquals(expectedNewsDTOList.get(0).getId(), resultList.get(0).getId());
        Assert.assertEquals(expectedNewsDTOList.get(0).getTitle(), resultList.get(0).getTitle());
        Assert.assertEquals(expectedNewsDTOList.get(0).getBrief(), resultList.get(0).getBrief());
        Assert.assertEquals(expectedNewsDTOList.get(0).getContent(), resultList.get(0).getContent());
        Assert.assertEquals(expectedNewsDTOList.get(0).getNewsDate(), resultList.get(0).getNewsDate());
    }

    @Test
    public void testDeleteNews_WhenEverythingIsOk() {
        long testId = 1L;
        doNothing().when(newsDAO).deleteNews(testId);
        newsService.deleteNews(testId);
        // TODO should I check deleting when getNewsById(testId) ???
    }

    @Test
    public void testDeleteNews_WhenThrowsNPE() {
        long testId = 1L;
        exceptionRule.expect(NullPointerException.class);
        doThrow(new NullPointerException()).when(newsDAO).deleteNews(testId);
        newsService.deleteNews(testId);
    }

    @Test
    public void testDeleteNewsList_WhenEverythingIsOk() {
        long testId = 1L;
        List<Long> testLongList = new ArrayList<>();
        testLongList.add(testId);
        doNothing().when(newsDAO).deleteNews(testId);
        // TODO why test passed
//          doNothing().when(newsDAO).deleteNews(3L);
        //  3L instead of testId with 1L ???
        newsService.deleteNews(testLongList);
    }

    @Test
    public void testDeleteNewsList_WhenNPE() {
        long testId = 1L;
        List<Long> testLongList = new ArrayList<>();
        testLongList.add(testId);
        exceptionRule.expect(NullPointerException.class);
        doThrow(new NullPointerException()).when(newsDAO).deleteNews(testId);
        newsService.deleteNews(testLongList);
    }

}