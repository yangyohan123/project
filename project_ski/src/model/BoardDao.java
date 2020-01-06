package model;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;

import model.mapper.BoardMapper;

public class BoardDao {
   private Map<String,Object> map= new HashMap<String,Object>();
    private Class<BoardMapper> cls = BoardMapper.class;
    //게시물max
    public int maxnum() {
      SqlSession session = DBConnection.getConnection();
      try {
         return session.getMapper(cls).maxnum();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return 0;
   }
    
    //댓글max
    public int maxnum(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("border_num", border_num);
			return session.getMapper(cls).replyinsert(map);
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
   //게시물 등록
   public boolean insert(Board board) {
      SqlSession session = DBConnection.getConnection();
      try {
         int cnt = session.getMapper(cls).insert(board);
         if (cnt > 0) return true;
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return false;
   }
   public int boardCount(String column, String find, int typenum, String thema) {
      SqlSession session = DBConnection.getConnection();
      try {
         map.clear();
         map.put("typenum", typenum);
         if(thema != null) {
        	 map.put("thema", thema);
         }
         if(column != null) {
            String[] col = column.split(",");
             map.put("col1",col[0]);
             if(col.length == 2) {
                map.put("col2",col[1]);
             }
             map.put("find",find);
         }
         return session.getMapper(cls).boardCount(map);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return 0;
   }
   //info 게시글 자세히
   public List<Board> list
         (int pageNum,int limit,String column, String find,int typenum, String thema) {
      SqlSession session = DBConnection.getConnection();
      try {
         map.clear();
         map.put("start", (pageNum -1) * limit);
         map.put("limit",limit);
         map.put("typenum", typenum);
         if(thema != null) {
        	 map.put("thema", thema);
         }
         if(column != null) {
            String[] col = column.split(",");
             map.put("col1",col[0]);
             if(col.length == 2) {
                map.put("col2",col[1]);
             }
             map.put("find",find);
         }
         return session.getMapper(cls).select(map);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return null;      
   }
   //서브게시판 간단하게 나타내기(공지사항,정보/컬럼,스키장/후기,동영상)
   public List<Board> list1(int typenum) {
	   SqlSession session = DBConnection.getConnection();
	    try {
	         map.clear();
	         map.put("typenum", typenum);
	         return session.getMapper(cls).select2(map);
	    }catch (Exception e) {
	         e.printStackTrace();
	    } finally {
	       DBConnection.close(session);
	    }
		return null;
	}
   
   //서브게시판 간단하게 나타내기(갤러리)
   public List<Board> list1_1(int typenum) {
		 SqlSession session = DBConnection.getConnection();
		    try {
		         map.clear();
		         map.put("typenum", typenum);
		         return session.getMapper(cls).select2_1(map);
		    }catch (Exception e) {
		         e.printStackTrace();
		    } finally {
		       DBConnection.close(session);
		    }
			return null;
	}
   
   //게시판 자세히(추천수포함)
   public List<Board> list2(int pageNum, int limit, String column, String find, int typenum, String thema) {
	   SqlSession session = DBConnection.getConnection();
	   try {
	         map.clear();
	         map.put("start", (pageNum -1) * limit);
	         map.put("limit",limit);
	         map.put("typenum", typenum);
	         if(thema != null) {
	        	 map.put("thema", thema);
	         }
	         if(column != null) {
	            String[] col = column.split(",");
	             map.put("col1",col[0]);
	             if(col.length == 2) {
	                map.put("col2",col[1]);
	             }
	             map.put("find",find);
	         }
	         return session.getMapper(cls).select3(map);
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	          DBConnection.close(session);
	      }
	      return null;
		
	}
   public Board selectOne(int border_num) {
      SqlSession session = DBConnection.getConnection();
      try {
         map.clear();
         map.put("border_num", border_num);
         return session.getMapper(cls).select(map).get(0);
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return null;
   }
   //조회수 증가
   public void readcntadd(int border_num) {
      SqlSession session = DBConnection.getConnection();
      try {
         session.getMapper(cls).readcntadd(border_num);
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
   }
   //답글의 순서 지정
   public void grpStepAdd(int grp,int grpstep) {
      SqlSession session = DBConnection.getConnection();
      try {
         session.getMapper(cls).grpStepAdd(grp,grpstep);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
   }
   //게시글 수정
   public boolean update(Board board) {
      SqlSession session = DBConnection.getConnection();
      try {
         int cnt = session.getMapper(cls).update(board);
         if (cnt > 0) return true;
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return false;
   }
   //게시글 삭제
   public boolean delete(int border_num) {
      SqlSession session = DBConnection.getConnection();
      try {
         int cnt = session.getMapper(cls).delete(border_num);
         if (cnt > 0) return true;
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
          DBConnection.close(session);
      }
      return false;
   }
  
   //회원
	public Member selectOne1(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			 map.clear();
			 map.put("id", id);
		     List<Member> list = session.getMapper(cls).select1(map);
		     return list.get(0);
		    
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return null;
	}
	
	//각 게시판 게시물전체갯수
	public int boardCount(int typenum) {
		SqlSession session = DBConnection.getConnection();
	    try {
	       map.clear();
	       map.put("typenum", typenum);
	       return session.getMapper(cls).boardCount1(map);
	    } catch (Exception e) {
	       e.printStackTrace();
	    } finally {
	        DBConnection.close(session);
	    }
		return 0;
	}
	
	//글 추천기능
	public int recommend(int border_num, String login) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("login",login);
			map.put("border_num", border_num);
			return session.getMapper(cls).recommend(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
		
		
	}
	
	//글 추천 갯수
	public int recommedcount(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("border_num", border_num);
			return session.getMapper(cls).recommendcount(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	// 글쓰기 기능
	public int write(Board b) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("b", b);
			return session.getMapper(cls).boardwrite(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

	//댓글쓰기
	public boolean insert(Comment c) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("c", c);
			return session.getMapper(cls).replywrite(map);
			
		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			DBConnection.close(session);
		}
		
		
		return false;
	}

	//댓글리스트
	public List<Comment> replyselectall(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("border_num", border_num);
			return session.getMapper(cls).replylist(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	//댓글갯수
	public int recnt(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("border_num", border_num);
			return session.getMapper(cls).recnt(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return 0;
	}

	//댓글삭제
	public boolean replydel(int num, int border_num) {
		SqlSession session = DBConnection.getConnection();
		try{
			map.clear();
			map.put("num", num);
			map.put("border_num",border_num);
			int i = session.getMapper(cls).replydel(map);
			if( i > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	//게시판 삭제시 게시판 관련된 댓글들 삭제
	public void commentdel(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try{
			map.clear();
			map.put("border_num",border_num);
			session.getMapper(cls).commentdel(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	//게시판 삭제시 게시판 관련된 추천수 삭제
	public void likeboarddel(int border_num) {
		SqlSession session = DBConnection.getConnection();
		try{
			map.clear();
			map.put("border_num",border_num);
			session.getMapper(cls).likeboarddel(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}
	
	//회원정보수정
	public boolean userupdate(String id, String nickname, String profile, String email, String tel) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("nickname", nickname);
			map.put("profile", profile);
			map.put("email", email);
			map.put("tel", tel);
			int i = session.getMapper(cls).userupdate(map);
			if(i > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return false;
	}

	//비밀번호변경
	public boolean updatePw(String id, String changepw) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			map.put("changepw", changepw);
			int i = session.getMapper(cls).changepw(map);
			if(i > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return false;
	}

	//회원탈퇴
	public boolean userdelete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			int i = session.getMapper(cls).userdelete(map);
			if(i > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return false;
	}
	
	//회원리스트
	public List<Member> memberlist() {
		SqlSession session = DBConnection.getConnection();
		try {
			return	session.getMapper(cls).memberlist();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		return null;
	}
	
	//회원탈퇴시 회원관련된 게시물 삭제
	public void boarddelete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			session.getMapper(cls).boarddelete(map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
		
	}

	//회원탈퇴시 회원관련된 댓글 삭제
	public void replydelete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			session.getMapper(cls).replydelete(map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}
	
	//회원탈퇴시 회원관련된 추천수 삭제
	public void commentdelete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			session.getMapper(cls).commentdelete(map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		
	}

	




}