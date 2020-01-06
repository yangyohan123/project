package action.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.LikeBoard;
import model.Member;
import model.MemberDao;

public class BoardAllAction {
	// login
	// �α��� ���� Ŭ����
	public boolean userlogincheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		String id = request.getParameter("id");
		System.out.println(id);
		System.out.println(login);
		if (login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "../login/loginForm.do");
			return false;
		} else {
			if (!login.equals(id) && id != null && !login.equals("admin")) {
				request.setAttribute("msg", "���θ� �����մϴ�.");
				request.setAttribute("url", "../member/main.do");
				return false;
			}

		}

		return true;

	}

	private BoardDao dao = new BoardDao();
	private MemberDao dao1 = new MemberDao();

	// �α���
	public ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "�ش� id�� �������� �ʽ��ϴ�.";
		String url = "../login/loginForm.do";
		Member mem = dao1.selectOne(id);
		if (mem != null) {
			if (pass.equals(mem.getPw())) {
				// session�� jsp���� ���̱�빮�� java���� request���� �޾ƾ��Ѵ�.
				request.getSession().setAttribute("login", id);

				msg = mem.getName() + "���� �α��� �ϼ̽��ϴ�.";
				url = "../member/main.do";
			} else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}

	// ȸ������
	public ActionForward join(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPw(request.getParameter("pass1"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setNickname(request.getParameter("nickname"));
		mem.setProfile(request.getParameter("picture"));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));

		MemberDao dao = new MemberDao();
		String msg = "ȸ������ ����";
		String url = "../login/joinForm.do";
		if (dao1.insert(mem) > 0) {
			msg = "ȸ������ ����";
			url = "../login/loginForm.do";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");

	}

	// �α׾ƿ�
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userlogincheck(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			request.getSession().invalidate();
			request.setAttribute("msg", login + "���� �α׾ƿ� �Ͽ����ϴ�.");
			request.setAttribute("url", "../login/loginForm.do");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	// ����Խ���(main.do)
	public ActionForward list2(HttpServletRequest request, HttpServletResponse response)
			throws NumberFormatException, Exception {

		int typenum = Integer.parseInt(request.getParameter("typenum"));
		String thema = request.getParameter("thema");
		if (thema == null || thema.equals("home"))
			thema = null;

		int limit = 10;
		if (typenum == 5)
			limit = 12;
		int pageNum = 1;

		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column != null && column.trim().contentEquals("")) {
			column = null;

		}
		if (find != null && find.trim().equals("")) {
			find = null;
		}
		if (column == null || find == null) {
			column = null;
			find = null;
		}

		int boardcnt = dao.boardCount(column, find, typenum, thema);
		List<Board> list = dao.list2(pageNum, limit, column, find, typenum, thema);
		System.out.println(list);

		int maxpage = (int) ((double) boardcnt / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcnt - (pageNum - 1) * limit;

		request.setAttribute("boardcnt", boardcnt);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("typenum", typenum);

		return new ActionForward();
	}

	// ���� ����Ʈ
	public ActionForward list1(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");

		Member mem = dao1.selectOne(login);
		request.getSession().setAttribute("mem", mem);

		int boardcnt1 = dao.boardCount(1);
		int boardcnt2 = dao.boardCount(2);
		int boardcnt3 = dao.boardCount(3);
		int boardcnt4 = dao.boardCount(4);
		int boardcnt5 = dao.boardCount(5);

		List<Board> list1 = dao.list1(1);
		List<Board> list2 = dao.list1(2);
		List<Board> list3 = dao.list1(3);
		List<Board> list4 = dao.list1(4);
		List<Board> list5 = dao.list1_1(5);

		System.out.println(list5);
		request.setAttribute("boardcnt1", boardcnt1);
		request.setAttribute("boardcnt2", boardcnt2);
		request.setAttribute("boardcnt3", boardcnt3);
		request.setAttribute("boardcnt4", boardcnt4);
		request.setAttribute("boardcnt5", boardcnt5);

		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);

		return new ActionForward();
	}

	// ��������-��
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int border_num = Integer.parseInt(request.getParameter("border_num"));

		Board b = dao.selectOne(border_num);
		// ��۸���Ʈ
		List<Comment> list = dao.replyselectall(border_num);
		// �Խù����count
		int recnt = dao.recnt(border_num);
		System.out.println(list);
		// request.getRequestURI : /jspstudy2/model2/info.do
		if (request.getRequestURI().contains("info.do")) {
			dao.readcntadd(border_num);
		}
		request.setAttribute("recnt", recnt);
		request.setAttribute("list", list);
		request.setAttribute("b", b);

		return new ActionForward();
	}

	// �̹������
	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "model2/login/picture";
		String fname = null;
		try {
			File f = new File(path);
			if (!f.exists()) {
				f.mkdirs();
			}

			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture");
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

	// ��õ���
	public ActionForward recommend(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		int border_num = Integer.parseInt(request.getParameter("border_num"));

		if (userlogincheck(request, response)) {
			if (request.getRequestURI().contains("recommend.do")) {
				int i = dao.recommend(border_num, login);
				if (i > 0) {
					request.setAttribute("msg", "�� �Խù��� ��õ�Ͽ����ϴ�.");
					request.setAttribute("url", "info.do?border_num=" + border_num);
				} else {
					request.setAttribute("msg", "�̹� �� �Խù��� ��õ�Ͽ����ϴ�.");
					request.setAttribute("url", "info.do?border_num=" + border_num);
				}
			}
			return new ActionForward(false, "../alert.jsp");
		}

		return new ActionForward(false, "../alert.jsp");

	}

	// �۾����ۼ�
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userlogincheck(request, response)) {
			String path = request.getServletContext().getRealPath("/") + "model2/login/picture";

			try {
				File f = new File(path);
				if (!f.exists()) {
					f.mkdirs();
				}
				MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
				Board b = new Board();
				int typenum = Integer.parseInt(multi.getParameter("typenum"));
				int border_num = dao.maxnum();
				b.setBorder_num(++border_num);
				b.setThema(multi.getParameter("thema"));
				b.setSubject(multi.getParameter("subject"));
				b.setContent(multi.getParameter("content"));
				b.setFile(multi.getFilesystemName("file"));
				b.setId(multi.getParameter("id"));
				b.setName(multi.getParameter("name"));
				b.setTypenum(Integer.parseInt(multi.getParameter("typenum")));
				b.setNickname(multi.getParameter("nickname"));
				b.setProfile(multi.getParameter("profile"));
				System.out.println(b.toString());

				if (request.getRequestURI().contains("write.do")) {
					int i = dao.write(b);
					if (i > 0) {
						request.setAttribute("msg", "�Խù� ��� ����");
						request.setAttribute("url", "list.do?typenum=" + typenum);
					} else {
						request.setAttribute("msg", "�Խù� ��� ����");
						request.setAttribute("url", "writeForm.do?typenum=" + typenum);
					}
				}

				return new ActionForward(false, "../alert.jsp");

			} catch (IOException e) {
				throw new ServletException();
			}

		}
		return new ActionForward(false, "../alert.jsp");

	}

	// �Խù�����
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int border_num = Integer.parseInt(request.getParameter("border_num"));
		Board dbb = dao.selectOne(border_num);
		int typenum = Integer.parseInt(request.getParameter("typenum"));
		if (dao.delete(border_num)) {
			// �Խ��ǿ� ��ϵ� ��۵� ����
			dao.commentdel(border_num);
			// �Խ��ǿ� ��ϵ� ��õ���� ����
			dao.likeboarddel(border_num);
			request.setAttribute("msg", "�Խù��� �����Ͽ����ϴ�.");
			request.setAttribute("url", "list.do?typenum=" + typenum);
		} else {
			request.setAttribute("msg", "�Խù��� �������� ���߽��ϴ�.");
			request.setAttribute("url", "info.do?border_num=" + border_num);
		}

		return new ActionForward(false, "../alert.jsp");
	}

	// �Խù�����
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "model2/login/picture";

		File f = new File(path);
		if (f.exists())
			f.mkdir();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		Board b = new Board();
		int border_num = Integer.parseInt(multi.getParameter("border_num"));
		b.setBorder_num(Integer.parseInt(multi.getParameter("border_num")));
		b.setThema(multi.getParameter("thema"));
		b.setSubject(multi.getParameter("subject"));
		b.setContent(multi.getParameter("content"));
		b.setFile(multi.getFilesystemName("file"));
		if (b.getFile() == null || b.getFile().equals("")) {
			b.setFile(multi.getParameter("file2"));
		}
		b.setId(multi.getParameter("id"));
		b.setName(multi.getParameter("name"));
		b.setNickname(multi.getParameter("nickname"));
		b.setProfile(multi.getParameter("profile"));
		System.out.println("\n\n\n\n\n\n\n===================================");
		if (dao.update(b)) {
			request.setAttribute("msg", "�Խñ� �����Ϸ�");
			request.setAttribute("url", "info.do?border_num=" + border_num);
			request.setAttribute("b", b);
		} else {
			request.setAttribute("msg", "�Խñ� ��������");
			request.setAttribute("url", "updateForm.do?border_num=" + border_num);
		}
		return new ActionForward(false, "../alert.jsp");
	}

	// ��۾���
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userlogincheck(request, response)) {
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			String content = request.getParameter("content");
			String profile = request.getParameter("profile1");
			int typenum = Integer.parseInt(request.getParameter("typenum"));
			int border_num = Integer.parseInt(request.getParameter("border_num"));

			Comment c = new Comment();
			int cnt = dao.maxnum(border_num);
			c.setNum(++cnt);
			c.setId(id);
			c.setNickname(nickname);
			c.setContent(content);
			c.setProfile(profile);
			c.setTypenum(typenum);
			c.setBorder_num(border_num);

			System.out.println(c.toString());
			System.out.println("=====================]");
			System.out.println(border_num);
			if (dao.insert(c)) {
				request.setAttribute("msg", null);
				request.setAttribute("url", "info.do?border_num=" + border_num);
				return new ActionForward(false, "../alert.jsp");
			} else {
				request.setAttribute("msg", "��۵�Ͻ���");
				request.setAttribute("url", "info.do?border_num=" + border_num);
				return new ActionForward(false, "../alert.jsp");
			}
		}

		return new ActionForward(false, "../alert.jsp");

	}

	// ��ۻ���
	public ActionForward replydel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userlogincheck(request, response)) {
			int num = Integer.parseInt(request.getParameter("num"));
			int border_num = Integer.parseInt(request.getParameter("border_num"));

			if (dao.replydel(num, border_num)) {
				request.setAttribute("msg", "��ۻ�������");
				request.setAttribute("url", "info.do?border_num=" + border_num);
				return new ActionForward(false, "../alert.jsp");
			} else {
				request.setAttribute("msg", "��ۻ�������");
				request.setAttribute("url", "info.do?border_num=" + border_num);
				return new ActionForward(false, "../alert.jsp");
			}
		}

		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward userinfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		if (userlogincheck(request, response)) {
			Member m = dao.selectOne1(id);
			request.setAttribute("m", m);
			return new ActionForward();
		}

		return new ActionForward(false, "../alert.jsp");
	}

	// ȸ����������
	public ActionForward userupdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String picture = request.getParameter("picture");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String login = (String) request.getSession().getAttribute("login");
		if (userlogincheck(request, response)) {
			/*
			 * if(login.equals("admin")) { if(dao.userupdate(id, nickname, picture, email,
			 * tel)) { request.setAttribute("msg", "���������Ϸ�"); request.setAttribute("url",
			 * "updateform.do?id="+id); }else { request.setAttribute("msg", "������������");
			 * request.setAttribute("url", "updateform.do?id="+id); } }else {
			 */
			if (dao.userupdate(id, nickname, picture, email, tel)) {
				request.setAttribute("msg", "���������Ϸ�");
				request.setAttribute("url", "updateForm.do?id=" + id);
			} else {
				request.setAttribute("msg", "������������");
				request.setAttribute("url", "updateForm.do?id=" + id);
			}
		}

		return new ActionForward(false, "../alert.jsp");
	}

	// ��й�ȣ ����
	public ActionForward changepw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if (userlogincheck(request, response) || login.equals("admin")) {
			String id = request.getParameter("id");
			String pw1 = request.getParameter("pw1");
			String changepw = request.getParameter("pw2");
			System.out.println(id);
			System.out.println(pw1);
			System.out.println(changepw);
			boolean closer = false;
			boolean opener = false;
			Member dbm = dao.selectOne1(id);
			if (!pw1.equals(dbm.getPw())) {
				request.setAttribute("closer", closer);
				request.setAttribute("opener", opener);
				request.setAttribute("msg", "��й�ȣ ���� ����");
				request.setAttribute("url", "chpwForm.do");
			} else {
				closer = true;
				if (dao.updatePw(id, changepw)) {
					opener = true;
					request.setAttribute("closer", closer);
					request.setAttribute("opener", opener);
					request.setAttribute("msg", "��й�ȣ ���� �Ϸ�");
					request.setAttribute("url", "updateForm.do?id=" + id);
				} else {
					request.setAttribute("closer", closer);
					request.setAttribute("opener", opener);
					request.setAttribute("msg", "��й�ȣ ���� ����");
					request.setAttribute("url", "chpwForm.do");
				}
			}
		}

		return new ActionForward();
	}

	// ȸ��Ż��
	public ActionForward memberdelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (userlogincheck(request, response)) {
			String id = request.getParameter("id");
			String login = (String) request.getSession().getAttribute("login");
			String pw = request.getParameter("pw");
			boolean closer = false;
			boolean opener = false;
			Member dbinfo = dao.selectOne1(id);
			if (id.equals("amdin") || login.equals("admin")) {

				if (dao.userdelete(id)) {
					dao.boarddelete(id);
					dao.replydelete(id);
					dao.commentdelete(id);
					request.setAttribute("msg", id + "����Ż�𼺰�");
					request.setAttribute("url", "../member/list.do?id=" + login);
					return new ActionForward(false, "../alert.jsp");
				} else {
					request.setAttribute("msg", id + "����Ż�����");
					request.setAttribute("url", "../member/list.do?id=" + login);
					return new ActionForward(false, "../alert.jsp");
				}
			} else {
				if (!pw.equals(dbinfo.getPw())) {
					request.setAttribute("msg", "��й�ȣ�� �ٸ��ϴ�");
					request.setAttribute("url", "deleteForm.do?id=" + id);
				} else {
					closer = true;
					if (dao.userdelete(id)) {
						opener = true;
						dao.boarddelete(id);
						dao.replydelete(id);
						dao.commentdelete(id);
						request.setAttribute("closer", closer);
						request.setAttribute("opener", opener);
						request.setAttribute("msg", "ȸ��Ż�𼺰�");
						request.setAttribute("url", "../member/main.do");
						request.getSession().invalidate();
					} else {
						request.setAttribute("closer", closer);
						request.setAttribute("opener", opener);
						request.setAttribute("msg", "ȸ��Ż�����");
						request.setAttribute("url", "deleteForm.do?id=" + id);
					}
				}
			}
		}
		return new ActionForward();
	}

	// ȸ������Ʈ
	public ActionForward memberlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userlogincheck(request, response)) {
			String login = (String) request.getSession().getAttribute("login");
			String id = request.getParameter("id");
			System.out.println(login);
			System.out.println(id);
			if (id.equals("amdin") || login.equals("admin")) {
				List<Member> list = dao.memberlist();
				request.setAttribute("list", list);
				return new ActionForward();
			} else {
				request.setAttribute("msg", "������ ������ �ʿ��մϴ�.");
				request.setAttribute("url", "main.do");
			}

		}
		return new ActionForward(false, "../alert.jsp");
	}

	// ��й�ȣ����
	public ActionForward changePw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		System.out.println(login);
		if (login.equals("admin")) {
			String id = request.getParameter("id");
			String pw1 = request.getParameter("pw1");
			String changepw = request.getParameter("pw2");
			System.out.println(pw1);
			System.out.println(changepw);
			boolean closer = false;
			boolean opener = false;
			Member dbm = dao.selectOne1(id);
			if (!pw1.equals(dbm.getPw())) {
				request.setAttribute("closer", closer);
				request.setAttribute("opener", opener);
				request.setAttribute("msg", "��й�ȣ ���� ����");
				request.setAttribute("url", "chpwform.do");
			} else {
				closer = true;
				if (dao.updatePw(id, changepw)) {
					opener = true;
					request.setAttribute("closer", closer);
					request.setAttribute("opener", opener);
					request.setAttribute("msg", "��й�ȣ ���� �Ϸ�");
					request.setAttribute("url", "updateform.do?id=" + id);
				} else {
					request.setAttribute("closer", closer);
					request.setAttribute("opener", opener);
					request.setAttribute("msg", "��й�ȣ ���� ����");
					request.setAttribute("url", "chpwform.do");
				}
			}
		}

		return new ActionForward();
	}

	// ���̵�ã��
	public ActionForward idserch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");

		MemberDao dao = new MemberDao();
		String id = dao.idSearch(email, tel);
		if (id == null) {
			String msg = "������ �´� id�� ã�� �� �����ϴ�.";
			String url = "idForm.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		} else {
			id = id.substring(0, id.length() - 2) + "**";
			request.setAttribute("id", id);

			return new ActionForward();
		}

	}

	// ��й�ȣã��
	public ActionForward pwserch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String pw = dao.pwSearch(id, email, tel);
		if (pw == null) {
			String msg = "������ �´� pw�� ã�� �� �����ϴ�.";
			String url = "pwForm.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		} else {
			pw = "**" + pw.substring(2, pw.length());
			request.setAttribute("pass", pw);
			return new ActionForward();
		}

	}

	// ckeditor �̹��� ���ε�
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("/") + "model2/board/imgfile/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		// upload��� �̸����� ������ �������� - �������� �Ķ���� �̸�
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.do");

	}

	public ActionForward checkid(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Member m = dao.selectOne1(id);
		boolean check = true;
		if (m == null || m.getId().trim() == "") {
			check = false;
		}
		if (check) {
			request.setAttribute("msg", "�ߺ��� ���̵� �Դϴ�.");
			request.setAttribute("url", "joinForm.do");
		} else {
			request.setAttribute("msg", "��� ������ ���̵��Դϴ�.");
			request.setAttribute("url", "joinForm.do");
		}

		return new ActionForward();
	}
}
