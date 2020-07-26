package michael.exercise.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "test")
public class TestController {

    @GetMapping
    public List<String> test() {
        return List.of("foo", "bar" );
    }

}
