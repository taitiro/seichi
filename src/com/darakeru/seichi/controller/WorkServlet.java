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
/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "作品情報を登録・表示", urlPatterns = { "/work","/work/*" })
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
	    Work thisWork;
	    try{
	        id = Integer.parseInt(request.getPathInfo().substring(1));
	    }catch (NumberFormatException e){
	        response.sendRedirect(Parameter.URL_ROOT+ "error/404.html" );
	    }
	    
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
        EntityManager em = emf.createEntityManager();

        try{
            thisWork = (Work) em.find(Work.class,id);
        }finally{
            em.close();
            emf.close();
        }

        request.setAttribute("thisWork",thisWork);
        request.getRequestDispatcher("/jsp/workView.jsp").forward(request, response);
	}
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

}
