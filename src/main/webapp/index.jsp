<%-- 
    Document   : index
    Created on : Aug 20, 2022, 1:29:58 AM
    Author     : Anandha Narayanan Balu
--%>

<%@page import="com.mycompany.computerstore.helper.Helper"%>
<%@page import="com.mycompany.computerstore.entities.Category"%>
<%@page import="com.mycompany.computerstore.dao.CategoryDao"%>
<%@page import="com.mycompany.computerstore.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.computerstore.dao.ProductDao"%>
<%@page import="com.mycompany.computerstore.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Store | Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <% String cat = request.getParameter("category");
                    //out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();

                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>



                <!--show categories-->
                <div class="col-md-2">


                    <div class="list-group mt-4" id="list-tab" role="tablist">
                        <%
//                            out.println(request.getParameter("category").equals("all") );
                        %>
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action <%= request.getParameter("category") == null || request.getParameter("category").equals("all") ? "active" : "" %>">
                            All Products
                        </a>




                        <% for (Category c : clist) {
                        %>



                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action <%= String.valueOf(c.getCategoryId()).equals(request.getParameter("category")) ? "active" : "" %>"><%= c.getCategoryTitle()%></a>


                        <%  
                            }
                        %>



                    </div>


                </div>

                <!--show products-->
                <div class="col-md-10">


                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products-->

                                <%
                                    for (Product p : list) {

                                %>


                                <!--product card-->
                                <div class="card product-card">

                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto; " class="card-img-top m-2" alt="...">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>

                                        </p>

                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn  btn-outline-success ">  &#163; <%= p.getPriceAfterApplyingDiscount()%>/-  <span class="text-secondary discount-label">  &#163; <%= p.getpPrice()%> , <%= p.getpDiscount()%>% off </span>  </button>
                                    </div>



                                </div>






                                <%}

                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }


                                %>


                            </div>                     



                        </div>                   

                    </div>



                </div>

            </div>
        </div>



        <%@include  file="components/common_modals.jsp" %>
    </body>
</html>
