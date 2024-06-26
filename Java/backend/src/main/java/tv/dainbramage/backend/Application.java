package tv.dainbramage.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = {"tv.dainbramage.backend.user", "tv.dainbramage.backend.token"})
@EntityScan({"tv.dainbramage.backend.user", "tv.dainbramage.backend.token"})
@ComponentScan(basePackages = "tv.dainbramage.backend")
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
