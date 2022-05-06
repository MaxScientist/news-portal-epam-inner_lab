package com.epam.config;

import com.epam.entity.News;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.sql.DataSource;
import java.util.Objects;


@Configuration
@PropertySource("classpath:persistence-oracle.properties")
@ComponentScan(basePackages = "com.epam")
@EnableWebMvc
@EnableAspectJAutoProxy
public class SpringApplicationConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public SessionFactory sessionFactory(){
        return new org.hibernate.cfg.Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(News.class)
                .buildSessionFactory();
    }

    @Autowired
    private Environment environment;

    @Bean
    public DataSource securityDataSource() {
        final DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(Objects.requireNonNull(environment.getProperty("jdbc.driver")));
        dataSource.setUrl(environment.getProperty("jdbc.url"));
        dataSource.setUsername(environment.getProperty("jdbc.user"));
        dataSource.setPassword(environment.getProperty("jdbc.password"));
        return dataSource;
    }


}
