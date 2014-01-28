package com.darakeru.seichi.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.Parameter;
import com.darakeru.seichi.model.ConfirmPlaceBean;

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
        //セッションチェックを含んでおいてー
        ConfirmPlaceBean thisPlace = new ConfirmPlaceBean();
        //絶対に必要な値
        try {
            thisPlace.setName(request.getParameter("name"));
            thisPlace.setAddress(request.getParameter("address"));
            thisPlace.setUrl1(request.getParameter("url1"));
            thisPlace.setUrlname1(request.getParameter("urlname1"));
            thisPlace.setGoogleid(request.getParameter("googleid"));
            //数値かどうかチェック
            try {
                thisPlace.setLat(new BigDecimal(request.getParameter("lat")));
                thisPlace.setLng(new BigDecimal(request.getParameter("lng")));
            } catch (NumberFormatException e) {
                response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
            }
        } catch (NullPointerException e) {
            response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
        }


        if (request.getParameter("placedesc") != null) {
            thisPlace.setPlacedesc(request.getParameter("placedesc"));
        }else{
            thisPlace.setPlacedesc("");
        }
        if (request.getParameter("img") != null) {
            thisPlace.setImg(request.getParameter("img"));
        }else{
            thisPlace.setImg("");
        }
        if (request.getParameter("url2") != null) {
            thisPlace.setUrl2(request.getParameter("url2"));
        }else{
            thisPlace.setUrl2("");
        }
        if (request.getParameter("url3") != null) {
            thisPlace.setUrl3(request.getParameter("url3"));
        }else{
            thisPlace.setUrl3("");
        }
        if (request.getParameter("urlname2") != null) {
            thisPlace.setUrlname2(request.getParameter("urlname2"));
        }else{
            thisPlace.setUrlname2("");
        }
        if (request.getParameter("urlname3") != null) {
            thisPlace.setUrlname3(request.getParameter("urlname3"));
        }else{
            thisPlace.setUrlname3("");
        }
        
        if (request.getParameter("foursquareid") != null) {
            thisPlace.setFoursquareid(request.getParameter("foursquareid"));
        }else{
            thisPlace.setFoursquareid();
        }
        if (request.getParameter("facebookid") != null) {
            thisPlace.setFacebookid(request.getParameter("facebookid"));
        }else{
            thisPlace.setFacebookid();
        }
        if (request.getParameter("twitterid") != null) {
            thisPlace.setTwitterid(request.getParameter("twitterid"));
        }else{
            thisPlace.setTwitterid();
        }
        //数値かどうかチェック
        try {
            if (request.getParameter("instagramid") != null) {
                thisPlace.setInstagramid(Integer.parseInt(request.getParameter("instagramid")));
            }else{
                thisPlace.setInstagramid();
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(Parameter.URL_ROOT + "error/inputError.html");
        }
        //テスト用
        System.out.println(thisPlace.getName());
        response.sendRedirect(Parameter.URL_ROOT);
    }
}
