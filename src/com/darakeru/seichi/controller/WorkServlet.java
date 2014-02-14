package com.darakeru.seichi.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.darakeru.seichi.model.Workinfo;

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "作品情報を登録・表示", urlPatterns = { "/work/*" })
public class WorkServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();

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
        int errorCode = 200;
        String errorStr = "";
        try {
            Work thisWork = null;
            List<Place> placeList = new ArrayList<Place>();
            PlaceJsonBean thisJson = new PlaceJsonBean();
            id = Integer.parseInt(request.getPathInfo().substring(1));
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                thisWork = (Work) em.find(Work.class, id);
                if(thisWork == null){
                    errorCode = 404;
                    errorStr = "指定された作品IDの作品が存在しません";
                }else{
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
                errorCode = 500;
                errorStr = "データベースからのデータ取得時にエラーが発生しました : " + e.getMessage();
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
            request.getRequestDispatcher("/jsp/workView.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String redirectURL = "";
        int errorCode = 200;
        String errorStr = "";
        try {
            //リファラーチェック
            if (request.getHeader("Referer").equals(conf.getUrlRoot() + "confirmworkadd") 
                    || request.getHeader("Referer").startsWith("http://localhost:8080/seichi/import/work-custom.php")) {
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
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("Seichi");
                EntityManager em = emf.createEntityManager();
                try {
                    em.getTransaction().begin();
                    em.persist(thisWork);
                    thisWorkinfo.setWorkid(thisWork.getWorkid());
                    em.persist(thisWorkinfo);
                    em.getTransaction().commit();
                    redirectURL = conf.getUrlRoot() + "work/" + thisWork.getWorkid();
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
