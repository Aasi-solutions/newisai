// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DatabaseAccess.java

package org.newisai;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

// Referenced classes of package org.newisai:
//            Getdata, GetMovie, SongVo

public class DatabaseAccess
{

    public DatabaseAccess()
    {
    }

    public static void saveSongs(String movie, String song, String composer, ArrayList artist, String lyricist, String fileName, String imagename)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = "INSERT INTO music_catalog(movie, song, composer, lyrics, file_name,month_hitcount,create_time,image_file_name) VALUES (?, ?, ?, ?, ?,0,sysdate(),?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, movie.trim());
        ps.setString(2, song.trim());
        ps.setString(3, composer.trim());
        ps.setString(4, lyricist);
        ps.setString(5, fileName);
        ps.setString(6, imagename);
        ps.execute();
        updateartist(artist, song, movie);
        ps.close();
        conn.close();
    }

    public static String createPlaylistid(int id,String username, String[] results)
            throws Exception
        {
    	
            Connection conn = getConnection();
            String user_nickname=username +" playlist";
            String comments="no comments";
            int playlist_id=0;
            String message1="";
            Statement stmt = conn.createStatement();
           String sql1="select playlist_id from music_playlist where user_id='"+id+"'";
           ResultSet rs = stmt.executeQuery(sql1);
           if(rs.next())
           {
        	    playlist_id=rs.getInt("playlist_id");
        	    insertCatalogid(results,playlist_id);

        	message1=user_nickname+"Added Succcessfully";
        	   	
          }
           else
           {
        	   String sql ="insert into music_playlist(playlist_id,playlist_name,user_id,create_time,comments)values(null,?,?,sysdate(),?)";
            
           PreparedStatement ps = conn.prepareStatement(sql);
            
           ps.setString(1,user_nickname.trim());            
            ps.setInt(2,id);
            ps.setString(3,comments.toString());
            ps.execute();
            ps.close();
            
            
          logger.error("created");
           message1="New Playlist created,So add again";
         
          
           }
           return message1;  
                    
          
        }
            
           
 
    
    
    public static void insertCatalogid(String[] results,int playlist_id)throws Exception
    {
    	
    	Connection conn = getConnection();
    	Statement stmt = conn.createStatement();
        	
    	for (int ii = 0; ii < results.length; ii++) {
               	      String  sql1 = (new StringBuilder("insert into music_catalog_m2m_playlist values(")).append(results[ii]).append(",").append(playlist_id).append(")").toString();
    	     logger.error("existing playlist_id"+playlist_id+"    "+results[ii]);   
        	           	
        	           	stmt.execute(sql1);
           }
    	
    	  conn.close();
    	   
    }
    
    public static int getPlid(int uid)
            throws Exception
        {
            Connection conn = getConnection();
            int mess = 0;
            String sql1 = "select playlist_id from music_playlist where user_id='"+uid+"'";
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
                mess = rs.getInt("playlist_id");
            return mess;
        }
   
    
    
    public static ArrayList<SongVo> viewPlSong(int plid)
            throws Exception
        {
            Connection conn = getConnection();
            ArrayList  cid=new ArrayList();
            SongVo vo;
            Statement stmt = conn.createStatement() ;
           // String sql1 ="select catalog_id from music_catalog_m2m_playlist where playlist_id='"+plid+"'";
         
            
            
            for(ResultSet rs = stmt.executeQuery((new StringBuilder("select a.id,a.song,a.movie from music_catalog a left join music_catalog_m2m_playlist b on(a.id=b.catalog_id)  where playlist_id=")).append(plid).toString()); rs.next(); cid.add(vo))
            //for(ResultSet rs = stmt.executeQuery((new StringBuilder("select distinct catalog_id from music_catalog_m2m_playlist where playlist_id=")).append(plid).toString()); rs.next(); cid.add(vo))
            {
            	String catid=rs.getString("id");
            	String songname=rs.getString("song");
            	String moviename=rs.getString("movie");
            	vo=new SongVo();
            	logger.error(songname+moviename+catid);
            	vo.setId(catid);
            	vo.setsongName(songname);
            	vo.setMovieName(moviename);
   			 
            }
            
            
		
		
			conn.close();
			logger.error(cid);
         
			return cid;
			
            
            
        }
    
    
    
    public static String deletecid(String[] songid, int pid)
            throws Exception
        {
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            String mess="deleted";
            int ii;
        	for ( ii = 0; ii < songid.length; ii++) {
            String sql = (new StringBuilder("delete from music_catalog_m2m_playlist where playlist_id='")).append(pid).append("' and catalog_id='").append(songid[ii]).append("'").toString();
          //mess="existing playlist_id"+pid+"    "+songid[ii];   
           	
           	stmt.execute(sql);
            }
           
            
            
            return mess;
            
        }
    
    
    public static ArrayList getArrivals()
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        for(ResultSet rs = statement.executeQuery("SELECT DISTINCT movie,image_file_name,composer FROM music_catalog order by create_time desc limit 0, 5"); 
        		rs.next(); 
        		selectList.add(gd))
        {
            String movie = rs.getString("movie");
            String image = rs.getString("image_file_name");
            String image_file_name = image.replace("/home/imayam2/public_html/", "http://www.imayam.org/");
            String composer = rs.getString("composer");
            gd = new Getdata();
            gd.setMovie(movie);
            gd.setImage_file_name(image_file_name);
            gd.setComposer(composer);
        }

        con.close();
        return selectList;
    }

    public static ArrayList getMovie(String s)
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        for(ResultSet rs = statement.executeQuery((new StringBuilder("SELECT DISTINCT movie,image_file_name FROM music_catalog where movie like '")).append(s).append("%' order by movie").toString()); rs.next(); selectList.add(gd))
        {
            String movie = rs.getString("movie");
            String image = rs.getString("image_file_name");
            String imagereplace = image.replace("/home/imayam2/public_html/", "http://www.imayam.org/");
            gd = new Getdata();
            gd.setMovie(movie);
            gd.setImage_file_name(imagereplace);
        }

        con.close();
        return selectList;
    }

    public static ArrayList getnumMovie()
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        for(ResultSet rs = statement.executeQuery("select distinct movie,image_file_name from music_catalog where movie regexp '^[0-9]+' order by movie"); rs.next(); selectList.add(gd))
        {
            String movie = rs.getString("movie");
            String image = rs.getString("image_file_name");
            String imagereplace = image.replace("/home/imayam2/public_html/", "http://www.imayam.org/");
            gd = new Getdata();
            gd.setMovie(movie);
            gd.setImage_file_name(imagereplace);
        }

        con.close();
        return selectList;
    }

    public static void updateartist(ArrayList artist, String song, String movie)
        throws Exception
    {
        Connection conn = getConnection();
        for(int i = 0; i < artist.size(); i++)
        {
            int artist_id = 0;
            logger.error(artist.get(i).toString());
            String sql = (new StringBuilder("select  artist_id from music_artist where artist_name='")).append(artist.get(i).toString()).append("'").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql); rs.next();)
            {
                artist_id = rs.getInt("artist_id");
                if(artist_id != 0)
                {
                    String sql2 = (new StringBuilder("select id,artist_id from music_catalog a ,music_artist b where a.song='")).append(song).append("'and a.movie='").append(movie).append("'  and b.artist_name='").append(artist.get(i).toString()).append("'").toString();
                    Statement stmt2 = conn.createStatement();
                    String sql3;
                    Statement stmt3;
                    for(ResultSet rs2 = stmt2.executeQuery(sql2); rs2.next(); stmt3.execute(sql3))
                    {
                        int id = rs2.getInt("id");
                        int aid = rs2.getInt("artist_id");
                        sql3 = (new StringBuilder("insert into music_catalog_m2m_artist values(")).append(id).append(",").append(aid).append(")").toString();
                        stmt3 = conn.createStatement();
                    }

                }
            }

            if(artist_id == 0)
            {
                String sql1 = (new StringBuilder("insert into music_artist values(null,'")).append(artist.get(i).toString()).append("',0)").toString();
                Statement stmt1 = conn.createStatement();
                stmt1.execute(sql1);
                String sql2 = (new StringBuilder("select id,artist_id from music_catalog a ,music_artist b where a.song='")).append(song).append("' and a.movie='").append(movie).append("'  and b.artist_name='").append(artist.get(i).toString()).append("'").toString();
                Statement stmt2 = conn.createStatement();
                String sql3;
                Statement stmt3;
                for(ResultSet rs2 = stmt2.executeQuery(sql2); rs2.next(); stmt3.execute(sql3))
                {
                    int id = rs2.getInt("id");
                    int aid = rs2.getInt("artist_id");
                    sql3 = (new StringBuilder("insert into music_catalog_m2m_artist values(")).append(id).append(",").append(aid).append(")").toString();
                    stmt3 = conn.createStatement();
                }

            }
        }

        conn.close();
    }

    public static ArrayList getingArtist(String s)
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        ResultSet rs ;
        
        for(rs = statement.executeQuery((new StringBuilder("SELECT DISTINCT artist_name FROM music_artist where artist_name like '")).append(s).append("%' ORDER BY hitcount desc").toString()); rs.next(); selectList.add(gd))
        {
            String artist = rs.getString("artist_name");
            gd = new Getdata();
            gd.setArtist(artist);
        }

        con.close();
        return selectList;
    }

    public static ArrayList getingComposer(String s)
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        for(ResultSet rs = statement.executeQuery((new StringBuilder("SELECT DISTINCT composer FROM music_catalog where composer like '")).append(s).append("%' ORDER BY hitcount desc").toString()); rs.next(); selectList.add(gd))
        {
            String composer = rs.getString("composer");
            gd = new Getdata();
            gd.setComposer(composer);
        }

        con.close();
        return selectList;
    }

    public static ArrayList getinglyricist(String s)
        throws Exception
    {
        ArrayList selectList = new ArrayList();
        Connection con = getConnection();
        Statement statement = con.createStatement();
        Getdata gd;
        for(ResultSet rs = statement.executeQuery((new StringBuilder("SELECT DISTINCT lyrics FROM music_catalog where lyrics like '")).append(s).append("%'ORDER by hitcount desc").toString()); rs.next(); selectList.add(gd))
        {
            String lyrics = rs.getString("lyrics");
            gd = new Getdata();
            gd.setLyrics(lyrics);
        }

        con.close();
        return selectList;
    }
    
  
    public static ArrayList<SongVo> getUserplaylist(String artist)
         throws Exception
         {
    	
    	Connection conn = getConnection();
        ArrayList getuserplaylist = new ArrayList();
       
        String sql = null;
        sql="select id,movie,song from music_catalog where movie='"+artist+"'";
        Statement stmt = conn.createStatement();
        SongVo vo;
        
        
        for(ResultSet rs = stmt.executeQuery(sql); rs.next(); getuserplaylist.add(vo))
        {
            String movie = rs.getString("movie");
        String id=rs.getString("id");
        String song=rs.getString("song");
        
        
            vo = new SongVo();
            vo.setMovieName(movie);
            vo.setsongName(song);
            vo.setId(id);
            
        }
        
			return getuserplaylist; 
    	
         }

    
    
    
    public static String getSongsListRss(String artist)
        throws Exception
    {
        Connection conn = getConnection();
        StringBuffer myPlayList = new StringBuffer();
        String sql = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        if("all".equalsIgnoreCase(artist))
        {
            sql = "SELECT distinct id, song, movie, composer, lyrics, file_name, image_file_name FROM music_catalog order by hitcount desc limit 0, 100";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } else
        if("Monthly".equalsIgnoreCase(artist))
        {
            sql = "SELECT distinct id, song, movie, composer, lyrics, file_name, image_file_name FROM music_catalog order by month_hitcount desc limit 0, 100";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } else
        if("NewAdds".equalsIgnoreCase(artist))
        {
            sql = "SELECT distinct id, song, movie, composer, lyrics, file_name, image_file_name FROM music_catalog order by create_time desc limit 0, 100";
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } else
        {
            sql = "SELECT distinct a.id, a.song, a.movie, a.composer, a.lyrics, a.file_name, a.image_file_name,a.hitcount FROM music_catalog a, music_artist b, music_catalog_m2m_artist c WHERE (artist_name = ? or movie = ? or composer = ? or lyrics = ?) and a.id = c.catalog_id and b.artist_id = c.artist_id order by hitcount desc limit 0, 100";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, artist);
            ps.setString(2, artist);
            ps.setString(3, artist);
            ps.setString(4, artist);
            rs = ps.executeQuery();
            String sql1 = (new StringBuilder("Select artist_id from music_artist where artist_name='")).append(artist).append("'").toString();
            Statement stmt = conn.createStatement();
            int artist_id;
            for(rs2 = stmt.executeQuery(sql1); rs2.next(); updateartistCount(artist_id))
                artist_id = rs2.getInt("artist_id");

        }
        myPlayList.append("<rss version='2.0' xmlns:media='http://search.yahoo.com/mrss/' xmlns:jwplayer='http://developer.longtailvideo.com/trac/'>\n");
        myPlayList.append("<channel>\n");
        myPlayList.append("<title>imayam.org playlist</title>");
        
        for(; rs.next(); updateCount(rs.getInt("id")))
        {
            myPlayList.append("\t<item>\n");
            myPlayList.append((new StringBuilder("\t\t<title>")).append(rs.getString("movie")).append(" : ").append(rs.getString("song")).append("</title>\n").toString());
            myPlayList.append((new StringBuilder("\t\t<description>")).append(rs.getString("composer")).append(" : ").append(rs.getString("lyrics")).append("\n"));
            int id = rs.getInt("id");
            String sql1 = (new StringBuilder("select b.artist_name,b.artist_id from music_catalog a, music_artist b, music_catalog_m2m_artist c WHERE id='")).append(id).append("' and a.id = c.catalog_id and b.artist_id = c.artist_id ; ").toString();
            Statement stmt = conn.createStatement();
            for(rs1 = stmt.executeQuery(sql1); rs1.next();)
            {
                String artist1 = rs1.getString("artist_name");
                if(rs1.isLast())
                    myPlayList.append(artist1);
                else
                    myPlayList.append(artist1).append(",");
            }

            myPlayList.append("</description>\n").toString();
            myPlayList.append("\t\t<media:content url='");
            myPlayList.append(rs.getString("file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("<media:thumbnail url='");
            myPlayList.append(rs.getString("image_file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("\t</item>\n");
        }

        myPlayList.append("</channel>\n");
        myPlayList.append("</rss>\n");
        conn.close();
        return myPlayList.toString();
    }

    
    public static String getCustomRssPlayList(String artist)
        throws Exception
    {
        Connection conn = getConnection();
        StringBuffer myPlayList = new StringBuffer();
        String sql = null;
        ResultSet rs = null;
        sql = "SELECT distinct id, song, movie, composer, lyrics, file_name, image_file_name FROM music_catalog a, music_playlist d, music_catalog_m2m_playlist e WHERE playlist_name = ? and d.playlist_id = e.playlist_id and e.catalog_id = a.id order by a.hitcount desc limit 0, 100";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, artist);
        rs = ps.executeQuery();
        myPlayList.append("<rss version='2.0' xmlns:media='http://search.yahoo.com/mrss/' xmlns:jwplayer='http://developer.longtailvideo.com/trac/'>\n");
        myPlayList.append("<channel>\n");
        myPlayList.append("<title>imayam.org playlist</title>");
        for(; rs.next(); updateCount(rs.getInt("id")))
        {
            myPlayList.append("\t<item>\n");
            myPlayList.append((new StringBuilder("\t\t<title>")).append(rs.getString("movie")).append(" : ").append(rs.getString("song")).append("</title>\n").toString());
            myPlayList.append((new StringBuilder("\t\t<description>")).append(rs.getString("composer")).append(" : ").append(rs.getString("lyrics")).append("\n"));
            int id = rs.getInt("id");
            String sql1 = (new StringBuilder("select b.artist_name,b.artist_id from music_catalog a, music_artist b, music_catalog_m2m_artist c WHERE id='")).append(id).append("' and a.id = c.catalog_id and b.artist_id = c.artist_id ; ").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs1 = stmt.executeQuery(sql1); rs1.next();)
            {
                String artist1 = rs1.getString("artist_name");
                int artist_id = rs1.getInt("artist_id");
                updateartistCount(artist_id);
                if(rs1.isLast())
                    myPlayList.append(artist1);
                else
                    myPlayList.append(artist1).append(",");
            }

            myPlayList.append("</description>\n").toString();
            myPlayList.append("\t\t<media:content url='");
            myPlayList.append(rs.getString("file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("<media:thumbnail url='");
            myPlayList.append(rs.getString("image_file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("\t</item>\n");
        }

        myPlayList.append("</channel>\n");
        myPlayList.append("</rss>\n");
        conn.close();
        return myPlayList.toString();
    }

    public static String getSearch(String artist, String sesval)
        throws Exception
    {
        Connection conn = getConnection();
        StringBuffer myPlayList = new StringBuffer();
        String sql = null;
        ResultSet rs = null;
        String per = "%";
        artist = artist.concat(per);
        artist = per.concat(artist);
        if("song".equals(sesval))
        {
            sql = "SELECT distinct song,movie,file_name,image_file_name,composer,lyrics,id FROM music_catalog where song  like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, artist);
            rs = ps.executeQuery();
        } else
        if("movie".equals(sesval))
        {
            sql = "SELECT distinct song,movie,file_name,image_file_name,composer,lyrics,id FROM music_catalog where  movie like ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, artist);
            rs = ps.executeQuery();
        }
        myPlayList.append("<rss version='2.0' xmlns:media='http://search.yahoo.com/mrss/' xmlns:jwplayer='http://developer.longtailvideo.com/trac/'>\n");
        myPlayList.append("<channel>\n");
        myPlayList.append("<title>imayam.org playlist</title>");
        for(; rs.next(); updateCount(rs.getInt("id")))
        {
            myPlayList.append("\t<item>\n");
            myPlayList.append((new StringBuilder("\t\t<title>")).append(rs.getString("movie")).append(":").append(rs.getString("song")).append("</title>\n").toString());
            myPlayList.append((new StringBuilder("\t\t<description>")).append(rs.getString("composer")).append(" : ").append(rs.getString("lyrics")).append("\n"));
            int id = rs.getInt("id");
            String sql1 = (new StringBuilder("select b.artist_name,b.artist_id from music_catalog a, music_artist b, music_catalog_m2m_artist c WHERE id='")).append(id).append("' and a.id = c.catalog_id and b.artist_id = c.artist_id ; ").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs1 = stmt.executeQuery(sql1); rs1.next();)
            {
                String artist1 = rs1.getString("artist_name");
                int artist_id = rs1.getInt("artist_id");
                updateartistCount(artist_id);
                if(rs1.isLast())
                    myPlayList.append(artist1);
                else
                    myPlayList.append(artist1).append(",");
            }

            myPlayList.append("</description>\n").toString();
            myPlayList.append("\t\t<media:content url='");
            myPlayList.append(rs.getString("file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("<media:thumbnail url='");
            myPlayList.append(rs.getString("image_file_name").replaceAll("/home/imayam2/public_html", "http://www.imayam.org"));
            myPlayList.append("' />\n");
            myPlayList.append("\t</item>\n");
        }

        myPlayList.append("</channel>\n");
        myPlayList.append("</rss>\n");
        conn.close();
        return myPlayList.toString();
    }

    public static void updateCount(int id)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = "UPDATE music_catalog SET hitcount=hitcount+1, month_hitcount=month_hitcount+1 where id = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.execute();
        ps.close();
        conn.close();
    }

    public static void updateartistCount(int artist_id)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = "UPDATE music_artist SET hitcount=hitcount+1 where artist_id = ?;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, artist_id);
        ps.execute();
        ps.close();
        conn.close();
    }

    public static ArrayList getImage()
        throws Exception
    {
        Connection conn = getConnection();
        ArrayList getimage = new ArrayList();
        String sql = "select movie as m,image_file_name as i,sum(month_hitcount) as a,count(song) as b ,sum(month_hitcount)/count(song) as c from music_catalog group by movie order by c desc limit 0, 4";
        Statement stmt = conn.createStatement();
        GetMovie gv;
        for(ResultSet rs = stmt.executeQuery(sql); rs.next(); getimage.add(gv))
        {
            String image = rs.getString("i");
            String str1 = image.replace("/home/imayam2/public_html/", "http://www.imayam.org/");
            logger.error((new StringBuilder(String.valueOf(str1))).append("          ").toString());
            String movie = rs.getString("m");
            gv = new GetMovie();
            gv.setMoviename(movie);
            gv.setImage(str1);
        }

        conn.close();
        return getimage;
    }

    public static ArrayList getImagena()
        throws Exception
    {
        Connection conn = getConnection();
        ArrayList getimage = new ArrayList();
        String sql = "SELECT distinct movie,image_file_name FROM music_catalog order by create_time desc limit 0, 5";
        Statement stmt = conn.createStatement();
        GetMovie gv;
        for(ResultSet rs = stmt.executeQuery(sql); rs.next(); getimage.add(gv))
        {
            String image = rs.getString("image_file_name");
            String str1 = image.replace("/home/imayam2/public_html/", "http://www.imayam.org/");
            logger.error((new StringBuilder(String.valueOf(str1))).append("          ").toString());
            String movie = rs.getString("movie");
            gv = new GetMovie();
            gv.setMoviename(movie);
            gv.setImage(str1);
        }

        conn.close();
        return getimage;
    }

    public static void insertnewuser(String user_email, String user_password, String user_nickname)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = (new StringBuilder("insert into music_user (user_id,user_email,user_password,user_nickname,is_active,create_time)values(null,'")).append(user_email).append("','").append(user_password).append("','").append(user_nickname).append("',0,sysdate())").toString();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        logger.error("Inserted");
        ps.close();
        conn.close();
    }

    public static ArrayList getsongfields(String getmovie)
        throws Exception
    {
        Connection conn = getConnection();
        ArrayList songlist = new ArrayList();
        String sql = (new StringBuilder("select distinct a.id,a.movie,a.song,a.composer,a.lyrics,a.image_file_name,c.artist_id,c.artist_name from music_catalog a left join music_catalog_m2m_artist b on (a.id=b.catalog_id) left join music_artist c on( c.artist_id=b.artist_id) where a.movie='")).append(getmovie).append("'").toString();
        Statement stmt = conn.createStatement();
        SongVo av;
        for(ResultSet rs = stmt.executeQuery(sql); rs.next(); songlist.add(av))
        {
            String id = rs.getString("id");
            String movie = rs.getString("movie");
            String song = rs.getString("song");
            String composer = rs.getString("composer");
            String lyrics = rs.getString("lyrics");
            String artist = rs.getString("artist_name");
            String artist_id = rs.getString("artist_id");
            String image = rs.getString("image_file_name");
            av = new SongVo();
            av.setId(id);
            av.setMovieName(movie);
            av.setsongName(song);
            av.setComposerName(composer);
            av.setLyricistName(lyrics);
            av.setArtistName(artist);
            av.setArtistId(artist_id);
            av.setImage_file_name(image);
        }

        conn.close();
        return songlist;
    }

    public static void getArtistname(String id, String movie, String artist_id, String artist_name)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = (new StringBuilder("select artist_id from music_artist where artist_name='")).append(artist_name).append("'").toString();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next())
        {
            String aid = rs.getString("artist_id");
            String sql1 = (new StringBuilder("select artist_id,catalog_id from music_catalog_m2m_artist where catalog_id='")).append(id).append("'").toString();
            Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery(sql1);
            if(rs1.next())
            {
                String arid = rs1.getString("artist_id");
                if(!arid.equals(aid))
                {
                    String sql3 = (new StringBuilder("insert into music_catalog_m2m_artist values ('")).append(id).append("','").append(aid).append("')").toString();
                    Statement stmt3 = conn.createStatement();
                    stmt3.execute(sql3);
                }
            } else
            {
                String sql3 = (new StringBuilder("insert into music_catalog_m2m_artist values ('")).append(id).append("','").append(aid).append("')").toString();
                Statement stmt3 = conn.createStatement();
                stmt3.execute(sql3);
                logger.error("Inserted");
            }
        } else
        {
            String sql1 = (new StringBuilder("insert into music_artist values(null,'")).append(artist_name).append("',0)").toString();
            Statement stmt1 = conn.createStatement();
            stmt1.execute(sql1);
            getArtistname(id, movie, artist_id, artist_name);
        }
        conn.close();
    }

    public static void deleteArtist(String arid, String cid)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = (new StringBuilder("delete from music_catalog_m2m_artist where artist_id='")).append(arid).append("' and catalog_id='").append(cid).append("'").toString();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        logger.error((new StringBuilder("Deleted")).append(arid).append(cid).toString());
        ps.close();
    }

    public static void updateImage(String movie, String image_file_name)
        throws Exception
    {
        Connection conn = getConnection();
        String sql = (new StringBuilder("update music_catalog set image_file_name='")).append(image_file_name).append("' where movie ='").append(movie).append("'").toString();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        ps.close();
    }

    public static void getDetails(String id, String artist_id, String movie, String song, String composer, String lyrics, String artist_name, String image_file_name)
        throws Exception
    {
        Connection conn = getConnection();
        String sql1 = (new StringBuilder("update music_catalog a set a.movie='")).append(movie).append("',a.song='").append(song).append("',a.composer='").append(composer).append("',a.lyrics='").append(lyrics).append("',a.image_file_name='").append(image_file_name).append("' where a.id='").append(id).append("'").toString();
        PreparedStatement ps = conn.prepareStatement(sql1);
        ps.execute();
        ps.close();
    }

    public static void updatemonthCount()
        throws Exception
    {
        Connection conn = getConnection();
        String sql = "UPDATE music_catalog SET month_hitcount=0";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        conn.close();
    }

    public static void updateisactive()
        throws Exception
    {
        Connection conn = getConnection();
        String sql = "delete from music_user where is_active=0";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        conn.close();
    }
    public static String getpass(String user_email)
    {
    	String msg="Check Your Email";
    	 String to = user_email;
         String from = "admin@imayam.org";
         String host = "localhost";
         Properties properties = System.getProperties();
         properties.setProperty("mail.smtp.host", host);
         properties.setProperty("mail.smtp.port", String.valueOf(587));
         properties.put("mail.debug", "true");
         Session session = Session.getDefaultInstance(properties);
         try
         {
             MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(from));
             message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
             message.setSubject("Welcome to www.imayam.org");
            
            String user_password = getpassword(user_email);	
            message.setText("This is your password:       "+user_password);
           // message.setText(msgbody.toString(), "UTF-8", "html");
            Transport.send(message);
          logger.error("message sent successfully....");
        }
        catch(Exception mex)
        {
            msg = mex.getMessage();
            logger.error(mex.getMessage().toString());
        }
        return msg;
    }

    public static String getEmail(String user_email)
    {
    	logger.error("welcome");
        String returnMessage = "E-Mail Sent Successfully";
        String to = user_email;
        String from = "admin@imayam.org";
        String host = "localhost";
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", String.valueOf(587));
        properties.put("mail.debug", "true");
        Session session = Session.getDefaultInstance(properties);
        try
        {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Welcome to www.imayam.org");
            message.setText("Hello, Click below url to create your own playlist");
            int user_id = getId(user_email);
            StringBuffer msgbody = new StringBuffer();
            msgbody.append("<html>");
            msgbody.append("<body>");
            msgbody.append("<h3>Click this Button to activate your own playlist account</h3>");
            msgbody.append("<form action='http://www.imayam.org/newisai/activate'/>");
            msgbody.append((new StringBuilder("<input type='hidden' name='user_email' value='")).append(user_email).append("'/>").toString());
            msgbody.append((new StringBuilder("<input type='hidden' name='user_id' value='")).append(user_id).append("'/>").toString());
            msgbody.append("<input type='submit' value='SUBMIT'/>");
            msgbody.append("<h3>If Not, Your Registration will be Invalid in 30 Days</h3>");
            msgbody.append("</body>");
            msgbody.append("</form>");
            msgbody.append("</html>");
            message.setText(msgbody.toString(), "UTF-8", "html");
            Transport.send(message);
            logger.error("message sent successfully....");
        }
        catch(Exception mex)
        {
            returnMessage = mex.getMessage();
            logger.error(mex.getMessage().toString());
        }
        return returnMessage;
    }

    public static String getcontact(String dd, String fn, String ln, String email, String telephone, String comments)
    {
        String returnMessage = null;
        String to = "aasisolutions@gmail.com";
        String from = email;
        String host = "localhost";
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", String.valueOf(587));
        properties.put("mail.debug", "true");
        Session session = Session.getDefaultInstance(properties);
        try
        {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Feedback from www.imayam.org");
            message.setText((new StringBuilder(String.valueOf(dd))).append(fn).append(ln).append(email).append(telephone).append(comments).toString());
            Transport.send(message);
            logger.error("message sent successfully....");
        }
        catch(Exception mex)
        {
            returnMessage = mex.getMessage();
            logger.error(mex.getMessage().toString());
        }
        return returnMessage;
    }

    public static void updateactivate(String user_email, String user_id)
            throws Exception
        {
            Connection conn = getConnection();
            String sql = "UPDATE music_user SET is_active=1 where user_email=? && user_id=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_email);
            ps.setString(2, user_id);
            ps.execute();
            ps.close();
            conn.close();
        }


    public static String Emailcheck(String user_email, String user_nickname)
        throws Exception
    {
        Connection conn = getConnection();
        String message = null;
        String sql = (new StringBuilder("select user_email from music_user where user_email='")).append(user_email).append("'").toString();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        String sql1 = (new StringBuilder("select user_nickname from music_user where user_nickname='")).append(user_nickname).append("'").toString();
        Statement stmt1 = conn.createStatement();
        ResultSet rs1 = stmt1.executeQuery(sql1);
        if(!rs.equals(null))
            while(rs.next()) 
            {
                String email = rs.getString("user_email");
                if(email.equalsIgnoreCase(user_email))
                    message = "Please Enter Vaild E-mail the Given E-mail is Already Exist";
            }
        while(rs1.next()) 
        {
            String name = rs1.getString("user_nickname");
            if(name.equalsIgnoreCase(user_nickname))
                message = "Name Already Exist Please Enter Different Name";
        }
        conn.close();
        return message;
    }

    public static int getId(String email)
        throws Exception
    {
        Connection conn = getConnection();
        int mess = 0;
        String sql1 = (new StringBuilder("select user_id from music_user where user_email='")).append(email).append("'").toString();
        Statement stmt = conn.createStatement();
        for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
            mess = rs.getInt("user_id");

        return mess;
    }
   
    public static int getIdnick(String user_nickname)
            throws Exception
        {
            Connection conn = getConnection();
            int mess = 0;
            String sql1 = (new StringBuilder("select user_id from music_user where user_nickname='")).append(user_nickname).append("'").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
                mess = rs.getInt("user_id");

            return mess;
        }
    
    public static int getId(String user_nickname,String user_password)
            throws Exception
        {
            Connection conn = getConnection();
            int mess = 0;
            //String sql = (new StringBuilder("update music_catalog set image_file_name='")).append(image_file_name).append("' where movie ='").append(movie).append("'").toString();
            String sql1 = (new StringBuilder("select user_id from music_user where user_nickname='")).append(user_nickname).append("'and user_password='").append(user_password).append("'").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
                mess = rs.getInt("user_id");

            return mess;
        }
    public static int checkIsactive(int id)
            throws Exception
        {
            Connection conn = getConnection();
            int mess = 0;
            //String sql = (new StringBuilder("update music_catalog set image_file_name='")).append(image_file_name).append("' where movie ='").append(movie).append("'").toString();
            String sql1 = (new StringBuilder("select is_active from music_user where user_id='")).append(id).append("'").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
                mess = rs.getInt("is_active");

            return mess;
        }
    
    public static String getnickname(int id)
            throws Exception
        {
            Connection conn = getConnection();
            String mess = "null";
            
            String sql1 = (new StringBuilder("select user_nickname from music_user where user_id='")).append(id).append("'").toString();
            Statement stmt = conn.createStatement();
            for(ResultSet rs = stmt.executeQuery(sql1); rs.next();)
                mess = rs.getString("user_nickname");

            return mess;
        }
    
    
       
    public static String getpassword(String email)throws Exception
    {
        Connection conn = getConnection();
        String mess = "Check Your Email";
        String sql1 = (new StringBuilder("select user_password from music_user where user_email='")).append(email).append("'").toString();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql1);
        if(rs.next()){
            mess = rs.getString("user_password");}
        else{
        	mess="Invalid Email";}

        return mess;
    }
    
    

    
    public static Connection getConnection()
        throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imayam2_phpbb1", "imayam2_aasi", "aasi");
//    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imayam2_phpbb1", "root", "aasi");// local
        return con;
    }

    private static final Logger logger = Logger
			.getLogger(DatabaseAccess.class);

}
