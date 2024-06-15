package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN_PAGE = "Login.jsp";
    private static final String HOME_PAGE = "HomePage.jsp";
    private static final String SHOP_PAGE = "Shop.jsp";
    private static final String RES_PAGE = "Register.jsp";
    private static final String UPDATEACC_PAGE = "UpdateAccount.jsp";
    private static final String CART_PAGE = "CartOrderDetail.jsp";
    private static final String THANK_PAGE = "thankyou.jsp";
    private static final String ACC_PAGE = "manageUser.jsp";
    private static final String INVOICE_PAGE = "viewInvoice.jsp";
    
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action") == null ? HOME_PAGE : request.getParameter("action");
            switch (action) {
                case "Login":
                    url = LOGIN_CONTROLLER;
                    break;
                case "Login_page":
                    url = LOGIN_PAGE;
                    break;
                case "Home_Page":
                    url = HOME_PAGE;
                    break;
                case "searchCategory":
                    url = "SearchCategoriesController";
                    break;
                case "viewShop":
                    url = SHOP_PAGE;
                    break;
                case "SearchPrice":
                    url = "SearchPriceController";
                    break;
                case "Register_page":
                    url = RES_PAGE;
                    break;
                case "Create":
                    url = "CreateController";
                    break;
                case "UpdateAccount_page":
                    url = UPDATEACC_PAGE;
                    break;
                case "UpdateAccount":
                    url = "UpdateUserController";
                    break;
                case LOGOUT:
                    url = LOGOUT_CONTROLLER;
                    break;
                case "addToCart": {
                    url = "addProductToCartController";
                    break;
                }
                case "RemoveFromCart": {
                    url = "removeCartController";
                    break;
                }
                case "thankYouPage": {
                    url = THANK_PAGE;
                    break;
                }
                case "viewCart": {
                    url = CART_PAGE;
                    break;
                }
                case "UpdateQuantity": {
                    url = "updateCartController";
                    break;
                }
                case "CreateInvoice": {
                    url = "createInvoiceController";
                    break;
                }
                case "updateProduct": {
                    url = "UpdateGlassesController";
                    break;
                }
                case "deleteGlasses": {
                    url = "deleteGlassesController";
                    break;
                }
                case "createGlasses": {
                    url = "addProductController";
                    break;
                }
                case "deleteAccount": {
                    url = "deleteAccountController";
                    break;
                }
                case "updateAccount": {
                    url = "updateAccountController";
                    break;
                }
                case "viewAccount": {
                    url = ACC_PAGE;
                    break;
                }
                case "viewInvoice": {
                    url = INVOICE_PAGE;
                    break;
                }
                case "searchAccount": {
                    url = "searchFullNameController";
                    break;
                }
                case "searchByUserId": {
                    url = "searchByUserIdController";
                    break;
                }
                default:
                    url = HOME_PAGE;
                    break;
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
            request.getRequestDispatcher(ERROR).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
