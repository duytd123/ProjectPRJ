<%-- 
    Document   : ManagerProduct
    Created on : Mar 08, 2024, 06:04:14 PM
    Author     : badao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> CRUD Data Table </title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/detail.css"/>
        <style>

            .navbar-dark.bg-dark {
                background-color: #343a40 !important;
            }

            .navbar-brand, .nav-link {
                font-size: 2.0rem;
                font-weight: 500;
            }

            .navbar-toggler {
                font-size: 2.0rem;
                border: none;
            }

            .navbar-toggler-icon {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23FFF' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.5)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
            }

            .form-control {
                font-size: 1.5rem;
            }

            .btn {
                font-size: 1.5rem;
            }

            .badge {
                font-size: 1.5rem;
            }
            .table .table-striped .table-hover {
                width: 100%;
                max-width: 100%;
            }

            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }


            .table img {
                width: 120px;
                height: auto;
                border-radius: 5px;
            }


            .table .edit, .table .delete {
                font-size: 2.0rem;
                margin: 0 5px;
            }
            .table .thead-dark th {
                font-size: 1.1rem;
            }

            .table td, .table th {
                padding: .75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .table td {
                font-size: 1.5rem;
            }


            .table td.product-name, .table td.product-price {
                font-weight: bold;
                font-size: 1.5rem;
            }

            .table td.product-actions {
                font-size: 1.5rem;
            }

        </style>

    </head>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="home">Samsung Store</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                <ul class="navbar-nav m-auto">
                    <c:if test="${sessionScope.account.getRole()== 2}">
                        <li class="nav-item">
                            <a class="nav-link" href="adminaccount">Manager Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manager">Manager Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="crudcategory">Manager Categories</a>
                        </li>
                    </c:if>
                        
                    <c:if test="${sessionScope.account.getRole()== 0}">
                        <li class="nav-item">
                            <a class="nav-link" href="adminaccount">View Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manager">Manager Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="crudcategory">Manager Categories</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="account?name=${sessionScope.account.getUsername()}">Hello ${sessionScope.account.getUsername()}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login?lg=2">Logout</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login?lg=1">Login</a>
                        </li>
                    </c:if>
                </ul>

                <form action="search" method="post" class="form-inline my-2 my-lg-0">
                    <div class="input-group input-group-sm">
                        <input name="usersearch" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                        <div class="input-group-append">
                            <button type="submit" value="Search" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <a class="btn btn-success btn-sm ml-3" href="Cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light">${sessionScope.size}</span>
                    </a>
                </form>
            </div>
        </div>
    </nav>
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Samsung Store</h1>
            <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 5 năm cung cấp các sản phầm điện tử </p>
        </div>
    </section>
    <!--end of menu-->

    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        </div>
                    </div>
                </div>
                <h4 style="color: red">${requestScope.exist}</h4>
                <c:if test="${requestScope.success} != null">
                    <h4 style="color: greenyellow">${requestScope.success}</h4>
                </c:if>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.product}" var="p">
                            <tr>
                                <td>${p.getProductID()}</td>
                                <td>${p.getProductName()}</td>
                                <td>
                                    <img src="${p.getImageURL()}">
                                </td>
                                <td>${p.getPrice()} $</td>
                                <td>
                                    <a href="editproduct?edit=${p.getProductID()}"  class="edit" ><i class="material-icons"  title="Edit">&#xE254;</i></a>
                                    <a href="control?delete=${p.getProductID()}" class="delete" data-toggle="modal" onclick="confirmDelete(${p.getProductID()})">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>1</b> out of <b>${requestScope.endpage}</b> entries</div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.endpage}" var="i">
                            <li class="page-item"><a href="manager?index=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="manager" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="number" class="form-control" min="1" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${requestScope.datac}" var="o">
                                        <option value="${o.getCategoryID()}">${o.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
            <script src="js/manager.js" type="text/javascript"></script><script src="js/manager.js" type="text/javascript"></script>
            <script>
                                        function confirmDelete(productId) {
                                            var confirmation = confirm("Do you want to delete the product?");
                                            if (confirmation) {
                                                window.location.href = "control?delete=" + productId;
                                            } else {
                                                console.log("Deletion canceled");
                                            }
                                        }
            </script>
    </body>
</html>