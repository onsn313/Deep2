<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.rp.DBUtil" %>
<%
    //Post로 넘어온 Parameter에 대한 인코딩
    request.setCharacterEncoding("utf-8");
    System.out.println("seq:" + request.getParameter("seq"));
     
     
    
   int id = 0;
   String passwd = "";
   int age = 0;
   String first = "";
   String last = "";
   
    //  Integer.parseInt(request.getParameter("seq"));
    String seq = request.getParameter("seq");
     
     
    // DB연결
    Connection conn = DBUtil.getConnection();
     
    //입력건수
    int rt;
     
    //PreparedStatement 선언
    PreparedStatement pstmt = null;
try {           
          
    StringBuffer sb= new StringBuffer("");
    sb.append(" insert into emp (                  \n");      
    sb.append("      id                         ,\n");
    sb.append("      passwd                         ,\n");
    sb.append("      first                      ,\n");       
    sb.append("      last                       ,\n");       
    sb.append("      age                        \n");       
    sb.append(" )                               \n"); 
    sb.append(" values (?,?,?,?,?)                   \n");
    //sb.append(" values (" + id + ",'" + first + "','" + last + "'," + age +") \n");
    System.out.println(sb.toString());
    
        //파라미터 바인딩
        pstmt = conn.prepareStatement(sb.toString());
//        pstmt.setString( 1, first);
//        pstmt.setString( 2, last);
//       pstmt.setInt( 3, age);
//     pstmt.setInt( 4, seq);
        pstmt.setInt( 1, id);
        pstmt.setString( 2, passwd);
        pstmt.setString( 3, first);
        pstmt.setString( 4, last);
        pstmt.setInt( 5, age); 
         
        //쿼리실행
        rt = pstmt.executeUpdate();
        if (rt > 0 ){
            %>
            <script language="javascript">
                        alert("저장되었습니다.");
                        window.document.location.href="emp_select_list.jsp";
            </script>
            <%
        }
         
         
        //커밋
        //conn.commit();
         
} catch (Exception e) {
    //에러인 경우 Rollback
    //conn.rollback();
    System.out.println("error : " + e);
    e.printStackTrace(System.out);
     
} finally {
    //관련자원 닫기
        DBUtil.closeConnection(conn, pstmt);
}
%>