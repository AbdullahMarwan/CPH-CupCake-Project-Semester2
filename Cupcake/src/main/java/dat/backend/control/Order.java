package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.ShoppingCart;
import dat.backend.model.entities.User;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.CupcakeFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Order", value = "/order")
public class Order extends HttpServlet {
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart sCart = (ShoppingCart) session.getAttribute("sCart");
        User user = (User) session.getAttribute("user");

        // Create order + get orderId
        int orderId = CupcakeFacade.createOrder(user, connectionPool);

        // Create orderlines with the orderId
        CupcakeFacade.insertOrderLines(orderId, sCart, connectionPool);

        // Empty ShoppingCart
        sCart.resetCart();
        session.setAttribute("sCart", sCart);

        // Return to Confirmation Page
        request.getRequestDispatcher("WEB-INF/confirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
