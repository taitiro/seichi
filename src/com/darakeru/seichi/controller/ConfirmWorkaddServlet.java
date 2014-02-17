package com.darakeru.seichi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darakeru.seichi.SeichiProperties;
import com.darakeru.seichi.model.ConfirmWorkBean;

/**
 * Servlet implementation class ConfirmPlaceaddServlet
 */
@WebServlet(description = "作品追加の確認", urlPatterns = { "/confirmworkadd" })
public class ConfirmWorkaddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SeichiProperties conf = new SeichiProperties();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmWorkaddServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        int errorCode = 200;
        String errorStr = "";
        try {
            // リファラーチェック
            if (request.getHeader("Referer").startsWith(conf.getUrlRoot() + "workadd.html")) {
                //セッションチェックを含んでおいてー
                ConfirmWorkBean thisWork = new ConfirmWorkBean();
                //絶対に必要な値
                thisWork.setName(request.getParameter("name"));
                if (thisWork.getName() == null || thisWork.getName().equals("")) {
                    errorCode = 400;
                    errorStr = "名前は必ず入力してください";
                } else {

                    if (request.getParameter("workdesc") != null && !request.getParameter("workdesc").equals("")) {
                        thisWork.setWorkdesc(request.getParameter("workdesc"));
                    } else {
                        thisWork.setWorkdesc("");
                    }
                    if (request.getParameter("img") != null && !request.getParameter("img").equals("")) {
                        thisWork.setImg(request.getParameter("img"));
                    } else {
                        thisWork.setImg("");
                    }
                    thisWork.setUrl();
                    thisWork.setProductid();
                    thisWork.setWikipedia();
                    request.setAttribute("thisWork", thisWork);
                }
            } else {
                errorCode = 403;
                errorStr = "不正なReferrer，もしくはReferrerが確認できませんでした．設定でReferrer送信を無効にしている場合は有効にしてください．";
            }
        } catch (NumberFormatException e) {
            errorCode = 400;
            errorStr = "数値を送信すべき箇所で数値ではない値もしくは空欄を送信しています";
        } catch (NullPointerException e) {
            response.sendRedirect(conf.getUrlRoot() + "error/inputError.html");
        } catch (Exception e) {
            e.printStackTrace();
            errorCode = 500;
            errorStr = "サーバー内部の不明なエラーです";
        }
        if (errorCode != 200) {
            response.sendError(errorCode, errorStr);
        } else {
            request.getRequestDispatcher("/jsp/confirmworkaddView.jsp").forward(request, response);
        }
    }
}
