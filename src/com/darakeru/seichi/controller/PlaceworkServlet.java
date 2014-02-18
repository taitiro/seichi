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

import com.darakeru.seichi.SeichiProperties;
import com.darakeru.seichi.model.Place;
import com.darakeru.seichi.model.PlaceListBean;
import com.darakeru.seichi.model.Placework;
import com.darakeru.seichi.model.Work;
import com.darakeru.seichi.model.WorkListBean;
import com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet;

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "聖地・作品の関連付けを追加", urlPatterns = { "/placework" })
public class PlaceworkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();
    private int errorCode;
    private String errorStr;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceworkServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        errorCode = 200;
        errorStr = "";
        try {
            if (request.getHeader("Referer") == null
                    || (!request.getHeader("Referer").startsWith(conf.getUrlRoot() + "confirmworkedit/")
                            && !request.getHeader("Referer").startsWith(conf.getUrlRoot() + "confirmplaceedit/")
                            && !request.getHeader("Referer").startsWith(conf.getUrlRoot() + "place/") 
                            && !request.getHeader("Referer").startsWith(conf.getUrlRoot() + "work/"))) {
                errorCode = 403;
                errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            } else if (request.getParameter("workid") == null && request.getParameter("placeid") == null) {
                errorCode = 404;
                errorStr = "作品ID・聖地IDのどちらかを数字で指定してください";
            } else {
                if (request.getParameter("placeid") != null) {
                    request.setAttribute("placeid", Integer.parseInt(request.getParameter("placeid")));
                } else {
                    request.setAttribute("workid", Integer.parseInt(request.getParameter("workid")));
                }
                if (getServletContext().getAttribute("workList") == null) {
                    getServletContext().setAttribute("workList", new WorkListBean());
                }
                if (getServletContext().getAttribute("placeList") == null) {
                    getServletContext().setAttribute("placeList", new PlaceListBean());
                }
            }
        } catch (NumberFormatException e) {
            errorCode = 404;
            errorStr = "作品ID・聖地IDは数字で指定してください";
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            request.getRequestDispatcher("/jsp/placeworkView.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String redirectURL = conf.getUrlRoot();
        errorCode = 200;
        errorStr = "";
        try {
            if (request.getHeader("Referer") == null
                    || !request.getHeader("Referer").startsWith(conf.getUrlRoot() + "placework")) {
                errorCode = 403;
                errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            } else if(!SimpleImageCaptchaServlet.validateResponse(request, request.getParameter("jcaptcha"))){
                errorCode = 403;
                errorStr = "CAPTCHAが入力されていない、もしくは間違って入力されました。";
            }else {
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
                EntityManager em = emf.createEntityManager();
                int placeid = Integer.parseInt(request.getParameter("placeid"));
                int workid = Integer.parseInt(request.getParameter("workid"));
                try {
                    em.getTransaction().begin();
                    Place thisPlace = (Place) em.find(Place.class, placeid);
                    Work thisWork = (Work) em.find(Work.class, workid);
                    if (thisPlace == null || thisWork == null) {
                        errorCode = 404;
                        errorStr = "指定されたIDの場所・聖地が存在しません";
                    } else {
                        Placework thisPlacework = new Placework();
                        thisPlacework.setPlace(thisPlace);
                        thisPlacework.setWork(thisWork);
                        em.persist(thisPlacework);
                        redirectURL = conf.getUrlRoot() + "place/" + placeid;
                    }
                    em.getTransaction().commit();
                } catch (Exception e) {
                    e.printStackTrace();
                    errorCode = 500;
                    errorStr = "データベースへのアクセス時にエラーが発生しました";
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