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

import com.darakeru.seichi.model.Place;
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
        // TODO Auto-generated method stub
    }

}
