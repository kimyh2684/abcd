<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="clearfix"></div>
              <div class="row" style="display: flex; justify-content: center;">
                <div class="col-md-8 col-sm-12 col-xs-12" >
                    <div class="x_panel">
                      <div class="x_title" style="display: flex; justify-content: center;">
                        <h2>재직정보 불러오기 </h2>
                        
                      </div>

                      <div class="x_content">
                           <a href="<%=request.getContextPath()%>/served/inputCom.do" class="btn btn-success btn-xs"><i class="fa fa-share"></i> 회사추가하기 </a>

                        <div class="table-responsive">
 
                        <form action="/gov/saveGovData.do" name="comMng" method="post">
                          <table class="table table-striped jambo_table">
                            <thead>
                              <tr class="headings">
                             	<th>
                                  <input type="checkbox" id="check-all" class="flat">
                                </th>
                                <th class="column-title">사업자 명칭 </th>
                                <th class="column-title">사업장 지역 </th>
                                <th class="column-title">가입자 종별</th>
                                <th class="column-title">자격 취득시기</th>
                                <th class="column-title">자격 상실시기 </th>
                              </tr>
                            </thead>
                            <tbody>
								 <c:forEach var="govVo" items="${GOV_LIST}" begin="0" varStatus="status">
				                <c:choose>
								    <c:when test="${status.count%2 eq 0}">
						                <tr class="odd pointer">
								    </c:when>
								    <c:when test="${status.count%2 eq 1}">
										<tr class="even pointer">
								    </c:when>
								</c:choose>
									<td class="a-center ">
                                  		<input type="checkbox" class="flat" name="carr_seq" value=""${status.index}"">
                               		</td>
				                	<td>${govVo.workspaceName}<input type="hidden" name="workspaceName${status.index}" value="${govVo.workspaceName}" /></td>
				                	<td>${govVo.workspaceLocation}<input type="hidden" name="workspaceLocation${status.index}" value="${govVo.workspaceLocation}" /></td>
				                	<td>${govVo.classify}<input type="hidden" name="classify${status.index}" value="${govVo.classify}" />
				                	<td>${govVo.gainDate}<input type="hidden" name="gainDate${status.index}" value="${govVo.gainDate}" />
				                	<td>${govVo.lossDate}<input type="hidden" name="lossDate${status.index}" value="${govVo.lossDate}" />
				                </tr>
				               </c:forEach>
							</tbody>
						</table>
						<input type="submit" class="btn btn-primary" value="재직정보 저장하기">
					</form>
					</div>	
                  </div>
                </div>
              </div>	
				</div>	