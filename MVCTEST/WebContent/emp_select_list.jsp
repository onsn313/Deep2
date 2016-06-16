<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rp.emp.EmpDto" %>
<%
request.setCharacterEncoding("utf-8");
String search_type = request.getParameter("search_type");
String search_string = request.getParameter("search_string");
ArrayList<EmpDto> al = (ArrayList<EmpDto>) request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script language="javascript">
    function search_data(){
        var frm=document.search_form;
        frm.submit();
    }
</script>
</head>
<body>
    <form name="search_form" method="post" action="emp_list.do">
        <select name="search_type">
            <option value="id">ID</option>
            <option value="이름">이름</option>
            <option value="성">성</option>
            <option value="나이">나이</option>
        </select>
        <input type="text" name="search_string" value="<%=search_string%>">
        <input type="button" value="조회" onClick="search_data();">
    </form>
    사원목록
    <table border="1" cellspacing="0" width="500">
    <tr>
        <th width="10%">ID</th><th width="25%">First</th><th width="40%">last</th><th width="25%">age</th>
    </tr>
    <%
    //Result Set Fetch
    for (int i=0; i < al.size(); i++){
        System.out.println("==========="+al.size());
      %>
      <tr>
          <td><a href="emp_select_detail.jsp?seq=<%=al.get(i).getSeq()%>"><%=al.get(i).getId()%></a></td>
          <td><%=al.get(i).getFirst()%></td>
          <td><%=al.get(i).getLast()%></td>
          <td><%=al.get(i).getAge()%></td>
      </tr>
    <%
     
    }
    %>
      <tr><td colspan="4"><input type="button" value="New" onclick="javascript:window.document.location.href='emp_insert_form.jsp'"></td></tr>
    </table>
    </body>
    </html>