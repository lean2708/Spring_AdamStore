package Spring_AdamStore.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;


@EntityScan(basePackages = "Spring_AdamStore.entity.sql")
@EnableJpaRepositories(basePackages = "Spring_AdamStore.repository.sql")

@EnableMongoRepositories(
        basePackages = "Spring_AdamStore.repository.nosql",
        mongoTemplateRef = "mongoTemplate"
)
@Configuration
public class DataSourceConfiguration {

    @Bean
    public MongoTemplate mongoTemplate(MongoDatabaseFactory factory, MappingMongoConverter converter) {
        return new MongoTemplate(factory, converter);
    }

}
