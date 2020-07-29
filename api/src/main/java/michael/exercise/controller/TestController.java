package michael.exercise.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.List;

@RestController
@RequestMapping(value = "test")
@EnableWebMvc
public class TestController {

    @GetMapping
    public List<String> test() {
        return List.of("foo", "bar" );
    }

}
