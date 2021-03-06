<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <div class="">
	<div class="clearfix"></div>
	<div class="row" style="display: flex; justify-content: center">
		<div class="col-md-6 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title" style="display: flex; justify-content: center">
					<h2>사업 등록</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<form name="frm" id="frm" action="${pageContext.request.contextPath}/busi/busiInsert.do" method="get" class="form-horizontal form-label-left" novalidate>

						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="busiName">사업명 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="busi_name" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									name="busi_name" required="required" type="text">
							</div>
						</div>
						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="busi_start_date">사업시작일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="busi_start_date" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									name="busi_start_date" required="required" type="text">
							</div>
						</div>

						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="email">사업종료일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="busi_end_date" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									name="busi_end_date" required="required" type="text">
							</div>
						</div>

						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="busi_chk_user">담당자 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="busi_chk_user" name="busi_chk_user"
									required="required" data-validate-minmax="10,100"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="busi_chk_dept">담당자 부서 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="busi_chk_dept" name="busi_chk_dept"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="busi_chk_tel">담당자 연락처 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="busi_chk_tel" type="text" name="busi_chk_tel"
									data-validate-length-range="5,20"
									class="optional form-control col-md-7 col-xs-12">
							</div>
						</div>

						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-6 col-md-offset-3">
								<a href="${pageContext.request.contextPath }/busi/busiList.do"><input type="button"
									class="btn btn-primary" value="취소하기"></a> <input id="send"
									type="submit" class="btn btn-success" value="등록하기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>