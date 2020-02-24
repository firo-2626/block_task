package controllers.items;

import java.io.IOException;
import java.sql.Timestamp;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtill.DBUtil;
import models.Item;

/**
 * Servlet implementation class ItemsDestroyServlet
 */
@WebServlet("/items/destroy")
public class ItemsDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // EM召喚
        EntityManager em = DBUtil.createEntityManager();

        // idをキーにして取得してくる
        Item i = em.find(Item.class, Integer.parseInt(request.getParameter("id")));

        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        // EMがデータベースにコミット
        em.getTransaction().begin();
        em.remove(i);       // データ削除
        em.getTransaction().commit();
        em.close();

        // flush 削除完了
        request.getSession().setAttribute("flush", "削除が完了しました。");

        // indexへ提供
        response.sendRedirect(request.getContextPath() + "/items/index");
    }

}
