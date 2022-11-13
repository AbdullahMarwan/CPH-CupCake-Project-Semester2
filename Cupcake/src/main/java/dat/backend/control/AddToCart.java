package dat.backend.control;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.Top;
import dat.backend.model.entities.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToCart", value = "/addtocart")
public class AddToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart sCart = (ShoppingCart) session.getAttribute("sCart");

        int topId = Integer.parseInt(request.getParameter("top"));
        int bottomId = Integer.parseInt(request.getParameter("bottom"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Top top = cupcakeFacade.getTopById(topId);
        Bottom bottom = cupcakeFacade.getTopById(bottomId);

        Cupcake cupcake = new Cupcake(top, bottom, quantity);

        //Save in Database via Facade method

        sCart.addToCart(cupcake);
        session.setAttribute("sCart", sCart);
        request.setAttribute("sCartSize", sCart.getNumberOfCupcakes());

        request.getRequestDispatcher("WEB-INF/shop.jsp").forward(request, response);
    }

}
