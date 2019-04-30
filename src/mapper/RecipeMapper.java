package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import pojo.Recipe;
import pojo.RecipeExample;

public interface RecipeMapper {
    long countByExample(RecipeExample example);

    int deleteByExample(RecipeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Recipe record);

    int insertSelective(Recipe record);
    
    int selectRecipeMaxId();

    List<Recipe> selectByExample(RecipeExample example);

    Recipe selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Recipe record, @Param("example") RecipeExample example);

    int updateByExample(@Param("record") Recipe record, @Param("example") RecipeExample example);

    int updateByPrimaryKeySelective(Recipe record);

    int updateByPrimaryKey(Recipe record);
}