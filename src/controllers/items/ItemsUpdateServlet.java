package controllers.items;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtill.DBUtil;
import models.Item;

/**
 * Servlet implementation class ItemsUpdateServlet
 */
@WebServlet("/items/update")
public class ItemsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // EM召喚
        EntityManager em = DBUtil.createEntityManager();

        Item i = em.find(Item.class, Integer.parseInt(request.getParameter("id")));

     // LocalDateTImeをStringにて date変数を生成
        LocalDateTime date = LocalDate.parse(request.getParameter("period"),
                DateTimeFormatter.ofPattern("uuuu-MM-dd"))
            .atTime(LocalTime.MIN);

        // LocalDateTime ⇒　instantへ変換
        Instant instant = date.toInstant(ZoneOffset.UTC);

        // instant ⇒　Date型へ変換
        Date date2 = Date.from(instant);


        i.setPeriod(date2);

        i.setImportance(Integer.parseInt(request.getParameter("importance")));
        i.setTask(request.getParameter("task"));
        i.setAction(request.getParameter("action"));
        i.setItem(request.getParameter("item"));
        i.setContent(request.getParameter("content"));
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        em.getTransaction().begin();
        em.getTransaction().commit();
        em.close();
        request.getSession().removeAttribute("id");
        request.getSession().setAttribute("flush", "更新が完了しました。");

        response.sendRedirect(request.getContextPath() + "/items/index");
    }
}
