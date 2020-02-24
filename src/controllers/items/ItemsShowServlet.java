package controllers.items;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtill.DBUtil;
import models.Item;

/**
 * Servlet implementation class ItemsShowServlet
 */
@WebServlet("/items/show")
public class ItemsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // EM召喚
        EntityManager em = DBUtil.createEntityManager();

        // データオフセット
        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException i) { }
        List<Item> items = em.createNamedQuery("getAllItems", Item.class)
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        // カウント数の取得
        long items_count = (long)em.createNamedQuery("getItemsCount", Long.class)
                .getSingleResult();

        em.close();

        // ファイルの書き出し指示
        request.setAttribute("items", items);
        request.setAttribute("items_count", items_count);
        request.setAttribute("page", page);

        // show.jspへ投げる
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/items/show.jsp");
        rd.forward(request, response);
    }

}
