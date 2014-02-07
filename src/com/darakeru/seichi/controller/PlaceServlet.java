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

import com.darakeru.apiClient.instagram.LocationMediaBean;
import com.darakeru.seichi.Parameter;
import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.Placeinfo;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "聖地情報を登録・表示", urlPatterns = { "/place", "/place/*" })
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
        int errorCode = 200;
        String errorStr = "";
        try {
            id = Integer.parseInt(request.getPathInfo().substring(1));
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                thisPlace = (Place) em.find(Place.class, id);
                if(thisPlace == null){
                    errorCode = 404;
                    errorStr = "指定された場所IDの場所が存在しません";
                }else{
                    thisPlace.getPlaceinfo().addAccessnum();
                    request.setAttribute("thisPlace", thisPlace);
                }
                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
                errorCode = 500;
                errorStr = "データベースからのデータ取得時にエラーが発生しました";
            } finally {
                em.close();
                emf.close();
            }
            getServletContext().setAttribute(String.valueOf(thisPlace.getInstagramid()), new LocationMediaBean(thisPlace.getInstagramid()));
        } catch (NumberFormatException e) {
            errorCode = 404;
            errorStr = "場所IDは数字で指定してください";
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            request.getRequestDispatcher("/jsp/placeView.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        int errorCode = 200;
        String errorStr = "";
        String redirectURL = Parameter.URL_ROOT;
        try {
            //リファラーチェック
            if (request.getHeader("Referer").equals(Parameter.URL_ROOT + "confirmplaceadd")) {
                Place thisPlace = new Place();
                thisPlace.setName(request.getParameter("name"));
                thisPlace.setPlacedesc(request.getParameter("placedesc"));
                thisPlace.setAddress(request.getParameter("address"));
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
                thisPlace.setGoogleid(request.getParameter("googleid"));
                thisPlace.setFacebookid(request.getParameter("facebookid"));
                thisPlace.setInstagramid(request.getParameter("instagramid"));
                thisPlace.setFoursquareid(request.getParameter("foursquareid"));
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
                    em.persist(thisPlacework);
                    em.getTransaction().commit();
                    redirectURL = Parameter.URL_ROOT + "place/" + thisPlace.getPlaceid();
                } catch (Exception e) {
                    e.printStackTrace();
                    errorCode = 500;
                    errorStr = "データベースからのデータ取得時にエラーが発生しました";
                } finally {
                    em.close();
                    emf.close();
                }
            } else {
                errorCode = 403;
                errorStr="不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            response.sendRedirect(redirectURL);
        }
    }

}
