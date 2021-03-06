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

/**
 * Servlet implementation class WorkServlet
 */
@WebServlet(description = "作品情報を登録・表示", urlPatterns = { "/confirmplaceedit/*" })
public class ConfirmPlaceeditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();
    private int errorCode;
    private String errorStr;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmPlaceeditServlet() {
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
        if (!request.getHeader("Referer").startsWith(conf.getUrlRoot() + "place/") ) {
            errorCode = 403;
            errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
        } else {
            try {
                Place thisPlace = null;
                id = Integer.parseInt(request.getPathInfo().substring(1));
                EntityManagerFactory emf = Persistence
                        .createEntityManagerFactory("Seichi");
                EntityManager em = emf.createEntityManager();
                try {
                    thisPlace = (Place) em.find(Place.class, id);
                    if (thisPlace == null) {
                        errorCode = 404;
                        errorStr = "指定された場所IDの作品が存在しません";
                    } else {
                        request.setAttribute("thisPlace", thisPlace);
                    }
                } catch (Exception e) {
                    /*
                     * StringWriter sw = new StringWriter(); PrintWriter pw =
                     * new PrintWriter(sw); e.printStackTrace(pw); pw.flush();
                     * String str = sw.toString();
                     */
                    errorCode = 500;
                    errorStr = "データベースからのデータ取得時にエラーが発生しました ";
                } finally {
                    em.close();
                    emf.close();
                }
            } catch (NumberFormatException e) {
                errorCode = 404;
                errorStr = "場所IDは数字で指定してください";
            } catch (Exception e) {
                e.printStackTrace();
                errorCode = 500;
                errorStr = "サーバー内部の不明なエラーです";
            }
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            request.getRequestDispatcher("/jsp/confirmplaceeditView.jsp")
                    .forward(request, response);
        }
    }
}
