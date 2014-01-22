package com.darakeru.seichi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.PlaceJsonBean;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;
/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "作品情報を登録・表示", urlPatterns = { "/work/*" })
public class WorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id = 0;
	    Work thisWork = null;
	    List<Place> placeList = new ArrayList<Place>();
        PlaceJsonBean thisJson = new PlaceJsonBean();
	    try{
	        id = Integer.parseInt(request.getPathInfo().substring(1));
	    }catch (Exception e){
	        response.sendRedirect("http://localhost:8080/seichi/searchwork.html");
	    }
	    
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();

        try{
            em.getTransaction().begin();
            thisWork = (Work) em.find(Work.class,id);
            thisWork.getWorkinfo().addAccessnum();
            em.getTransaction().commit();
            for(Placework onePlacework : thisWork.getPlaceworks()){
                placeList.add(onePlacework.getPlace());
            }
            thisJson.setPlaceList(placeList);
        }catch(Exception e){
            response.sendRedirect("http://localhost:8080/seichi/");
        }finally{
            em.close();
            emf.close();
        }

        request.setAttribute("thisWork",thisWork);
        request.setAttribute("thisJson",thisJson);
        request.getRequestDispatcher("/jsp/workView.jsp").forward(request, response);
	}
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

}
