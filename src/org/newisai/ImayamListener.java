// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ImayamListener.java

package org.newisai;

import java.util.Calendar;
import java.util.Timer;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// Referenced classes of package com.imayam.music:
//            MyTimerTask

public class ImayamListener
    implements ServletContextListener
{

    public ImayamListener()
    {
    }

    public void contextDestroyed(ServletContextEvent servletcontextevent)
    {
    }

    public void contextInitialized(ServletContextEvent arg0)
    {
        Calendar runDate = Calendar.getInstance();
        runDate.set(5, 1);
        runDate.set(11, 0);
        runDate.set(12, 0);
        runDate.add(2, 1);
        MyTimerTask myTask = new MyTimerTask();
        Timer myTimer = new Timer();
        myTimer.schedule(myTask, runDate.getTime());
    }
}
