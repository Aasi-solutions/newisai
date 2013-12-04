package org.newisai;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.*;
import org.apache.log4j.Logger;

// Referenced classes of package org.newisai:
//            DatabaseAccess

public class Logout extends HttpServlet
{

    public Logout()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	HttpSession session = request.getSession(true);
    	logger.debug("logout");
    	
    		PrintWriter out = response.getWriter();
    	
    		session.setAttribute("user", null);
    		
    		session.invalidate();
    		try{
    			logger.debug(session.getAttribute("user"));
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    		request.setAttribute("message", "You have Successfully logged out");
    		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
    		

    		}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
      
    }

  
    private static final Logger logger = Logger
			.getLogger(Logout.class);
  

}


