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
import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.Placeinfo;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;
/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "聖地情報を登録・表示", urlPatterns = { "/place/*" })
public class PlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id = 0;
	    Place thisPlace = null;
	    try{
	        id = Integer.parseInt(request.getPathInfo().substring(1));
	    }catch (Exception e){
	        response.sendRedirect("http://localhost:8080/seichi/search.html");
	    }
	    
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();

        try{
            em.getTransaction().begin();
            thisPlace = (Place) em.find(Place.class,id);
            thisPlace.getPlaceinfo().addAccessnum();
            em.getTransaction().commit();
        }catch(Exception e){
            response.sendRedirect("http://localhost:8080/seichi/");
        }finally{
            em.close();
            emf.close();
        }

        request.setAttribute("thisPlace",thisPlace);
        request.getRequestDispatcher("/jsp/placeView.jsp").forward(request, response);
	}
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //リファラーチェック
        if(!request.getHeader("Referer").equals(Parameter.URL_ROOT + "confirmplaceadd")){
            response.sendRedirect(Parameter.URL_ROOT);
        }
        Place thisPlace = new Place();
        thisPlace.setName(request.getParameter("name"));
        thisPlace.setPlacedesc(request.getParameter("placedesc"));
        thisPlace.setLat(request.getParameter("lat"));
        thisPlace.setLng(request.getParameter("lng"));
        thisPlace.setImg(request.getParameter("img"));
        thisPlace.setProductid1(request.getParameter("productid1"));
        thisPlace.setProductid2(request.getParameter("productid2"));
        thisPlace.setProductid3(request.getParameter("productid3"));
        thisPlace.setProductid4(request.getParameter("productid4"));
        thisPlace.setProductid5(request.getParameter("productid5"));
        thisPlace.setUrl1(request.getParameter("url1"));
        thisPlace.setUrlname1(request.getParameter("urlname1"));
        thisPlace.setUrl2(request.getParameter("url2"));
        thisPlace.setUrlname2(request.getParameter("urlname2"));
        thisPlace.setUrl3(request.getParameter("url3"));
        thisPlace.setUrlname3(request.getParameter("urlname3"));
        Placeinfo thisPlaceinfo = new Placeinfo();
        Placework thisPlacework = new Placework();
        int workid = Integer.parseInt(request.getParameter("workid"));
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(thisPlace);
            thisPlaceinfo.setPlaceid(thisPlace.getPlaceid());
            em.persist(thisPlaceinfo);
            thisPlacework.setPlace(thisPlace);
            thisPlacework.setWork(em.find(Work.class, workid));
            em.getTransaction().commit();
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
            response.sendRedirect(Parameter.URL_ROOT+"place/"+thisPlace.getPlaceid());
        }
    }

}
