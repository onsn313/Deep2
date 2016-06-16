<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rp.emp.EmpSvc" %>
<%
    //Post로 넘어온 Parameter에 대한 인코딩
    request.setCharacterEncoding("utf-8");
    int rt= 0;
    EmpSvc svc = new EmpSvc();
    rt = svc.addEmp(request);
     
    // rt는 입력건수
    if (rt > 0 ){
        %>
        <script type="text/javascript">
                    alert("저장되었습니다.");
                    window.document.location.href="emp_select_list.jsp";
        </script>
        <%
    }
         
%>