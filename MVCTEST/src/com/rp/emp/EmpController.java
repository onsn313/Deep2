package com.rp.emp;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.rp.DBUtil;
/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class EmpController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger= Logger.getLogger( EmpController.class.getName() );
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
         
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
         
        response.setContentType("text/html"); 
        //response.getWriter().append("Served at: ").append(request.getContextPath());
         
        //Operation Type
        String OperationType = request.getParameter("OperationType");
        logger.log( Level.INFO, "OperationType: {0}", OperationType );
         
        if (OperationType == null) {
            EmpSvc svc = new EmpSvc();
            request.setAttribute("list",(ArrayList<EmpDto>)svc.getEmpList(request));
            RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/jsp/emp_select_list.jsp");
             
            rd.forward(request, response);
        } else if (OperationType.equals("insert")) {
        }  
    }  
}