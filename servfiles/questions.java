
package servfiles;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "questions", urlPatterns = {"/questions"})
public class questions extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sub;
		try
		{
		
				sub=request.getParameter("subject");
			
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/msc", "root", "");

			stmt = con.prepareStatement("select * from state where id = ?");
			stmt.setInt(1, iNum);

			rs = stmt.executeQuery();

			if (rs.next())
			{
				if (rs.getInt(1) < 10)
				{
					strName = ("0" + String.valueOf(rs.getInt(1)) + " - " + rs
							.getString(2));

				}
				else
				{
					strName = (String.valueOf(rs.getInt(1)) + " - " + rs
							.getString(2));
				}

			}
			RequestDispatcher objRequest = request
					.getRequestDispatcher("StateName.jsp");
			request.setAttribute("NAME", strName);
			objRequest.forward(request, response);
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
