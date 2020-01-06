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

//*.do�� ����� initParame ����
@WebServlet(urlPatterns= {"*.do"},
initParams = {@WebInitParam(name="properties",
							value="method.properties"
							)})

public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //��Ĺ�� �˾Ƽ� ��üȭ ����
	//map��ü�� ���� ��ü�� Properties
	private Properties pr = new Properties();
    private BoardAllAction action = new BoardAllAction();
    private Class[] paramType = new Class[]
    		{HttpServletRequest.class, HttpServletResponse.class};
    //init : ������ ��üȭ �� ���� �ٷ� ȣ�ѵǴ� �޼��� ����:static�� ���⶧����
    //config ��ü  :�Ķ���� ����.
    //			  properties=method.properties
    @Override
    public void init(ServletConfig config) throws ServletException{
    	//props = method.properties���� ������ �ִ´�.
    	String props = config.getInitParameter("properties");
    	FileInputStream f = null;
    	try {
    		//f: WEB-INF/method.properties ���� �б� ���� �Է� ��Ʈ��.
    		f = new FileInputStream
(config.getServletContext().getRealPath("/") + "WEB-INF/"+props);
    		//key=/model12/hello.do
    		//value = hello
    		pr.load(f);
    		f.close();
    	}catch(IOException e) {e.printStackTrace();}
    }
    //Ŭ���̾�Ʈ GET��� ��û �� ȣ��Ǵ� �޼���
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ����ڵ�
		//�ٸ������� ���ڵ��� �ʿ䰡 ������.
		request.setCharacterEncoding("euc-kr");
		Object[] paramObjs = new Object[] {request,response};
		ActionForward forward = null;
		String command = null;
		try {
			//������Ʈ�� ������ ��û url  : /model2/hello.do
			command = request.getRequestURI().substring
					(request.getContextPath().length());
			//methodName : hello
			String methodName = pr.getProperty(command);
			
			//Method : �޼��尴ü����
			//BoardAllAction Ŭ���� �� �޼����� �̸��� methodName �̰�
			//�Ű������� paramType�� �޼��带 ��ü�� ����.  
			Method method = BoardAllAction.class.getMethod
					(methodName, paramType);
			
			//invoke : �޼��� ȣ���ϴ� ���
			//		 action.hello(request,response )ȣ��.
			//       forward Ÿ�Ը°� ActionFowardŸ�Ժ�ȯ
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
	//Ŭ���̾�Ʈ POST��� ��û �� ȣ��Ǵ� �޼���
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
