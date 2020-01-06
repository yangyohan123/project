package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;
public class MemberDao {
   private Map<String,Object> map = 
                                new HashMap<String,Object>();
   private Class<MemberMapper> cls = MemberMapper.class;
   public Member selectOne(String id) {
      SqlSession session = DBConnection.getConnection();
      try {
    	map.clear();
    	map.put("id", id);
        Member mem = session.getMapper(cls).selectOne(map);
        System.out.println("mapper mem:" + mem.toString());
        return mem;
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return null;
   }
   //ȸ�����
   public int insert(Member m) {
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).insert(m); 
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return 0; //insert ����
   }
   public List<Member> list(){
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).select(null);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return null;
   }
   public int update(Member m) {
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).update(m);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return 0;
   }
   public int delete(String id) {
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).delete(id);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return 0;
   }   
   public int updatePass(String id, String pass) {
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).updatepass(id,pass);
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(session);
      }
      return 0;
   }
   public String idSearch(String email, String tel) {
         SqlSession session = DBConnection.getConnection();
         try {
            return session.getMapper(cls).idSearch(email,tel);
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            DBConnection.close(session);
         }
         return null;
      }
     public String pwSearch(String id, String email, String tel){
          SqlSession session = DBConnection.getConnection();
         try {
            return session.getMapper(cls).pwSearch(id,email,tel);
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            DBConnection.close(session);
         }
         return null;
      }   
}