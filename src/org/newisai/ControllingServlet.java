// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ControllingServlet.java


package org.newisai;

import com.google.gson.Gson;
import java.io.*;
import java.util.ArrayList;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.commons.validator.routines.EmailValidator;
import org.apache.log4j.Logger;
import org.jaudiotagger.audio.AudioFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.id3.ID3v23Tag;

// Referenced classes of package org.newisai:
//            DatabaseAccess

public class ControllingServlet extends HttpServlet
{
	ArrayList<SongVo> userPlaylist = null;
    public ControllingServlet()
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
    	 
        try
        {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            ArrayList country = new ArrayList();
            String action = request.getParameter("action");
            if("reindex".equalsIgnoreCase(action))
            {
                String dir = request.getParameter("dir");
                if(dir != null)
                {
                    File myFiles = new File((new StringBuilder("/home/imayam2/public_html/songs/")).append(dir).toString());
                    StringBuffer buffer = getFileNames(myFiles);
                    response.setContentType("text/plain");
                    out.print(buffer.toString());
                    out.flush();
                }
            } else
            if("arrival".equalsIgnoreCase(action))
            {
                country = DatabaseAccess.getArrivals();
                Gson gson = new Gson();
                String json = gson.toJson(country);
                String json1 = (new StringBuilder("{\"arrivals\":")).append(json).append("}").toString();
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
            } 
                        
         
            
            else
            if("Submit".equalsIgnoreCase(action))
            {
                String action1 = request.getParameter("action1");
                if("drop".equals(action1))
                {
                    String variableToBeStored = request.getParameter("variable");
                    session.setAttribute("variableXYZ", variableToBeStored);
                } else
                {
                    String dd = (String)session.getAttribute("variableXYZ");
                    if(dd == null)
                        dd = "Queries";
                    String fn = request.getParameter("first_name");
                    String ln = request.getParameter("last_name");
                    String telephone = request.getParameter("telephone");
                    String comments = request.getParameter("comments");
                    String email = request.getParameter("email");
                    EmailValidator ev = EmailValidator.getInstance();
                    boolean b = ev.isValid(email);
                    if(b && !fn.equals(null) && !ln.equals(null) && !telephone.equals(null) && !comments.equals(null))
                    {
                        if(fn.length() > 4)
                        {
                            if(ln.length() > 4)
                            {
                                if(telephone.length() >= 9)
                                {
                                    if(comments.length() >= 25)
                                    {
                                        String message = "Informations sent successfully";
                                        String s = DatabaseAccess.getcontact(dd, fn, ln, email, telephone, comments);
                                        request.setAttribute("message", (new StringBuilder(String.valueOf(message))).append("           ").append(s).toString());
                                        RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
                                        rd.forward(request, response);
                                    } else
                                    {
                                        String message = "Please Enter Comments more than 25 Words";
                                        request.setAttribute("message", message);
                                        RequestDispatcher rd = request.getRequestDispatcher("/Contact.jsp");
                                        rd.forward(request, response);
                                    }
                                } else
                                {
                                    String message = "Please Enter Telephone Number more than Ten Numbers";
                                    request.setAttribute("message", message);
                                    RequestDispatcher rd = request.getRequestDispatcher("/Contact.jsp");
                                    rd.forward(request, response);
                                }
                            } else
                            {
                                String message = "Please Enter the Last Name more than Five Letters";
                                request.setAttribute("message", message);
                                RequestDispatcher rd = request.getRequestDispatcher("/Contact.jsp");
                                rd.forward(request, response);
                            }
                        } else
                        {
                            String message = "Please Enter the First Name more than Five Letters";
                            request.setAttribute("message", message);
                            RequestDispatcher rd = request.getRequestDispatcher("/Contact.jsp");
                            rd.forward(request, response);
                        }
                    } else
                    {
                        String message = "Please Enter the Mandatory values";
                        request.setAttribute("message", message);
                        RequestDispatcher rd = request.getRequestDispatcher("/Contact.jsp");
                        rd.forward(request, response);
                    }
                }
            } else
            if("moviesrch".equalsIgnoreCase(action))
            {
                String s = request.getParameter("id");
                logger.error(s);
                country = DatabaseAccess.getMovie(s);
                Gson gson = new Gson();        
                String json = gson.toJson(country);
            String    json1 = (new StringBuilder("{\"movies\":")).append(json).append("}").toString();
                
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
            } else
            if("nummoviesrch".equalsIgnoreCase(action))
            {
                country = DatabaseAccess.getnumMovie();
                Gson gson = new Gson();
                String json = gson.toJson(country);
                
               
                
               String json1 = (new StringBuilder("{\"movies\":")).append(json).append("}").toString();
                
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
            }
            else if("Customize your Playlist".equalsIgnoreCase(action)){
            	int id = (Integer) session.getAttribute("id");
            	int i=DatabaseAccess.getPlid(id);
            	session.setAttribute("i", i);
            	ArrayList<SongVo> cid;
            	cid=DatabaseAccess.viewPlSong(i);
            	session.setAttribute("cid",cid);
            	logger.error("controlling servlet"+cid);
            	RequestDispatcher rd = request
						.getRequestDispatcher("/User.jsp");
            	rd.forward(request, response);
            }
            
            
            else if("Confirm Delete".equalsIgnoreCase(action))
            {
            	int playid = (Integer) session.getAttribute("i");
            	String mess="";
            	String message="";
            	String[] results11 = request.getParameterValues("chdel");
            	
            	if(results11==null)
				{
					 message="No songs selected/found";
					 logger.error(message);
				}else{
            	for (int i = 0; i < results11.length; i++) {
            		logger.error(results11[i]); 
				}
             mess=DatabaseAccess.deletecid(results11, playid);
				}
            	
            	request.setAttribute("mess", mess);
            	request.setAttribute("message", message);
            	RequestDispatcher rd = request
						.getRequestDispatcher("/User.jsp");
            	rd.forward(request, response);
            	
            }
             
            
            else if("Add to my playlist".equalsIgnoreCase(action))
            {
            	int id = (Integer) session.getAttribute("id");
            	int i=DatabaseAccess.checkIsactive(id);
String message1;
String message2="";
				if(i==1){
					String[] results = request.getParameterValues("ch");
					if(results==null)
					{
						message1="No songs selected/found";
						logger.error(message1);
					}else{
					for (int ii = 0; ii < results.length; ii++) {
					    logger.error(results[ii]); 
					}
					 
					
					
					String username=DatabaseAccess.getnickname(id);
					
						message1=DatabaseAccess.createPlaylistid(id,username,results);
						message2=message1.replace("No songs selected/found", "");
						message2=message1.replace("Added Succcessfully", "");
						 
					}
		request.setAttribute("message1",message1);
		request.setAttribute("message2",message2);
		logger.error("message1"+message1);
		logger.error("message2"+message2);
		
		logger.error("Add to my playlist Action's"+userPlaylist);
					
					
					
				RequestDispatcher rd = request
						.getRequestDispatcher("/welcome.jsp");
				
				rd.forward(request, response);
				
				}
				else
						{
					
							String message="Click submit button to activate your account from your email-id sent by www.imayam.org";
							request.setAttribute("message", message);
							RequestDispatcher rd = request
									.getRequestDispatcher("/login.jsp");
							rd.forward(request, response);
					
						}
            //	 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
              //   rd.forward(request, response);
            }
        
            else if("Add to my Library".equalsIgnoreCase(action))
            {
            	   
            	
            	 logger.error("Add Action's"+userPlaylist);
            	   RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                   rd.forward(request, response);
            	   
            }
            
            else
            if("artist".equalsIgnoreCase(action))
            {
            	 String s = request.getParameter("id");
            	 logger.error(s);
                country = DatabaseAccess.getingArtist(s);
              
                 Gson gson = new Gson();
                String json = gson.toJson(country);
              
                String json1;
                if(json.equals("[]")){
             	  
             	   json="\"No artist found\"";
             	   json1 = (new StringBuilder("{\"artists1\":")).append("[").append("{").append("\"artist\":").append(json).append("}").append("]").append("}").toString();//{"artists":No artist}
             	  
                }
                else{
                            
          
              json1 = (new StringBuilder("{\"artists\":")).append(json).append("}").toString();
                }
                  
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
               	
               
            }
            
            else
            if("composer".equalsIgnoreCase(action))
            {
            	String s = request.getParameter("id");
            	logger.error(s);
                country = DatabaseAccess.getingComposer(s);
                Gson gson = new Gson();
                String json = gson.toJson(country);
                String json1;
                if(json.equals("[]")){
             	  
             	   json="\"No composer found\"";
             	   json1 = (new StringBuilder("{\"composers1\":")).append("[").append("{").append("\"composer\":").append(json).append("}").append("]").append("}").toString();//{"artists":No artist}
             	  
                }
                else{
                
                json1 = (new StringBuilder("{\"composers\":")).append(json).append("}").toString();
                }
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
            } 
            else if("View Password".equalsIgnoreCase(action))
			{
            	
				String user_mail=request.getParameter("t1");
				String s=DatabaseAccess.getpass(user_mail);
				 request.setAttribute("message", s);
                 RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                 rd.forward(request, response);
				
			}
            
          
            else
            if("lyricist".equalsIgnoreCase(action))
            {
            	String s = request.getParameter("id");
            	logger.error(s);
                country = DatabaseAccess.getinglyricist(s);
                Gson gson = new Gson();
                String json = gson.toJson(country);
                
                String json1;
                if(json.equals("[]")){
             	  
             	   json="\"No lyricist found\"";
             	   json1 = (new StringBuilder("{\"lyricists1\":")).append("[").append("{").append("\"lyrics\":").append(json).append("}").append("]").append("}").toString();//{"artists":No artist}
             	  
                }
                else{
                
              json1 = (new StringBuilder("{\"lyricists\":")).append(json).append("}").toString();
                }
                logger.error(json1);
                response.setContentType("application/json");
                response.getWriter().print(json1);
            } else
            if(action != null && action.indexOf("playRssSong") > -1)
                getPlayListRss(action, response, request);
            else
            if(action != null && action.indexOf("customRssPlayList") > -1)
                getcustomRssPlayList(action, response);
            else
            if(action != null && action.indexOf("search") > -1)
                getsearch(action, response, request);
            else
            if("Register".equalsIgnoreCase(action))
            {
            	logger.error("Entered into Register action");
                String user_email = request.getParameter("email");
                String user_nickname = request.getParameter("name");
                
                EmailValidator ev = EmailValidator.getInstance();
                boolean b = ev.isValid(user_email);
                if(user_email != null && user_nickname != null)
                {
                    String mess = DatabaseAccess.Emailcheck(user_email, user_nickname);
                    if(mess != null)
                    {
                        request.setAttribute("message", mess);
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        rd.forward(request, response);
                    } else
                    if(b)
                    {
                        String user_password = request.getParameter("pass");
                        if(user_nickname.equals("") || user_password.equals(""))
                       {
                            String message = " (*) Fields are Mandatory";
                            request.setAttribute("message", message);
                            RequestDispatcher rd = request.getRequestDispatcher("/NewPlaylist.jsp");
                            rd.forward(request, response);
                        } else
                        {
                            try
                            {
                                if(user_nickname.length() > 5 && user_password.length() > 5)
                                {
                                    DatabaseAccess.insertnewuser(user_email, user_password, user_nickname);
                                    String message ="Registration Successful !!! Check Your Email";
                                    String s = DatabaseAccess.getEmail(user_email);
                                    request.setAttribute("message", (new StringBuilder(String.valueOf(message))).append("           ").append(s).toString());
                                    RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
                                    rd.forward(request, response);
                                } else
                                {
                                    String message = "Please Enter the Name and Password more than Five Letters";
                                    request.setAttribute("message", message);
                                    RequestDispatcher rd = request.getRequestDispatcher("/NewPlaylist.jsp");
                                    rd.forward(request, response);
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        
                    }
                        }
                    
                 else
                {
                    String message = "Enter Valid Email";
                    request.setAttribute("message", message);
                    RequestDispatcher rd = request.getRequestDispatcher("/NewPlaylist.jsp");
                    rd.forward(request, response);
                }
                }
            } else
            {
                ArrayList gm = new ArrayList();
                ArrayList gm1 = new ArrayList();
                gm = DatabaseAccess.getImage();
                gm1 = DatabaseAccess.getImagena();
                request.setAttribute("img2", gm1);
                request.setAttribute("img1", gm);
                request.getRequestDispatcher("/homepage.jsp").forward(request, response);
            }
        }
        catch(Exception e)
        {
            //PrintWriter out = response.getWriter();
            //out.println(e.getMessage());
            request.setAttribute("message", e.getMessage());
            request.getRequestDispatcher("error1.jsp").forward(request, response);
        }

  
    }

 
    
	public void getPlayListRss(String action, HttpServletResponse response, HttpServletRequest request)
        throws Exception
    {
    	//String artist = action.replaceAll("Add To My Playlist", "");
    	HttpSession session=request.getSession();
        String artist = action.replaceAll("playRssSong", "");
        String playList = DatabaseAccess.getSongsListRss(artist);
       
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        out.print(playList);
        
        
         userPlaylist=DatabaseAccess.getUserplaylist(artist);
        session.setAttribute("userPlaylist", userPlaylist);   
     
                
       
    logger.error(userPlaylist);   
       
       
       
    }
    
    public void getcustomRssPlayList(String action, HttpServletResponse response)
        throws Exception
    {
    
        String artist = action.replaceAll("customRssPlayList", "");
        String playList = DatabaseAccess.getCustomRssPlayList(artist);
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        out.print(playList);
        out.flush();
    }

    public void getsearch(String action, HttpServletResponse response, HttpServletRequest request)
        throws Exception
    {
        HttpSession session = request.getSession();
        String sesval = (String)session.getAttribute("variableXYZ");
        if(sesval == null)
            sesval = "song";
        String artist = action.replaceAll("search", "");
        if(!artist.equals(""))
        {
            String playList = DatabaseAccess.getSearch(artist, sesval);
            session.removeAttribute("variableXYZ");
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            out.print(playList);
            out.flush();
        }
    }

    public StringBuffer getFileNames(File folder)
        throws Exception
    {
        String mySystem[] = folder.list();
        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < mySystem.length; i++)
        {
            for(int j = 0; j < mySystem.length; j++)
            {
                String extension = mySystem[j].substring(mySystem[j].lastIndexOf(".") + 1, mySystem[j].length());
                String image = "jpg";
                if(extension.equals(image))
                {
                    File imageFile = new File((new StringBuilder()).append(folder).append("/").append(mySystem[j]).toString());
                    String image1 = "jpg";
                    String extension1 = mySystem[i].substring(mySystem[i].lastIndexOf(".") + 1, mySystem[i].length());
                    if(!extension1.equals(image1))
                    {
                        File newFile = new File((new StringBuilder()).append(folder).append("/").append(mySystem[i]).toString());
                        if(newFile.isDirectory())
                            getFileNames(newFile);
                        else
                            buffer.append(getTagValues(newFile, imageFile));
                    }
                }
            }

        }

        return buffer;
    }

    public StringBuffer getTagValues(File filename, File imagename)
        throws Exception
    {
        AudioFile audioFile = AudioFileIO.read(filename);
        java.awt.Image img = ImageIO.read(imagename);
        ID3v23Tag tag = (ID3v23Tag)audioFile.getTag();
        StringBuffer buffer = new StringBuffer();
        ArrayList artist = new ArrayList();
        String tempArtist = tag.getFirst(FieldKey.ARTIST);
        String album = tag.getFirst(FieldKey.ALBUM);
        String title = tag.getFirst(FieldKey.TITLE);
        String lyricist = tag.getFirst(FieldKey.LYRICIST);
        String composer = tag.getFirst(FieldKey.COMPOSER);
        buffer.append((new StringBuilder("This is : ")).append(filename.getAbsoluteFile()).toString());
        buffer.append((new StringBuilder("This is : ")).append(imagename.getAbsoluteFile()).toString());
        buffer.append((new StringBuilder("\nArtist : ")).append(tempArtist).append("\n").toString());
        String regex = "[&;,]";
        String tokens[] = tempArtist.split(regex);
        for(int a = 0; a < tokens.length; a++)
        {
            String token = tokens[a];
            buffer.append(token);
            artist.add(token);
        }

        buffer.append((new StringBuilder("Album : ")).append(album).append("\n").toString());
        buffer.append((new StringBuilder("title : ")).append(title).append("\n").toString());
        buffer.append((new StringBuilder("composer : ")).append(composer).append("\n\n").toString());
        DatabaseAccess.saveSongs(album, title, composer, artist, lyricist, filename.getAbsolutePath(), imagename.getAbsolutePath());
        return buffer;
    }

    private static final long serialVersionUID = 1L;
    
    
    private static final Logger logger = Logger
			.getLogger(ControllingServlet.class);

}
