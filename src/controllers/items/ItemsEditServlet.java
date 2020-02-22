package controllers.items;

import java.io.IOException;

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
 * Servlet implementation class ItemsEditServlet
 */
@WebServlet("/items/edit")
public class ItemsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Item i = em.find(Item.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("item", i);

        request.getSession().setAttribute("task_id", i.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/items/edit.jsp");
        rd.forward(request, response);
    }

}
