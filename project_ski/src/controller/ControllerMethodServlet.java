package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.board.BoardAllAction;

//*.do를 실행시 initParame 실행
@WebServlet(urlPatterns= {"*.do"},
initParams = {@WebInitParam(name="properties",
							value="method.properties"
							)})

public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //톰캣이 알아서 객체화 실행
	//map객체의 하위 객체인 Properties
	private Properties pr = new Properties();
    private BoardAllAction action = new BoardAllAction();
    private Class[] paramType = new Class[]
    		{HttpServletRequest.class, HttpServletResponse.class};
    //init : 서블릿이 객체화 된 이후 바로 호둘되는 메서드 이유:static이 없기때문에
    //config 객체  :파라미터 전달.
    //			  properties=method.properties
    @Override
    public void init(ServletConfig config) throws ServletException{
    	//props = method.properties값을 가지고 있는다.
    	String props = config.getInitParameter("properties");
    	FileInputStream f = null;
    	try {
    		//f: WEB-INF/method.properties 파일 읽기 위한 입력 스트림.
    		f = new FileInputStream
(config.getServletContext().getRealPath("/") + "WEB-INF/"+props);
    		//key=/model12/hello.do
    		//value = hello
    		pr.load(f);
    		f.close();
    	}catch(IOException e) {e.printStackTrace();}
    }
    //클라이언트 GET방식 요청 시 호출되는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글인코딩
		//다른곳에서 인코딩할 필요가 없어짐.
		request.setCharacterEncoding("euc-kr");
		Object[] paramObjs = new Object[] {request,response};
		ActionForward forward = null;
		String command = null;
		try {
			//프로젝트를 제외한 요청 url  : /model2/hello.do
			command = request.getRequestURI().substring
					(request.getContextPath().length());
			//methodName : hello
			String methodName = pr.getProperty(command);
			
			//Method : 메서드객체생성
			//BoardAllAction 클래스 중 메서드의 이름이 methodName 이고
			//매개변수가 paramType인 메서드를 객체로 리턴.  
			Method method = BoardAllAction.class.getMethod
					(methodName, paramType);
			
			//invoke : 메서드 호출하는 기능
			//		 action.hello(request,response )호출.
			//       forward 타입맞게 ActionFoward타입변환
			forward = (ActionForward)method.invoke(action, paramObjs);
		}catch(NullPointerException e) {
			forward = new ActionForward();
			e.printStackTrace();
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".do", ".jsp"));
				}
				RequestDispatcher disp =
						request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
			}
		}else response.sendRedirect("nopage.jsp");
		
	}
	//클라이언트 POST방식 요청 시 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
