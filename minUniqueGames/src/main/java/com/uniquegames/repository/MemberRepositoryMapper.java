package com.uniquegames.repository;

import com.uniquegames.vo.MemberVo;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepositoryMapper {

   //@Insert("insert into member(email, name, password) values(#{email}, #{name}, #{password})")
   //@Options(useGeneratedKeys = true, keyProperty = "id")
   void save(MemberVo member);

   //@Select("select * from member where id = #{findId}")
//   MemberVo findById(Long findId);
//
   @Select("select * from member where member_id = #{member_id}")
   MemberVo findById(String member_id);

   @Select("select * from member")
   List<MemberVo> findAll();

   //@Select("select * from member where email = #{email} and name = #{name}")
   //XmlMapper로 구현
//   Optional<MemberVo> findByEmailAndName(String email, String name);

   @Select("update member set name=#{name}, password=#{oldPassword} where email=#{email}")
   Integer update(MemberVo member);

}
