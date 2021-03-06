package com.epam.entity;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.*;


@Entity
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "news_id_generator")
    @SequenceGenerator(name = "news_id_generator", sequenceName = "NEWS_ID_SEQ", allocationSize = 1)
    private long id;

    private String title;

    private String brief;

    private String content;

    @Column(name = "LANG")
    private String language;

    @Column(name = "NEWS_DATE")
    private LocalDate newsDate;

    public News() {
    }

    public News(String title, String brief, String content, String language, LocalDate newsDate) {
        this.title = title;
        this.brief = brief;
        this.content = content;
        this.language = language;
        this.newsDate = newsDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public LocalDate getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(LocalDate newsDate) {
        this.newsDate = newsDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        News news = (News) o;
        return id == news.id &&
                Objects.equals(title, news.title) &&
                Objects.equals(brief, news.brief) &&
                Objects.equals(content, news.content) &&
                Objects.equals(language, news.language) &&
                Objects.equals(newsDate, news.newsDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, brief, content, language, newsDate);
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", brief='" + brief + '\'' +
                ", content='" + content + '\'' +
                ", language='" + language + '\'' +
                ", newsDate=" + newsDate +
                '}';
    }
}
