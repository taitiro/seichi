package com.darakeru.seichi.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.Parameter;
import com.darakeru.seichi.model.Work;
import com.darakeru.seichi.model.Workinfo;

/**
 * Servlet implementation class AddWorkServlet
 */
@WebServlet(description = "作品情報の追加", urlPatterns = { "/addwork" })
public class AddWorkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWorkServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        Work thisWork = new Work();
        thisWork.setName(request.getParameter("name"));
        thisWork.setWorkdesc(request.getParameter("workdesc"));
        thisWork.setImg(request.getParameter("img"));
        thisWork.setProductid1(request.getParameter("productid1"));
        thisWork.setProductid2(request.getParameter("productid2"));
        thisWork.setProductid3(request.getParameter("productid3"));
        thisWork.setProductid4(request.getParameter("productid4"));
        thisWork.setProductid5(request.getParameter("productid5"));
        thisWork.setUrl1(request.getParameter("url1"));
        thisWork.setUrlname1(request.getParameter("urlname1"));
        thisWork.setUrl2(request.getParameter("url2"));
        thisWork.setUrlname2(request.getParameter("urlname2"));
        thisWork.setUrl3(request.getParameter("url2"));
        thisWork.setUrlname3(request.getParameter("urlname2"));
        thisWork.setWikipedia(request.getParameter("wikipedia"));
        Workinfo thisWorkinfo = new Workinfo();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(thisWork);
            thisWorkinfo.setWorkid(thisWork.getWorkid());
            em.persist(thisWorkinfo);
            em.getTransaction().commit();
        } catch(Exception e){
            e.printStackTrace();;
        } finally {
            em.close();
            emf.close();
            response.sendRedirect(Parameter.URL_ROOT+"work.html");
        }
    }

}
