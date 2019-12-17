<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Đăng nhập</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="login-form">
          <p id="loginError" class="text-danger"></p>
		  <div class="form-group">
		    <label for="loginEmail">Email address</label>
		    <input type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="loginPassword">Password</label>
		    <input type="password" class="form-control" id="loginPassword" placeholder="Mật khẩu">
		  </div>
		  <hr>
		  <div class="d-flex justify-content-center"><button type="submit" class="btn btn-primary align-center">Đăng nhập</button></div>
		  <p class="mt-3 text-muted text-center">Chưa có tài khoản? đăng kí</p>
		</form>
      </div>
    </div>
  </div>
</div>

