<%@ page  import="java.sql.*" %>
<%
            String uname = request.getParameter("id");
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","exam","exam");
                Statement st = con.createStatement();
                String sql="delete from Com where CUsername='" + uname + "'";
				System.out.println("user name="+uname);
                int x=st.executeUpdate(sql);
                if(x>0){
                    response.sendRedirect("AdminCompanyDetails.jsp");
                }else{
                    out.println("Error: cannot delete record"); 
                    
                }
                con.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
%>