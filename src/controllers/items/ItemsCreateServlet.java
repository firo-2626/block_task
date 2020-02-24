package controllers.items;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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


        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        i.setCreated_at(currentTime);
        i.setUpdated_at(currentTime);

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

    private OffsetDateTime OffsetDateTime(LocalDateTime date) {
        // TODO 自動生成されたメソッド・スタブ
        return null;
    }

}
