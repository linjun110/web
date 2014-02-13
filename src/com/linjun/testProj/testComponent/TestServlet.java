package com.linjun.testProj.testComponent;

import com.linjun.testProj.testComponent.bo.*;

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
	
	private Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
        try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		
		try {
			System.out.println("Connecting to db ...");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myProject", "root", "root");
			System.out.println("Successfully connect to db ...");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
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
		
		if(con == null){
			out.print("[]");
			out.flush();
			out.close();
			return;
		}
		
		List list = new ArrayList(); 
		Map map = null;
		try {  
            String sql = "select * from users";
            Statement st = (Statement) con.createStatement();

            ResultSet rs = st.executeQuery(sql);
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
        } catch (SQLException e) {  
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
	            String sql = "insert into users (name,password) values (\""+request.getParameter("name")+"\",\""+request.getParameter("password")+"\")";
	            Statement st = (Statement) con.createStatement();
	              
	            int count = st.executeUpdate(sql);
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (SQLException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
			out.print(JSONObject.fromObject( rc ));
		}else if(action.equals("delete")){
			try {  
	            String sql = "delete from users where id="+request.getParameter("id");
	            Statement st = (Statement) con.createStatement();
	              
	            int count = st.executeUpdate(sql);
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (SQLException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else if(action.equals("deleteAll")){
			try {  
	            String sql = "delete from users";
	            Statement st = (Statement) con.createStatement();
	              
	            int count = st.executeUpdate(sql);
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (SQLException e) {  
				rc.put( "result", "error");  
				rc.put( "data", "");
	        }  
		}else if(action.equals("update")){
			try {  
	            String sql = "update users set name = \""+request.getParameter("name")+"\", password =  \""+request.getParameter("password")+"\" where id="+request.getParameter("id");
	            Statement st = (Statement) con.createStatement();
	              
	            int count = st.executeUpdate(sql);
	            rc.put( "result", "ok");  
				rc.put( "data", "");
	        } catch (SQLException e) {  
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
		
		List list = new ArrayList(); 
		
		Map map = new HashMap();  
        map.put( "name", "json" );  
        map.put( "bool", Boolean.TRUE );  
        map.put( "int", new Integer(1) );  
        map.put( "arr", new String[]{"a","b"} );  
        
        list.add( map );
       // map.put( "func", "function(i){ return this.arr[i]; }" );  
          
        //JSONObject jsonObject = JSONObject.fromObject( list );  
        JSONArray jsonArray = JSONArray.fromObject( list );  
        System.out.println( jsonArray );
	}
}
