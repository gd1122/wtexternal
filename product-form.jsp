<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.company.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Configuration & Entry Form</title>
    <meta name="description" content="Add or update individual product metrics, descriptions, category labels, and price structures.">
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
            <h1 id="form-main-title" class="m-0 mt-2"><i class="fa-solid fa-boxes-stacked me-2"></i>Product Catalog & Inventory Engine</h1>
        </div>
    </header>

    <main class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-9">
                <div class="premium-card" id="form-card-container">
                    <div class="text-center mb-4">
                        <%
                            Product product = (Product) request.getAttribute("product");
                            if (product != null) {
                        %>
                            <h3 class="fw-bold text-white" id="form-heading"><i class="fa-solid fa-pen-fancy me-2" style="color: #f59e0b;"></i>Modify Record Profile</h3>
                        <% } else { %>
                            <h3 class="fw-bold text-white" id="form-heading"><i class="fa-solid fa-square-plus me-2" style="color: #10b981;"></i>Register New Product</h3>
                        <% } %>
                    </div>

                    <% if (product != null) { %>
                        <form action="update" method="post" id="product-entry-form">
                            <input type="hidden" name="id" id="input-product-id" value="<%= product.getId() %>" />
                    <% } else { %>
                        <form action="insert" method="post" id="product-entry-form">
                    <% } %>

                        <div class="mb-3">
                            <label for="input-product-name" class="form-label-custom"><i class="fa-solid fa-tag me-2" style="color: #818cf8;"></i>Product Title</label>
                            <input type="text" id="input-product-name" value="<%= product != null ? product.getName() : "" %>" class="form-control form-control-custom" name="name" placeholder="e.g. Ultra HD Smart TV" required autocomplete="off">
                        </div>

                        <div class="mb-3">
                            <label for="input-product-desc" class="form-label-custom"><i class="fa-solid fa-align-left me-2" style="color: #818cf8;"></i>Detailed Description</label>
                            <input type="text" id="input-product-desc" value="<%= product != null ? product.getDescription() : "" %>" class="form-control form-control-custom" name="description" placeholder="Highlights, dimensions, key specs..." required autocomplete="off">
                        </div>

                        <div class="mb-3">
                            <label for="input-product-cat" class="form-label-custom"><i class="fa-solid fa-layer-group me-2" style="color: #818cf8;"></i>Classification Category</label>
                            <input type="text" id="input-product-cat" value="<%= product != null ? product.getCategory() : "" %>" class="form-control form-control-custom" name="category" placeholder="Electronics, Furniture, Audio..." required autocomplete="off">
                        </div>
                        
                        <div class="mb-4">
                            <label for="input-product-price" class="form-label-custom"><i class="fa-solid fa-wallet me-2" style="color: #818cf8;"></i>Unit Price ($)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-dark border-secondary text-success fw-bold">$</span>
                                <input type="number" id="input-product-price" step="0.01" min="0" value="<%= product != null ? product.getPrice() : "" %>" class="form-control form-control-custom" name="price" placeholder="0.00" required autocomplete="off">
                            </div>
                        </div>

                        <div class="d-flex gap-3 mt-4">
                            <button type="submit" id="save-product-btn" class="btn btn-gradient-primary flex-grow-1"><i class="fa-solid fa-check me-2"></i>Persist Configuration</button>
                            <a href="list" id="cancel-btn" class="btn btn-outline-secondary px-4 d-flex align-items-center justify-content-center"><i class="fa-solid fa-xmark me-1"></i> Cancel</a>
                        </div>
                    </form>
                </div>
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
