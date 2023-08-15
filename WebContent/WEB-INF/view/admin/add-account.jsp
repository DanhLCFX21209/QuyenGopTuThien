<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Customer</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
</head>

<body>
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
					<form method="post" enctype="multipart/form-data">
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Name:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="fullName" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Email:</label>
                          <input type="email" class="form-control"
                                 id="addcost" name="email" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Số điện thoại:</label>
                          <input type="number" class="form-control"
                                 id="addname" name="phoneNumber" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Địa chỉ:</label>
                          <input type="text" class="form-control"
                                 id="addcost" name="address" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tài khoản:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="userName" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Mật khẩu:</label>
                          <input type="password" class="form-control"
                                 id="addcost" name="password" required>
                        </div>
                        <div class="col-6">
                          <label for="ct_id" class="col-form-label">Vai trò:</label>
                          <select class="form-control" id="ct_id" name="idRole" required>
                            <option value="User" selected>Chọn loại vai trò</option>
                            <option value="Admin" selected>Chọn loại vai trò</option>
                          </select>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm </button>
                      </div>
                    </form>                 
                  </div>

                </div>
              </div>
            </div>


	

</body>

</html>










