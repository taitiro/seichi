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

import com.darakeru.seichi.SeichiProperties;
import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.PlaceJsonBean;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;
import com.darakeru.seichi.model.WorkListBean;
import com.darakeru.seichi.model.Workinfo;
import com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet;

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "作品情報を登録・表示", urlPatterns = { "/work", "/work/*" })
public class WorkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();
    private int errorCode;
    private String errorStr;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        errorCode = 200;
        errorStr = "";
        try {
            Work thisWork = null;
            List<Place> placeList = new ArrayList<Place>();
            PlaceJsonBean thisJson = new PlaceJsonBean();
            id = Integer.parseInt(request.getPathInfo().substring(1));
            EntityManagerFactory emf = Persistence
                    .createEntityManagerFactory("Seichi");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                thisWork = (Work) em.find(Work.class, id);
                if (thisWork == null) {
                    errorCode = 404;
                    errorStr = "指定された作品IDの作品が存在しません";
                } else {
                    thisWork.getWorkinfo().addAccessnum();
                    for (Placework onePlacework : thisWork.getPlaceworks()) {
                        placeList.add(onePlacework.getPlace());
                    }
                    thisJson.setPlaceList(placeList);
                    request.setAttribute("thisWork", thisWork);
                    request.setAttribute("thisJson", thisJson);
                }
                em.getTransaction().commit();
            } catch (Exception e) {
                /*
                 * StringWriter sw = new StringWriter(); PrintWriter pw = new
                 * PrintWriter(sw); e.printStackTrace(pw); pw.flush(); String
                 * str = sw.toString();
                 */
                errorCode = 500;
                errorStr = "データベースからのデータ取得時にエラーが発生しました ";
            } finally {
                em.close();
                emf.close();
            }
        } catch (NumberFormatException e) {
            errorCode = 404;
            errorStr = "作品IDは数字で指定してください";
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            request.getRequestDispatcher("/jsp/workView.jsp").forward(request,
                    response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String redirectURL = conf.getUrlRoot();
        errorCode = 200;
        errorStr = "";
        try {
            if (request.getPathInfo() == null) {
                redirectURL = this.addWork(request);
            } else {
                redirectURL = this.editWork(request);
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

    private String addWork(HttpServletRequest request) {
        String redirectURL = conf.getUrlRoot();
        // リファラーチェック&CAPTCHAチェック
        if (request.getHeader("Referer") == null
                || !request.getHeader("Referer").equals(
                        conf.getUrlRoot() + "confirmworkadd")) {
            errorCode = 403;
            errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
        } else if (!SimpleImageCaptchaServlet.validateResponse(request,
                request.getParameter("jcaptcha"))) {
            errorCode = 403;
            errorStr = "CAPTHCAが入力されていない、もしくは間違って入力されました。";
        } else {
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
            thisWork.setUrl3(request.getParameter("url3"));
            thisWork.setUrlname3(request.getParameter("urlname3"));
            thisWork.setWikipedia(request.getParameter("wikipedia"));
            Workinfo thisWorkinfo = new Workinfo();
            EntityManagerFactory emf = Persistence
                    .createEntityManagerFactory("Seichi");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                em.persist(thisWork);
                thisWorkinfo.setWorkid(thisWork.getWorkid());
                em.persist(thisWorkinfo);
                em.getTransaction().commit();
                redirectURL = conf.getUrlRoot() + "work/"
                        + thisWork.getWorkid();
            } catch (Exception e) {
                e.printStackTrace();
                errorCode = 500;
                errorStr = "データベースからのデータ取得時にエラーが発生しました";
            } finally {
                em.close();
                emf.close();
            }
        }
        return redirectURL;
    }

    private String editWork(HttpServletRequest request) {
        String redirectURL = conf.getUrlRoot();
        try {
            // リファラーチェック&CAPTCHAチェック
            if (request.getHeader("Referer") == null
                    || !request.getHeader("Referer").startsWith(
                            conf.getUrlRoot() + "confirmworkedit")) {
                errorCode = 403;
                errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            } else if (!SimpleImageCaptchaServlet.validateResponse(request,
                    request.getParameter("jcaptcha"))) {
                errorCode = 403;
                errorStr = "CAPTHCAが入力されていない、もしくは間違って入力されました。";
            } else {
                Work thisWork = null;
                int id = Integer.parseInt(request.getPathInfo().substring(1));
                EntityManagerFactory emf = Persistence
                        .createEntityManagerFactory("Seichi");
                EntityManager em = emf.createEntityManager();
                thisWork = (Work) em.find(Work.class, id);
                if (thisWork == null) {
                    errorCode = 404;
                    errorStr = "指定された作品IDの作品が存在しません";
                } else {
                    if (request.getParameter("name") != null) {
                        thisWork.setName(request.getParameter("name"));
                    }
                    if (request.getParameter("workdesc") != null) {
                        thisWork.setWorkdesc(request.getParameter("workdesc"));
                    }
                    if (request.getParameter("img") != null) {
                        thisWork.setImg(request.getParameter("img"));
                    }
                    if (request.getParameter("productid1") != null) {
                        thisWork.setProductid1(request
                                .getParameter("productid1"));
                    }
                    if (request.getParameter("productid2") != null) {
                        thisWork.setProductid2(request
                                .getParameter("productid2"));
                    }
                    if (request.getParameter("productid3") != null) {
                        thisWork.setProductid3(request
                                .getParameter("productid3"));
                    }
                    if (request.getParameter("productid4") != null) {
                        thisWork.setProductid4(request
                                .getParameter("productid4"));
                    }
                    if (request.getParameter("productid5") != null) {
                        thisWork.setProductid5(request
                                .getParameter("productid5"));
                    }
                    if (request.getParameter("url1") != null
                            && request.getParameter("urlname1") != null) {
                        thisWork.setUrl1(request.getParameter("url1"));
                        thisWork.setUrlname1(request.getParameter("urlname1"));
                    }
                    if (request.getParameter("url2") != null
                            && request.getParameter("urlname2") != null) {
                        thisWork.setUrl2(request.getParameter("url2"));
                        thisWork.setUrlname2(request.getParameter("urlname2"));
                    }
                    if (request.getParameter("url3") != null
                            && request.getParameter("urlname3") != null) {
                        thisWork.setUrl3(request.getParameter("url3"));
                        thisWork.setUrlname3(request.getParameter("urlname3"));
                    }
                    if (request.getParameter("wikipedia") != null) {
                        thisWork.setWikipedia(request.getParameter("wikipedia"));
                    }
                    int[] placeidArray = null;
                    if (request.getParameter("placeid") != null) {
                        String[] placeidStrArray = request
                                .getParameterValues("placeid");
                        placeidArray = new int[placeidStrArray.length];
                        for (int i = 0; i < placeidStrArray.length; i++) {
                            placeidArray[i] = Integer
                                    .parseInt(placeidStrArray[i]);
                        }
                    }
                    try {
                        em.getTransaction().begin();
                        em.persist(thisWork);
                        // placeidは複数あるのでforループ
                        if (placeidArray != null) {
                            for (int placeid : placeidArray) {
                                Placework thisPlacework = new Placework();
                                thisPlacework.setWork(thisWork);
                                thisPlacework.setPlace(em.find(Place.class,
                                        placeid));
                                em.persist(thisPlacework);
                            }
                        }
                        em.getTransaction().commit();
                        getServletContext().setAttribute("workList", new WorkListBean());
                        redirectURL = conf.getUrlRoot() + "work/"
                                + thisWork.getWorkid();
                    } catch (Exception e) {
                        e.printStackTrace();
                        errorCode = 500;
                        errorStr = "データベースからのデータ取得時にエラーが発生しました";
                    } finally {
                        em.close();
                        emf.close();
                    }
                }
            }
        } catch (NumberFormatException e) {
            errorCode = 404;
            errorStr = "数字で指定しなければならないところが数字で指定されていません";
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        return redirectURL;
    }
}