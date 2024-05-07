<%-- 
    Document   : Home
    Created on : Mar 05, 2024, 07:20:30 PM
    Author     : badao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Samsung Store</title>
        <!-- Add Bootstrap CSS link here -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #fff;
                color:black;
                padding-top: 0px;
            }
            .card {
                margin-bottom: 10px;
                border: 1px solid #dee2e6;
                border-radius: 8px;
            }

            .breadcrumb {
                background: #007BFF;
                color: #fff;
                border-radius: 5px;
            }

            .breadcrumb-item + .breadcrumb-item::before {
                content: '>';
                color: #fff;
            }

            .show_txt {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .card-img-top {
                width: 100%;
                height: 10vw;
                object-fit: cover;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }

            .card-body {
                padding: 15px;
            }

            @media (max-width: 768px) {
                .card-img-top {
                    height: 20vw;
                }

                .col-md-3 {
                    max-width: 100%;
                    margin-bottom: 10px;
                }

                .card {
                    margin-bottom: 10px;
                }
            }

            .card-header-last-product {
                background-color: #007BFF;
                color: #fff;
            }
            .clearfix {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-top: 10px;
            }

            .hint-text {
                margin-right: 10px;
            }

            /* Added CSS for pagination */
            .pagination {
                justify-content: center;
                margin-top: 20px;
            }

            .pagination .page-link {
                color: #007BFF;
            }

            .pagination .page-item.active .page-link {
                background-color: #007BFF;
                border-color: #007BFF;
            }

            /* Added CSS for price filter form */
            .form-group {
                margin-bottom: 15px;
            }

            .btn-group {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <h1 style="color: greenyellow">${requestScope.success}</h1>

        <jsp:include page="Menu.jsp"></jsp:include>
        <h3 style="color: #007bff">${requestScope.notfound}</h3>
        <div class="container-fluid">
            <div class="row">
                <!-- Left Sidebar -->
                <div class="col-md-3">
                    <!-- Categories Card -->
                    <div class="card bg-light">
                        <div class="card-header bg-info text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${requestScope.categories}" var="o">
                                <li class="list-group-item text-white"><a href="categories?cid=${o.getCategoryID()}">${o.getCategoryName()}</a></li>
                                </c:forEach>
                        </ul>
                    </div>

                    <!-- Last Product Card -->
                    <div class="card bg-light mb-3">
                        <div class="card-header card-header-last-product text-uppercase">Best Seller Product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${requestScope.last.getImageURL()}" alt="Last Product image">
                            <h5 class="card-title">${requestScope.last.getProductName()}</h5>
                            <p class="card-text">${requestScope.last.getDescription()}</p>
                            <p class="bloc_left_price">${requestScope.last.getPrice()} $</p>
                        </div>
                    </div>

                    <!-- Price Filter Form -->
                    <div class="card bg-light">
                        <div class="card-header bg-info text-white text-uppercase"><i class="fa fa-filter"></i> Price Filter</div>
                        <div class="card-body">
                            <form action="control1" method="post">
                                <div class="form-group">
                                    <label for="minPrice">Min Price:</label>
                                    <input type="number" class="form-control" id="minPrice" name="minprice" placeholder="Enter min price">
                                </div>
                                <div class="form-group">
                                    <label for="maxPrice">Max Price:</label>
                                    <input type="number" class="form-control" id="maxPrice" name="maxprice" placeholder="Enter max price">
                                </div>
                                <button type="submit" class="btn btn-primary">Apply Filter</button>
                            </form>

                            <div class="form-group">
                                <label>Filter By Price:</label>
                                <div class="btn-group" role="group">
                                    <a href="control1" class="btn btn-info">Low To High Price</a>
                                    <a href="control2" class="btn btn-info">High To Low Price</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9">
                    <!-- Product Cards -->
                    <div class="row">
                        <c:forEach items="${requestScope.products}" var="o">
                            <div class="col-md-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.getImageURL()}" alt="Product image">
                                    <div class="card-body">
                                        <h5 class="card-title show_txt"><a title="View Product" href="detail?pname=${o.getProductName()}">${o.getProductName()}</a></h5>
                                        <p class="card-text show_txt">${o.getDescription()}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="text-danger font-weight-bold">${o.getPrice()}$</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix">
            <ul class="pagination">
                <c:forEach begin="1" end="${requestScope.endpage}" var="i">
                    <li class="page-item"><a href="home?index=${i}" class="page-link">${i}</a></li>
                    </c:forEach>
                    <c:forEach begin="1" end="${requestScope.endpage1}" var="o">
                    <li class="page-item"><a href="controlcid?index=${o}" class="page-link">${o}</a></li>
                    </c:forEach>
            </ul>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
