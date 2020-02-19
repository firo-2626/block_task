package controllers.items;

import java.io.IOException;
import java.sql.Timestamp;
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
import models.validators.TaskValidator;

/**
 * Servlet implementation class ItemsCreateServlet
 */
@WebServlet("/items/create")
public class ItemsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // EM召喚
        EntityManager em = DBUtil.createEntityManager();


        Item i = new Item();

        // i.setPeriod(Integer.parseInt(request.getParameter("period")));
        i.setImportance(Integer.parseInt(request.getParameter("importance")));
        i.setTask(request.getParameter("task"));
        i.setAction(request.getParameter("action"));
        i.setItem(request.getParameter("item"));
        i.setContent(request.getParameter("content"));


        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        i.setCreated_at(currentTime);
        i.setUpdated_at(currentTime);
        i.setDelete_flag(0);

        List<String> errors = TaskValidator.validate(i, true);
        if(errors.size() > 0) {
            em.close();

            request.setAttribute("Item", i);
            request.setAttribute("errors", errors);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/items/new.jsp");
            rd.forward(request, response);
        } else {
            em.getTransaction().begin();
            em.persist(i);
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "登録が完了しました。");

            response.sendRedirect(request.getContextPath() + "/items/index");
        }
    }

}
