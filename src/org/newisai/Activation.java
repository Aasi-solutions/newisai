// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Activation.java

package org.newisai;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.log4j.Logger;

// Referenced classes of package org.newisai:
//            DatabaseAccess

public class Activation extends HttpServlet
{

    public Activation()
    {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String email = request.getParameter("user_email");
        String id = request.getParameter("user_id");
        PrintWriter out = response.getWriter();
        try
        {
            DatabaseAccess.updateactivate(email, id);
            out.println("Updated ");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        out.println("Activated Succesfully");
    }

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger
			.getLogger(Activation.class);
    private static int user_id = 0;
    private static String user_email = null;

}
