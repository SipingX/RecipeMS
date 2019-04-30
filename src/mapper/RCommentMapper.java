package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import pojo.RComment;
import pojo.RCommentExample;

public interface RCommentMapper {
    long countByExample(RCommentExample example);

    int deleteByExample(RCommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RComment record);

    int insertSelective(RComment record);

    List<RComment> selectByExample(RCommentExample example);

    RComment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RComment record, @Param("example") RCommentExample example);

    int updateByExample(@Param("record") RComment record, @Param("example") RCommentExample example);

    int updateByPrimaryKeySelective(RComment record);

    int updateByPrimaryKey(RComment record);
}