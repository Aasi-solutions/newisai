package org.newisai;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.crypto.Data;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

// Referenced classes of package com.imayam.music:
//            DataAccess

public class FileUploadServlet extends HttpServlet {

	public FileUploadServlet() {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String action = request.getParameter("action");
		if ("adminedit".equalsIgnoreCase(action)) {
			ArrayList sv = new ArrayList();
			try {
				String getmovie = request.getParameter("searchartist");
				sv = DatabaseAccess.getsongfields(getmovie);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("song", sv);
			request.getRequestDispatcher("/WEB-INF/admin/edit.jsp").forward(
					request, response);
			return;
		}
		if ("addartist".equalsIgnoreCase(action)) {
			System.out.println("Entered into addartist action");
			String artistname = request.getParameter("txt");
			String id = request.getParameter("id");
			String movie = request.getParameter("movie");
			String artist_id = request.getParameter("aid");
			if (!artistname.equals("")) {
				try {
					DatabaseAccess.getArtistname(id, movie, artist_id,
							artistname);
					out.println((new StringBuilder("Inserted Artistname "))
							.append(artistname).append(" catalog_id")
							.append(id).toString());
					out.println("<a href=\"adminaction?action=adminedit\">Back</a>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				out.println("Please Enter Artist Name");
				out.println("<a href=\"adminaction?action=adminedit\">Back</a>");
			}

		}
		if ("Delete".equalsIgnoreCase(action)) {
			try {
				String arid = request.getParameter("aid");
				String cid = request.getParameter("id");
				DatabaseAccess.deleteArtist(arid, cid);
				out.println((new StringBuilder("Deleted !!! Artist Id "))
						.append(arid).append("Catalog_id ").append(cid)
						.toString());
				out.println("<a href=\"adminaction?action=adminedit\">Back</a>");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if ("UpdateImage".equalsIgnoreCase(action)) {
			try {
				String image_file_name = request.getParameter("image");
				String movie = request.getParameter("movie");
				DatabaseAccess.updateImage(movie, image_file_name);
				out.println((new StringBuilder("Image Updated !!! Movie "))
						.append(movie).toString());
				out.println("<a href=\"adminaction?action=adminedit\">Back</a>");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if ("update".equalsIgnoreCase(action)) {
			String id = request.getParameter("id");
			String artist_id = request.getParameter("aid");
			String movie = request.getParameter("movie");
			String song = request.getParameter("song");
			String composer = request.getParameter("composer");
			String lyrics = request.getParameter("lyrics");
			String artist_name = request.getParameter("artist");
			String image_file_name = request.getParameter("image");
			try {
				DatabaseAccess.getDetails(id, artist_id, movie, song, composer,
						lyrics, artist_name, image_file_name);
				out.println("Changes Updated!!!");
				out.println("<a href=\"adminaction?action=adminedit\">Back</a>");
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if ("home".equalsIgnoreCase(action)) {
			RequestDispatcher rd = request
					.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);

		}
		if ("loginaction".equalsIgnoreCase(action)) {
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			if(user.equals("pugazh")&& pass.equals("pugazh"))
			{
			RequestDispatcher rd = request
					.getRequestDispatcher("/WEB-INF/admin/upload.jsp");
			
			rd.forward(request, response);
		
			}
			else if (!user.equals("") && !pass.equals("")) {
				try {
					
					Connection con = DatabaseAccess.getConnection();
					String sql = (new StringBuilder(
							"select user_nickname,user_password from music_user where user_nickname='"))
							.append(user).append("' and user_password='")
							.append(pass).append("'").toString();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(sql);
					if (rs.next()) {
						String un = rs.getString("user_nickname");
						String pwd = rs.getString("user_password");
						if (user.equals(un) && pass.equals(pwd)) {
							request.setAttribute("message", user);
							
							HttpSession session=request.getSession();		
							session.setAttribute("user", user);
							int id=DatabaseAccess.getIdnick(user);
							session.setAttribute("id", id);
							
							request.setAttribute("message2", user+" playlist");
							System.out.println("File upload: line no 149"+user+id);
							//int i=DatabaseAccess.checkIsactive(id);
							//if(i==1){
							RequestDispatcher rd = request
									.getRequestDispatcher("/welcome.jsp");
							
							rd.forward(request, response);
							logger.error((new StringBuilder("welcome "))
								.append(user).toString());
							//}
							//else
								//	{
								//System.out.println("not 1, else loop");
									//	String message="You are not activated";
										//request.setAttribute("message", message);
										//RequestDispatcher rd = request
											//	.getRequestDispatcher("/login.jsp");
										//rd.forward(request, response);
									//System.out.println("forwarded to login.jsp");
								//	}
						} else {
							String message = "Invalid Username/Password";
							request.setAttribute("message", message);
							RequestDispatcher rd = request
									.getRequestDispatcher("/login.jsp");
							rd.forward(request, response);
						}
					} else {
						String message = "Please Enter Correct Username and Password";
						request.setAttribute("message", message);
						RequestDispatcher rd = request
								.getRequestDispatcher("/login.jsp");
						rd.forward(request, response);
					}
				} catch (Exception e) {
					logger.error("exception1", e);
				}
			} else {
				String message = "Please Enter Username and Password";
				request.setAttribute("message", message);
				RequestDispatcher rd = request
						.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}

		}
		
		if ("uploadaction".equalsIgnoreCase(action)) {

			if (!ServletFileUpload.isMultipartContent(request)) {
				logger.error("Line No:154");
				PrintWriter writer = response.getWriter();
				writer.println("Error: Form must has enctype=multipart/form-data.");
				writer.flush();
				return;
			}
			try {

				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(0x300000);
				logger.error((new StringBuilder("Temp Dir")).append(
						System.getProperty("java.io.tmpdir")).toString());
				factory.setRepository(new File(System
						.getProperty("java.io.tmpdir")));
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setFileSizeMax(0x2800000L);
				upload.setSizeMax(0x3200000L);
				// String uploadPath = "C:/AASI_WORK/2013/New folder/";
				String uploadPath = "/home/imayam2/public_html/songs/2013/";
				List formItems = upload.parseRequest(request);
				logger.error(Integer.valueOf(formItems.size()));
				if (formItems != null && formItems.size() > 0) {

					File uploadDir = null;
					Iterator iterator = formItems.iterator();
					while (iterator.hasNext()) {
						FileItem item = (FileItem) iterator.next();

						String name = item.getFieldName();
						String value = item.getString().toString();
						if (!item.isFormField()) {

							String fileName = (new File(item.getName()))
									.getName();
							if (fileName.equals("")) {

								String message = "Please Choose a File";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							} else if (!fileName.equals("")
									&& !value.equals("")) {

								if (!uploadDir.exists()) {

									uploadDir.mkdir();
									String filePath = (new StringBuilder())
											.append(uploadDir).append("/")
											.append(fileName).toString();
									File storeFile = new File(filePath);
									logger.error((new StringBuilder(
											"File name ")).append(fileName)
											.append("Fie Path")
											.append(filePath)
											.append("Store file is")
											.append(storeFile).toString());
									item.write(storeFile);
									request.setAttribute("message",
											"Upload has been done successfully!");
									break;
								}
								if (uploadDir.exists()) {

									String filePath = (new StringBuilder())
											.append(uploadDir).append("/")
											.append(fileName).toString();
									File storeFile = new File(filePath);
									logger.error((new StringBuilder(
											"File name ")).append(fileName)
											.append("Fie Path")
											.append(filePath)
											.append("Store file is")
											.append(storeFile).toString());
									item.write(storeFile);
									request.setAttribute("message",
											"Upload has been done successfully!");
									break;
								}

								String message = "Please Choose a File";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							} else if (value.equals("") && fileName.equals("")) {

								String message = "Please Enter Folder name and Choose a File";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							} else if (!value.equals("") && fileName.equals("")) {

								String message = "Please Choose a File";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							} else if (value.equals("") && !fileName.equals("")) {

								String message = "Please Enter the Folder Name";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							} else {

								String message = "Please Enter Folder name and Choose a File";
								request.setAttribute("message", message);
								request.getRequestDispatcher("error1.jsp")
										.forward(request, response);
							}
						}
						if (!value.equals("")) {

							logger.error((new StringBuilder("name and value"))
									.append(name).append(value).toString());
							uploadDir = new File((new StringBuilder(
									String.valueOf(uploadPath))).append(value)
									.toString());
							logger.error((new StringBuilder("uploadDir"))
									.append(uploadDir).toString());
							continue;
						}

						String message = "Please Enter Folder name";
						request.setAttribute("message", message);
						request.getRequestDispatcher("error1.jsp").forward(
								request, response);
						break;
					}
				}
			} catch (Exception ex) {

				logger.error(
						(new StringBuilder("Exception : ")).append(
								ex.getMessage()).toString(), ex);
				request.setAttribute("message", ex.getMessage());
				request.getRequestDispatcher("error1.jsp").forward(request,
						response);
			} catch (Throwable ex) {

				logger.error(
						(new StringBuilder("Throwable : ")).append(
								ex.getMessage()).toString(), ex);
				request.setAttribute("message", ex.getMessage());
				request.getRequestDispatcher("error1.jsp").forward(request,
						response);
			}

			getServletContext().getRequestDispatcher("/message.jsp").forward(
					request, response);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger
			.getLogger(FileUploadServlet.class);
	private static final String errorPage = "error1.jsp";
	private static final int MEMORY_THRESHOLD = 0x300000;
	private static final int MAX_FILE_SIZE = 0x2800000;
	private static final int MAX_REQUEST_SIZE = 0x3200000;

}
