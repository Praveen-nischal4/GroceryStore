package com.myApp.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.myApp")
public class MyAppConfig {

	@Bean
	public ViewResolver getViewResolver()
	{
		InternalResourceViewResolver views = new InternalResourceViewResolver();
		views.setSuffix(".jsp");
		views.setPrefix("/WEB-INF/myViews/");
		return views;
	}
	
	@Bean
	public PasswordEncoder bcryptEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DataSource getDataSource()
	{
		DriverManagerDataSource dataSource =new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/springdb2");
		dataSource.setUsername("root");
		dataSource.setPassword("955455Praveen");
		return dataSource;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate()
	{
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		return jdbcTemplate;
	}
}
