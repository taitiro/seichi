package com.darakeru.seichi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.Parameter;
import com.darakeru.seichi.model.ConfirmPlaceBean;
import com.darakeru.seichi.model.WorkListBean;

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
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        /*
         * リファラーチェック
         */
        if(!request.getHeader("referer").startsWith(Parameter.URL_ROOT + "placeadd.html") 
                && !request.getHeader("referer").startsWith(Parameter.URL_ROOT + "customplaceadd.html"))
        {
            response.sendRedirect(Parameter.URL_ROOT);
        }
        //セッションチェックを含んでおいてー
        ConfirmPlaceBean thisPlace = new ConfirmPlaceBean();
        //絶対に必要な値
        try {
            thisPlace.setName(request.getParameter("name"));
            thisPlace.setAddress(request.getParameter("address"));
            thisPlace.setGoogleid(request.getParameter("googleid"));
            //数値かどうかチェック
            try {
                thisPlace.setLat(request.getParameter("lat"));
                thisPlace.setLng(request.getParameter("lng"));
            } catch (NumberFormatException e) {
                response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
            }
        } catch (NullPointerException e) {
            response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
        }
        
        if (request.getParameter("placedesc") != null && !request.getParameter("placedesc").equals("") ) {
            thisPlace.setPlacedesc(request.getParameter("placedesc"));
        }else{
            thisPlace.setPlacedesc("");
        }
        if (request.getParameter("img") != null && !request.getParameter("img").equals("") ) {
            thisPlace.setImg(request.getParameter("img"));
        }else{
            thisPlace.setImg("");
        }
        if (request.getParameter("url1") != null && !request.getParameter("url1").equals("")) {
            thisPlace.setUrl1(request.getParameter("url1"));
        }else{
            thisPlace.setUrl1("");
        }
        if (request.getParameter("url2") != null && !request.getParameter("url2").equals("")) {
            thisPlace.setUrl2(request.getParameter("url2"));
        }else{
            thisPlace.setUrl2("");
        }
        if (request.getParameter("url3") != null && !request.getParameter("url3").equals("")) {
            thisPlace.setUrl3(request.getParameter("url3"));
        }else{
            thisPlace.setUrl3("");
        }
        if (request.getParameter("urlname1") != null && !request.getParameter("urlname1").equals("")) {
            thisPlace.setUrlname1(request.getParameter("urlname1"));
        }else{
            thisPlace.setUrlname1("");
        }
        if (request.getParameter("urlname2") != null && !request.getParameter("urlname2").equals("")) {
            thisPlace.setUrlname2(request.getParameter("urlname2"));
        }else{
            thisPlace.setUrlname2("");
        }
        if (request.getParameter("urlname3") != null && !request.getParameter("urlname3").equals("") ) {
            thisPlace.setUrlname3(request.getParameter("urlname3"));
        }else{
            thisPlace.setUrlname3("");
        }
        if (request.getParameter("productid1") != null && !request.getParameter("productid1").equals("")) {
            thisPlace.setProductid1(request.getParameter("productid11"));
        }else{
            thisPlace.setProductid1("");
        }
        if (request.getParameter("productid2") != null && !request.getParameter("productid2").equals("")) {
            thisPlace.setProductid2(request.getParameter("productid2"));
        }else{
            thisPlace.setProductid2("");
        }
        if (request.getParameter("productid3") != null && !request.getParameter("productid3").equals("") ) {
            thisPlace.setProductid3(request.getParameter("productid3"));
        }else{
            thisPlace.setProductid3("");
        }
        if (request.getParameter("productid4") != null && !request.getParameter("productid4").equals("")) {
            thisPlace.setProductid4(request.getParameter("productid4"));
        }else{
            thisPlace.setProductid4("");
        }
        if (request.getParameter("productid5") != null && !request.getParameter("productid5").equals("") ) {
            thisPlace.setProductid5(request.getParameter("productid5"));
        }else{
            thisPlace.setProductid5("");
        }
        if (request.getParameter("foursquareid") != null && !request.getParameter("foursquareid").equals("")) {
            thisPlace.setFoursquareid(request.getParameter("foursquareid"));
        }else{
            thisPlace.setFoursquareid();
        }
        if (request.getParameter("facebookid") != null && !request.getParameter("facebookid").equals("")) {
            thisPlace.setFacebookid(request.getParameter("facebookid"));
        }else{
            thisPlace.setFacebookid();
        }
        //数値かどうかチェック
        try {
            if (request.getParameter("instagramid") != null && !request.getParameter("instagramid").equals("")) {
                thisPlace.setInstagramid(Integer.parseInt(request.getParameter("instagramid")));
            }else{
                thisPlace.setInstagramid();
            }
            if (request.getParameter("workid") != null && !request.getParameter("workid").equals("")) {
                thisPlace.setWorkid(Integer.parseInt(request.getParameter("workid")));
            }else{
                thisPlace.setWorkid(0);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
        }
        if(getServletContext().getAttribute("workList")==null){
            getServletContext().setAttribute("workList", new WorkListBean());
        }
        request.setAttribute("thisPlace",thisPlace);
        request.getRequestDispatcher("/jsp/confirmplaceaddView.jsp").forward(request, response);
    }
}
