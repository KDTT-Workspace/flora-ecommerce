package com.example.flora.controller;

import com.example.flora.model.ExampleEntity;
import com.example.flora.service.ExampleService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.Optional;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@WebMvcTest(ExampleController.class)
public class ExampleControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ExampleService exampleService;

    @Test
    public void testGetAllExamples() throws Exception {
        ExampleEntity entity = new ExampleEntity();
        entity.setId(1L);
        entity.setName("Test");

        when(exampleService.findAll()).thenReturn(Arrays.asList(entity));

        mockMvc.perform(get("/api/examples"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].id").value(1L))
                .andExpect(jsonPath("$[0].name").value("Test"));
    }

    @Test
    public void testGetExampleById() throws Exception {
        ExampleEntity entity = new ExampleEntity();
        entity.setId(1L);
        entity.setName("Test");

        when(exampleService.findById(1L)).thenReturn(Optional.of(entity));

        mockMvc.perform(get("/api/examples/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(1L))
                .andExpect(jsonPath("$.name").value("Test"));
    }
}
