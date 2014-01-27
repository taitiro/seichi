package com.darakeru.seichi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.model.Place;

/**
 * Servlet implementation class ConfirmPlaceaddServlet
 */
@WebServlet(description = "聖地追加の確認", urlPatterns = { "/confirmplaceadd" })
public class ConfirmPlaceaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmPlaceaddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Place thisPlace = new Place();
        thisPlace.setName(request.getParameter("name"));
        thisPlace.setPlacedesc(request.getParameter("workdesc"));
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
	}

}
