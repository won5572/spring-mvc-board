package com.kutar.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.slf4j.Slf4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Slf4j
public class BoardControllerTest {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void getList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list").param("pageNum", "4")).andReturn().getModelAndView().getModelMap().toString());
	}

	@Test
	public void register() throws Exception {
		log.info(mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register").param("title", "단위테스트 제목")
						.param("content", "단위테스트 내용").param("writer", "테스터"))
				.andReturn().getModelAndView().getViewName());
	}

	@Test
	public void get() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "3")).andReturn()
				.getModelAndView().getModelMap().toString());
	}

	@Test
	public void modify() throws Exception {
		log.info(mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "1").param("title", "단위테스트 제목")
						.param("content", "단위테스트 내용").param("writer", "테스터"))
				.andReturn().getModelAndView().getViewName());
	}

	@Test
	public void remove() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "1555")).andReturn()
				.getModelAndView().getModelMap().toString());
	}

}
