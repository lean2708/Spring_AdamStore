package Spring_AdamStore.mapper;

import Spring_AdamStore.dto.basic.EntityBasic;
import Spring_AdamStore.dto.request.CategoryRequest;
import Spring_AdamStore.dto.response.CategoryResponse;
import Spring_AdamStore.entity.sql.Category;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS)
public interface CategoryMapper {

    Category toCategory(CategoryRequest request);

    CategoryResponse toCategoryResponse(Category category);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    void update(@MappingTarget Category category, CategoryRequest request);

    List<CategoryResponse> toCategoryResponseList(List<Category> categories);

    EntityBasic toEntityBasic(Category category);

}
