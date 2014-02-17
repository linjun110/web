package com.linjun.testProj.testComponent;

import com.linjun.testProj.testComponent.bo.*;
import com.linjun.testProj.testComponent.dao.IDao;
import com.linjun.testProj.testComponent.dao.MysqlDao;
import com.linjun.testProj.testComponent.exception.BusinessException;
import com.linjun.testSpring.testComponent.SpringMain;

import java.io.IOException;
import java.io.PrintWriter;

/*sql*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
/*end of sql*/

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




/*servlet*/
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*end of servlet*/




/*json*/
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
/*end of json*/


/**
 * Servlet implementation class TestServlet
 */
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IDao dao = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
        dao = MysqlDao.getInstance();
        System.out.println("Construction");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(dao == null){
			out.print("[]");
			out.flush();
			out.close();
			return;
		}
		
		//SpringMain sm = new SpringMain();
		//sm.doit();
		
		List list = new ArrayList(); 
		Map map = null;
		try {  
			ResultSet rs = dao.query("select * from user");
			// should wrap rs to decouple to sql
            while (rs.next()) {
            	int id = rs.getInt("id");
                String name = rs.getString("name");
                String password = rs.getString("password");
                
                map = new HashMap();  
                map.put( "id", id );  
                map.put( "name", name );  
                map.put( "password", password );  
                  
                list.add( map );    
            }  
        } catch (BusinessException e) {  
            System.out.println("failed");  
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("failed"); 
		}  
		JSONArray jsonArray = JSONArray.fromObject( list );  
		out.print(jsonArray);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		
		Map rc = new HashMap();  
        
		String action = request.getParameter("action");
		if(action == null){
			rc.put( "result", "error");  
			rc.put( "data", "unknown action");
		}else if(action.equals("add")){
			try {  
	            dao.execute("insert into user (name,password) values (\""+request.getParameter("name")+"\",\""+request.getParameter("password")+"\")");
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (BusinessException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else if(action.equals("delete")){
			try {  
				dao.execute("delete from user where id="+request.getParameter("id"));
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (BusinessException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else if(action.equals("deleteAll")){
			try {  
				dao.execute("delete from user");
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (BusinessException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else if(action.equals("update")){
			try {  
				dao.execute("update user set name = \""+request.getParameter("name")+"\", password =  \""+request.getParameter("password")+"\" where id="+request.getParameter("id"));
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (BusinessException e) {  
	        	rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else{
			rc.put( "result", "error");  
			rc.put( "data", "");
		}
		out.print(JSONObject.fromObject( rc ));

		out.flush();
		out.close();
	}

	public static void main(String args[]){
		
	}
}
