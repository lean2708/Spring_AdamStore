package Spring_AdamStore.repository.criteria;

import Spring_AdamStore.entity.Product;
import Spring_AdamStore.entity.ProductVariant;
import jakarta.persistence.criteria.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.function.Consumer;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
@NoArgsConstructor
public class JobSearchCriteriaQueryConsumer implements Consumer<SearchCriteria> {
    CriteriaBuilder builder;
    Predicate predicate;
    Root root;

    @Override
    public void accept(SearchCriteria param) {
        if(param.getOperation().equals(">")){
            predicate = builder.and(predicate, builder.greaterThanOrEqualTo(root.get(param.getKey()), param.getValue().toString()));
        }else if(param.getOperation().equals("<")){
            predicate = builder.and(predicate, builder.lessThanOrEqualTo(root.get(param.getKey()), param.getValue().toString()));
        }else{
            if(root.get(param.getKey()).getJavaType().equals(String.class)){
                predicate = builder.and(predicate, builder.like(root.get(param.getKey()),"%" + param.getValue().toString() + "%"));
            }else{
                predicate = builder.and(predicate, builder.equal(root.get(param.getKey()), param.getValue().toString()));
            }
        }

    }
}
