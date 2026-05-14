<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.company.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Product Record Management System</title>
    <meta name="description" content="Manage inventory, categories, descriptions, and dynamic price configurations elegantly.">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for Premium Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom Premium Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
</head>
<body>
    <header class="app-header text-center">
        <div class="container d-flex flex-column align-items-center justify-content-center gap-2">
            <img src="C:/Users/CSE-E130-Sys17/Desktop/WT-EXTERNAL/img.jpeg" alt="VNRVJIET Logo" style="height: 55px; width: auto; object-fit: contain; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.25);">
            <h1 id="main-title" class="m-0 mt-2"><i class="fa-solid fa-boxes-stacked me-2"></i>Product Catalog & Inventory Engine</h1>
        </div>
    </header>

    <main class="container">
        <div class="premium-card" id="list-container">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                <h3 class="m-0 fw-bold text-white"><i class="fa-solid fa-list-check me-2" style="color: #818cf8;"></i>Managed Records</h3>
                <form action="<%=request.getContextPath()%>/search" method="get" class="d-flex" id="search-form" style="min-width: 320px;">
                    <div class="input-group">
                        <span class="input-group-text bg-dark border-secondary text-secondary"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input type="text" id="keyword-input" name="keyword" class="form-control form-control-custom" placeholder="Search product name, category, text..." value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : "" %>">
                        <button type="submit" id="search-btn" class="btn btn-gradient-primary">Search</button>
                    </div>
                    <% if (request.getAttribute("keyword") != null && !((String)request.getAttribute("keyword")).isEmpty()) { %>
                        <a href="<%=request.getContextPath()%>/list" id="reset-link" class="btn btn-outline-secondary ms-2 d-flex align-items-center"><i class="fa-solid fa-rotate-left"></i></a>
                    <% } %>
                </form>
                <a href="<%=request.getContextPath()%>/new" id="add-product-btn" class="btn btn-gradient-success"><i class="fa-solid fa-circle-plus me-2"></i>Add Product</a>
            </div>

            <div class="table-responsive">
                <table class="table-custom" id="products-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
                            if (listProduct != null && !listProduct.isEmpty()) {
                                for (Product product : listProduct) {
                        %>
                            <tr id="product-row-<%= product.getId() %>">
                                <td class="fw-bold text-secondary">#<%= product.getId() %></td>
                                <td class="fw-semibold text-white"><%= product.getName() %></td>
                                <td class="text-light opacity-75"><%= product.getDescription() %></td>
                                <td><span class="badge-category"><%= product.getCategory() %></span></td>
                                <td><span class="price-tag">$<%= String.format("%.2f", product.getPrice()) %></span></td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="edit?id=<%= product.getId() %>" id="edit-btn-<%= product.getId() %>" class="btn-custom-edit" title="Edit Product"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                                        <a href="delete?id=<%= product.getId() %>" id="delete-btn-<%= product.getId() %>" class="btn-custom-delete" title="Delete Product" onclick="return confirm('Are you sure you want to permanently discard this product?');"><i class="fa-solid fa-trash-can"></i> Delete</a>
                                    </div>
                                </td>
                            </tr>
                        <%
                                }
                            } else {
                        %>
                            <tr>
                                <td colspan="6" class="text-center py-4 text-secondary">
                                    <i class="fa-solid fa-folder-open fs-2 mb-2 d-block"></i>
                                    No products found corresponding to your criteria. Try resetting your search filters.
                                </td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <footer class="app-footer">
        <div class="container">
            <p class="m-0">&copy; Store Administration Engine. Powered by Vanilla CSS Glassmorphism & High Fidelity Visual Excellence.</p>
        </div>
    </footer>
</body>
</html>
