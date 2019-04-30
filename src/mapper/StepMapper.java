package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import pojo.Step;
import pojo.StepExample;
import pojo.StepKey;

public interface StepMapper {
    long countByExample(StepExample example);

    int deleteByExample(StepExample example);

    int deleteByPrimaryKey(StepKey key);

    int insert(Step record);

    int insertSelective(Step record);

    List<Step> selectByExample(StepExample example);

    Step selectByPrimaryKey(StepKey key);

    int updateByExampleSelective(@Param("record") Step record, @Param("example") StepExample example);

    int updateByExample(@Param("record") Step record, @Param("example") StepExample example);

    int updateByPrimaryKeySelective(Step record);

    int updateByPrimaryKey(Step record);
}