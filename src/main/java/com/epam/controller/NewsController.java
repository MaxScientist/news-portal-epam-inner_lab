package com.epam.controller;

import com.epam.dto.NewsDTO;
import com.epam.exception.BusinessException;
import com.epam.service.NewsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.PersistenceException;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.util.MimeTypeUtils.APPLICATION_JSON_VALUE;

@CrossOrigin(origins = "http://localhost:3000", allowedHeaders = "*")
@RequestMapping("/api")
@RestController
public class NewsController {

    private final NewsService newsService;

    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    @GetMapping("/news")
    public ResponseEntity<List<NewsDTO>> getAllNews(@RequestParam(required = false) String lang) {
        ResponseEntity<List<NewsDTO>> response;

        if (lang != null) {
            response = ResponseEntity.ok(newsService.getAllNewsByLanguage(lang));
        } else {
            response = ResponseEntity.ok(newsService.getAllNews());
        }
        return response;
    }

    @GetMapping("/news/{id}")
    public ResponseEntity<NewsDTO> getNewsById(@PathVariable("id") Long id) throws BusinessException {
        try {
            return ResponseEntity.ok(newsService.getNewsById(id));
        } catch (PersistenceException exception) {
            throw new BusinessException("News with that id not found");
        }
    }

    @PostMapping(path = "/news", consumes = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> saveOrUpdateNews(@RequestBody NewsDTO newsDTO) throws BusinessException {
        try {
            newsService.saveOrUpdateNews(newsDTO);
            return ResponseEntity.ok(newsDTO.getTitle() + " " + newsDTO.getBrief());
        }catch (PersistenceException exception) {
            throw new BusinessException("Failed to create news");
        }
    }

    @DeleteMapping("/news/{id}")
    public ResponseEntity<String> deleteNewsById(@PathVariable("id") Long id) throws BusinessException {
        try {
            newsService.deleteNews(id);
        } catch (PersistenceException e){
            throw new BusinessException("new with that id not found");
        }
        return ResponseEntity.ok("News with id "+ id + " deleted.");
    }

    @PutMapping(path = "/news", consumes = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> deleteNewsList(@RequestBody List<String> body) throws BusinessException {
        List<Long> idList = new ArrayList<>();
        for (String stringId: body) {
            try {
                idList.add(Long.valueOf(stringId));
            }catch (NumberFormatException exception) {
                throw new BusinessException("Id is not valid");
            }
        }

        try {
            newsService.deleteNews(idList);
        } catch (PersistenceException e){
            throw new BusinessException("News with that id not found");
        }
        return ResponseEntity.ok("News with ids " + idList + " deleted.");
    }
}
