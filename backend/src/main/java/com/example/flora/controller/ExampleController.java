package com.example.flora.controller;

import com.example.flora.model.ExampleEntity;
import com.example.flora.service.ExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/examples")
public class ExampleController {
    @Autowired
    private ExampleService exampleService;

    @GetMapping
    public List<ExampleEntity> getAllExamples() {
        return exampleService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ExampleEntity> getExampleById(@PathVariable Long id) {
        Optional<ExampleEntity> example = exampleService.findById(id);
        return example.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ExampleEntity createExample(@RequestBody ExampleEntity entity) {
        return exampleService.save(entity);
    }
}
