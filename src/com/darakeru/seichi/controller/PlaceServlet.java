package com.darakeru.seichi.controller;

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.apiClient.foursquare.VenueBean;
import com.darakeru.apiClient.instagram.LocationMediaBean;
import com.darakeru.apiClient.twitter.GeoTweetBean;
import com.darakeru.seichi.SeichiProperties;
import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.Placeinfo;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;
import com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet;

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "聖地情報を登録・表示", urlPatterns = { "/place", "/place/*" })
public class PlaceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();
    private Date apiFetchDate;

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
                if (thisPlace == null) {
                    errorCode = 404;
                    errorStr = "指定された場所IDの場所が存在しません";
                } else {
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
            Date now = new Date();
            //APIから情報を取得（APIの制限にかかった時はここでなんとかやりくりしてください>未来の自分）
            ServletContext application = getServletContext();
            if (conf.isApiLimit()) {
                if (application.getAttribute("instagram_" + String.valueOf(thisPlace.getPlaceid())) == null
                        || (now.getTime() - apiFetchDate.getTime()) > conf.getApiInterval()) {
                    application.setAttribute("instagram_" + String.valueOf(thisPlace.getPlaceid()),
                            new LocationMediaBean(thisPlace.getInstagramid()));
                }
                if (application.getAttribute("foursquare_" + String.valueOf(thisPlace.getPlaceid())) == null
                        || (now.getTime() - apiFetchDate.getTime()) > conf.getApiInterval()) {
                    application.setAttribute("foursquare_" + String.valueOf(thisPlace.getPlaceid()), new VenueBean(
                            thisPlace.getFoursquareid()));
                }
                if (application.getAttribute("twitter_" + String.valueOf(thisPlace.getPlaceid())) == null
                        || (now.getTime() - apiFetchDate.getTime()) > conf.getApiInterval()) {
                    application.setAttribute("twitter_" + String.valueOf(thisPlace.getPlaceid()), new GeoTweetBean(
                            thisPlace.getLat(), thisPlace.getLng()));
                }
                apiFetchDate = new Date();
            } else {
                application.setAttribute("instagram_" + String.valueOf(thisPlace.getPlaceid()), new LocationMediaBean(
                        thisPlace.getInstagramid()));
                application.setAttribute("foursquare_" + String.valueOf(thisPlace.getPlaceid()), new VenueBean(
                        thisPlace.getFoursquareid()));
                application.setAttribute("twitter_" + String.valueOf(thisPlace.getPlaceid()), new GeoTweetBean(
                        thisPlace.getLat(), thisPlace.getLng()));
            }
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
        String redirectURL = conf.getUrlRoot();
        try {
            //リファラーチェック＆CAPTCHAチェック
            if (request.getHeader("Referer")==null || !request.getHeader("Referer").equals(conf.getUrlRoot() + "confirmplaceadd")) {
                errorCode = 403;
                errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            } else if (!SimpleImageCaptchaServlet.validateResponse(request, request.getParameter("jcaptcha"))){
                errorCode = 403;
                errorStr = "CAPTHCAが入力されていない、もしくは間違って入力されました。";
            } else{
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
                String[] workidStrArray = request.getParameterValues("workid");
                int[] workidArray = new int[workidStrArray.length];
                for(int i=0; i < workidStrArray.length; i++){
                    workidArray[i] = Integer.parseInt(workidStrArray[i]);
                }
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
                EntityManager em = emf.createEntityManager();
                try {
                    em.getTransaction().begin();
                    em.persist(thisPlace);
                    thisPlaceinfo.setPlaceid(thisPlace.getPlaceid());
                    em.persist(thisPlaceinfo);
                    //workidは複数あるのでforループ
                    for(int workid : workidArray){
                        Placework thisPlacework = new Placework();
                        thisPlacework.setPlace(thisPlace);
                        thisPlacework.setWork(em.find(Work.class, workid));
                        em.persist(thisPlacework);
                    }
                    em.getTransaction().commit();
                    redirectURL = conf.getUrlRoot() + "place/" + thisPlace.getPlaceid();
                } catch (Exception e) {
                    e.printStackTrace();
                    errorCode = 500;
                    errorStr = "データベースからのデータ取得時にエラーが発生しました";
                } finally {
                    em.close();
                    emf.close();
                }
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
