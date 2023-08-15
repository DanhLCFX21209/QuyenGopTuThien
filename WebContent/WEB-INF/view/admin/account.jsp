<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/admin1/assets/css/styles.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/admin1/assets/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

  <script src="${pageContext.request.contextPath}/resources/admin1/assets/js/datatables-simple-demo.js"></script>

  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
            class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

    </form>
    <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/admin/logout" role="button" ><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                </ul>
            </li>
        </ul>
</nav>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <div th:fragment="html_menu" id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
              <div class="nav">
                  <a class="nav-link" href="account">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý người dùng
                  </a>
                  <a class="nav-link" href="donation">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý đợt quyên góp
                  </a>
              </div>
          </div>

      </nav>
  </div>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Danh sách người dùng</h1>
        <div class="card mb-4">
          <div class="card-header">
            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                    data-bs-target="#exampleModalAdd">
              Thêm mới
            </button>

            <!-- Modal Add-->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form method="post" action="<c:url value='/user/saveUser'/>">
        <div class="row">
            <div class="col-6">
                <label for="addname" class="col-form-label">Name:</label>
                <input type="text" class="form-control" id="addname" name="fullName" value="${user.fullName}" required>
            </div>
            <div class="col-6">
                <label for="addcost" class="col-form-label">Email:</label>
                <input type="email" class="form-control" id="addcost" name="email" value="${user.email}" required>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <label for="addname" class="col-form-label">Số điện thoại:</label>
                <input type="number" class="form-control" id="addname" name="phoneNumber" value="${user.phoneNumber}" required>
            </div>
            <div class="col-6">
                <label for="addcost" class="col-form-label">Địa chỉ:</label>
                <input type="text" class="form-control" id="addcost" name="address" value="${user.address}" required>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <label for="addname" class="col-form-label">Tài khoản:</label>
                <input type="text" class="form-control" id="addname" name="userName" value="${user.userName}" required>
            </div>
            <div class="col-6">
                <label for="addcost" class="col-form-label">Mật khẩu:</label>
                <input type="password" class="form-control" id="addcost" name="password" value="${user.password}" required>
            </div>
        <div class="col-6">
            <label for="ct_id" class="col-form-label">Vai trò:</label>
            <select class="form-control" id="ct_id" name="idRole" required>
                <option value="2" label="User"></option>
                <option value="1" label="Admin"></option>
            </select>   
        </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            <button type="submit" class="btn btn-primary">Thêm</button>
        </div>
    </form>
                  </div>

                </div>
              </div>
            </div>
            <!-- Modal Add-->
          </div>
          <div class="card-body">
            <table id="datatablesSimple">
              <thead>
              <tr style="background-color: gray !important;">
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
<!--                <th>Địa chỉ</th>-->
                <th>Tài khoản</th>
                <th>Vai trò</th>
                <th >Trạng thái</th>
                <th >Hành động</th>
              </tr>
             
              </thead>
              <!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${users}">
					<tr>
						<td> ${tempCustomer.fullName} </td>
						<td> ${tempCustomer.email} </td>
						<td> ${tempCustomer.phoneNumber} </td>
						<td> ${tempCustomer.userName} </td>
						<td> ${tempCustomer.role.roleName}</td>
						<td>
							<c:if test="${tempCustomer.status == 1 }">
								<span style="color: #1c7430; font-weight: bold">Hoạt động</span>
							</c:if>
                			<c:if test="${tempCustomer.status == 0 }">
								<span style="color: red; font-weight: bold">Đã khóa</span>
							</c:if>
            			</td>
            			<td style="width : 270px">
					<button type="button" style="width: 80px" class="btn btn-success" data-bs-toggle="modal"
                            data-bs-target="'#idModelMail'+${user.id}">
                      Gửi
                    </button>
                    <button type="button" style="width: 80px" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal-${tempCustomer.id}">
                      Sửa
                    </button>
                    <button type="button" style="width: 80px" class="btn btn-warning" data-bs-toggle="modal"
                            data-bs-target="'#idModelDetail'+${tempCustomer.id}">
                      Chi tiết
                    </button>
                    <button type="button" style="width: 80px" class="btn btn-danger mt-1" data-bs-toggle="modal"
                            data-bs-target="#idModelDel-${tempCustomer.id}" >
                      Xóa
                    </button>
<c:choose>
  <c:when test="${tempCustomer.status == 1}">
    <form action="<c:url value='/user/lock'/>" method="post">
      <input type="hidden" class="form-control" id="id" name="idUser" value="${tempCustomer.id}" />
      <button type="submit" style="width: 80px" class="btn btn-danger">
        Khóa
      </button>
    </form>
  </c:when>
  <c:when test="${tempCustomer.status == 0}">
    <form action="<c:url value='/user/un-lock'/>" method="post">
      <input type="hidden" class="form-control" id="id" name="idUser" value="${tempCustomer.id}" />
      <button type="submit" style="width: 80px" class="btn btn-success">
        Mở
      </button>
    </form>
  </c:when>
</c:choose>
                    </form>
<div class="modal fade" id="idModelDel-${tempCustomer.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Người dùng: <span><c:out value="${tempCustomer.fullName}" /></span>
        <form action="<c:url value='/user/delete' />" method="post">
          <input type="hidden" class="form-control" name="userId" value="${tempCustomer.id}" />
          <div class="modal-footer" style="margin-top: 20px">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-danger">Xóa</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
                    <div class="modal fade" th:id="'idModelMail' + ${tempCustomer.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Gửi đến: <span th:text="${tempCustomer.email}"></span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form th:action="@{/ql-user/send-mail}" method="post">
                              <input type="hidden" class="form-control" id="id" name="idUser" th:value="${tempCustomer.id}">
                              <label for="addname"
                                     class="col-form-label">Nội dung:</label>
                              <textarea rows="10"  class="form-control"
                                        id="addname" name="note" ></textarea>
                              <div class="modal-footer" style="margin-top: 20px">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                  Đóng
                                </button>
                                <button type="submit" class="btn btn-success">Gửi</button>

                              </div>
                            </form>

                          </div>

                        </div>
                      </div>
                    </div>
                    <div class="modal fade" th:id="'idModelDetail' + ${tempCustomer.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Chi tiết : <span th:text="${tempCustomer.fullName}"></span></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <div class="col-6"> <h5>Họ tên :</h5> <p th:text="${tempCustomer.fullName}" ></p>
                                <h5>Email:</h5> <p th:text="${tempCustomer.email}" ></p>
                                <h5>Số điện thoại:</h5> <p th:text="${tempCustomer.phoneNumber}" ></p>
                                <h5>Tài khoản:</h5> <p th:text="${tempCustomer.userName}" ></p></div>
                              <div class="col-6">   <h5>Địa chỉ :</h5> <p th:text="${user.address}" ></p>
                                <h5>Vai trò:</h5> <p th:text="${user.role.roleName}" ></p>
                                <h5>Lần đăng nhập gần nhất:</h5> <p th:text="${user.createdAt}" ></p>
                                <h5>Note:</h5> <p th:text="${user.note}" ></p></div>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </td>
				</tr>
				<!-- Modal Update-->
                <div class="modal fade" id="exampleModal-${tempCustomer.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form  method="post" action="<c:url value='/user/update'/>" ">
                          <input type="hidden" class="form-control" name="userId" value="${tempCustomer.id}" />
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Họ và tên:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="fullName" value="${tempCustomer.fullName }" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Email:</label>
                              <input readonly type="email" class="form-control"
                                     id="addcost" name="email" value="${tempCustomer.email }" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control"
                                     id="addname" name="phoneNumber" value="${tempCustomer.phoneNumber }" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Địa chỉ:</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="address" value="${tempCustomer.address }" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Tài khoản:</label>
                              <input readonly type="text" class="form-control"
                                     id="addname" name="userName" value="${tempCustomer.userName }" required>
                              <input readonly type="hidden" class="form-control"
                                     id="addname" name="idUser" required>
                              <input readonly type="hidden" class="form-control"
                                     id="addname" name="password" required>
                              <input readonly type="hidden" class="form-control"
                                     id="addname" name="status" required>
                            </div>

        <div class="col-6">
            <label for="ct_id" class="col-form-label">Vai trò:</label>
            <select class="form-control" id="ct_id" name="idRole" required>
                <option value="2" label="User"></option>
                <option value="1" label="Admin"></option>
            </select>   
        </div>
                          </div>
                          
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                          </div>
                        </form>
                      </div>

                    </div>
                  </div>
                </div>
				</c:forEach>

            </table>
          </div>
        </div>
      </div>

    </main>

    <script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
    <script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
</div>

<script src="js/JQuery3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>

</html>