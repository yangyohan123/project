package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Comment;
import model.LikeBoard;
import model.Member;

public interface BoardMapper {

   @Select("select ifnull(max(border_num),0) from border")
   int maxnum();

   @Insert("insert into border "
 + " (num,name, pass, subject, content, file1, regdate,"
 + " readcnt, grp,grplevel,grpstep) "
 + " values(#{num},#{name}, #{pass}, #{subject}, "
 + " #{content}, #{file1},now(),0,#{grp},#{grplevel},#{grpstep})")
   int insert(Board board);

   @Select({"<script>",
   "select count(*) from border",
   " <if test='typenum != null'> where typenum = #{typenum} </if>",
   " <if test='thema != null'>and thema = #{thema} </if>",
   " <if test='col1 != null'>and ${col1} like '%${find}%'</if>",
   " <if test='col2 != null'>or ${col2} like '%${find}%'</if>",
   "</script>"})
   Integer boardCount(Map<String, Object> map);
   
   @Select({"<script>",
	   "select count(*) from border",
	   "<if test='typenum != null'> where typenum = #{typenum} </if>",
	   "</script>"})
   int boardCount1(Map<String, Object> map);
   
  
   /*@Select({"<script>",
    "select * from border ",
    " <if test='col1 != null'>where ${col1} like '%${find}%'</if>",
    " <if test='col2 != null'>or ${col2} like '%${find}%'</if>",
    " <choose>",
    " <when test='typenum != null'> where typenum = #{typenum} </when>",
    " <otherwise>"
    + " order by border_num desc limit #{start},#{limit}"
    + "</otherwise>",
     "</choose>",
    "</script>"})
   List<Board> select(Map<String, Object> map);*/
   
   //board lists
   @Select({"<script>",
	    "select * from border b left outer join (select border_num,count(*) cnt from likeboard group by border_num) l",
	    " on b.border_num = l.border_num",
	    " <if test='border_num != null'> where b.border_num = #{border_num} </if>",
	    "</script>"})
   List<Board> select(Map<String, Object> map);
   
   //서브게시판 자세히(추천수포함)
   @Select({"<script>",
	   "select *,l.cnt from border b left outer join (select border_num,count(*) cnt from likeboard group by border_num) l",
	   " on b.border_num = l.border_num",
	   " <if test='typenum != null'> where typenum = #{typenum} </if>",
	   " <if test='col1 != null'>and ${col1} like '%${find}%'</if>",
	   " <if test='col2 != null'>or ${col2} like '%${find}%'</if>",
	   " <choose>",
	   " <when test='thema != null'> and thema = #{thema} order by b.border_num desc limit #{start},#{limit} </when>",
	   " <otherwise>"
			   + " order by b.border_num desc limit #{start},#{limit}"
			   + " </otherwise>",
			   " </choose>",
   		"</script>"})
   List<Board> select3(Map<String, Object> map);
   
   
   
   @Update("update border set views = views + 1 "
         + " where border_num = #{border_num}")
   void readcntadd(int border_num);

   @Update("update  board set grpstep = grpstep + 1"
         + " where grp = #{grp} and grpstep > #{grpstep}")
   void grpStepAdd
      (@Param("grp") int grp,@Param("grpstep") int grpstep);
   
   //member login
   @Select({"<script>",
		"select * from member",
		"<if test='id != null'> where binary id=#{id}</if>",
	   "</script>"})
   List<Member> select1(Map<String,Object> map);

   //board list1
//   @Select({"<script>",
//	    "select * from border a join bordertype "
//	    +" on a.typenum = b.typenum ",
//	     " <choose>",
//	     " ",
//	    "</script>"})
   
   //main 서브게시판 나타냄(공지사항,정보/컬럼,스키장/후기,동영상)
   @Select("SELECT * FROM border a  join bordertype b " + 
   		" ON a.typenum = b.typenum " + 
   		" WHERE a.typenum = #{typenum} " + 
   		" order by border_num desc limit 5")
   List<Board> select2(Map<String, Object> map);
   
   //main 서브게시판 나타냄(갤러리)
   @Select("SELECT * FROM border a  join bordertype b " + 
   		" ON a.typenum = b.typenum " + 
   		" WHERE a.typenum = #{typenum} " + 
   		" order by border_num desc limit 4")
   List<Board> select2_1(Map<String, Object> map);
   
   //추천글 등록
   @Insert("insert into likeboard " +
		   " values(#{login},#{border_num})")
   int recommend(Map<String, Object> map);
   
   //추천글 갯수
   @Select("select count(*) from likeboard group by border_num having border_num = #{border_num}")
   int recommendcount(Map<String, Object> map);

   //게시물글쓰기
   @Insert("insert into border "
   		+ " values(#{b.border_num},#{b.thema},#{b.subject},#{b.content},#{b.file}"
   		+ " ,now(),0,#{b.id},#{b.name},#{b.typenum},#{b.nickname},#{b.profile})")
   int boardwrite(Map<String, Object> map);

   //게시글 수정
   @Update("update border set thema=#{thema}, subject=#{subject},"
      + " content=#{content},file=#{file}, date=now(), id=#{id}, name=#{name},"
      + " nickname=#{nickname},profile=#{profile} where border_num=#{border_num}")
   int update(Board board);

   //게시글 삭제
   @Delete("delete from border where border_num=#{border_num}")
   int delete(int num);
   
   //댓글maxnum
   @Select("select ifnull(max(num),0) from reply ")
   int replyinsert(Map<String, Object> map);

   //댓글쓰기
   @Insert("insert into reply values(#{c.num},#{c.id},#{c.nickname},#{c.content},"
   		+ "#{c.profile},#{c.typenum},#{c.border_num})")
   boolean replywrite(Map<String, Object> map);

   //댓글리스트
   @Select("select * from reply where border_num = #{border_num} order by num")
   List<Comment> replylist(Map<String, Object> map);

   //댓글count
   @Select("select count(*) from reply group by border_num having border_num = #{border_num}")
   int recnt(Map<String, Object> map);

   //댓글삭제
   @Delete("delete from reply where num = #{num} and border_num = #{border_num}")
   int replydel(Map<String, Object> map);

  
   //게시판삭제시 게시판 관련된 댓글들 삭제
   @Delete("delete from reply where border_num=#{border_num}")
   void commentdel(Map<String, Object> map);

   //게시판삭제시 게시판 관련된 추천수들 삭제
   @Delete("delete from likeboard where border_num=#{border_num}")
   void likeboarddel(Map<String, Object> map);

   //회원정보 수정.
   @Update("update member set nickname=#{nickname}, profile=#{profile}, email=#{email}, tel=#{tel}"
   		+ " where id=#{id}")
   int userupdate(Map<String, Object> map);

   //비밀번호 수정
   @Update("update member set pw=#{changepw} where id=#{id}")
   int changepw(Map<String, Object> map);

   //회원탈퇴
   @Delete("delete from member where id = #{id}")
   int userdelete(Map<String, Object> map);

   //회원리스트
   @Select("select * from member")
   List<Member> memberlist();

   //회원탈퇴시 회원 관련된 게시물 삭제
   @Delete("delete from border where id=#{id}")
   void boarddelete(Map<String, Object> map);

   //회원탈퇴시 회원 관련된 게시물 삭제
   @Delete("delete from reply where id=#{id}")
   void replydelete(Map<String, Object> map);

   //회원탈퇴시 회원 관련된 추천수 삭제
   @Delete("delete from likeboard where id=#{id}")
   void commentdelete(Map<String, Object> map);

  


  
   
   
  
}