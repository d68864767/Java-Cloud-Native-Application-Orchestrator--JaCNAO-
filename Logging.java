```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Logging {

    private static final Logger logger = LoggerFactory.getLogger(Logging.class);

    @GetMapping("/log")
    public String log() {
        String message = "Logging endpoint hit!";
        logger.info(message);
        return message;
    }
}
```
