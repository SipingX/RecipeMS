package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import pojo.RPicture;
import pojo.RPictureExample;
import pojo.RPictureKey;

public interface RPictureMapper {
    long countByExample(RPictureExample example);

    int deleteByExample(RPictureExample example);

    int deleteByPrimaryKey(RPictureKey key);

    int insert(RPicture record);

    int insertSelective(RPicture record);

    List<RPicture> selectByExample(RPictureExample example);

    RPicture selectByPrimaryKey(RPictureKey key);

    int updateByExampleSelective(@Param("record") RPicture record, @Param("example") RPictureExample example);

    int updateByExample(@Param("record") RPicture record, @Param("example") RPictureExample example);

    int updateByPrimaryKeySelective(RPicture record);

    int updateByPrimaryKey(RPicture record);
}