package com.example.flora.service;

import com.example.flora.model.ExampleEntity;
import com.example.flora.repository.ExampleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ExampleService {
    @Autowired
    private ExampleRepository exampleRepository;

    public List<ExampleEntity> findAll() {
        return exampleRepository.findAll();
    }

    public Optional<ExampleEntity> findById(Long id) {
        return exampleRepository.findById(id);
    }

    public ExampleEntity save(ExampleEntity entity) {
        return exampleRepository.save(entity);
    }
}
