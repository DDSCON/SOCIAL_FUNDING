<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>

<scriptsrc="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/profile1.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Blank Template for Bootstrap</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="assets/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">

            <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>

            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <!--이거지우면 탭기능안됨  -->


            <script>
                function S_text_copy(z) {
                    if (z.options[z.selectedIndex].value) {
                        tmp1 = z.options[z.selectedIndex].text;
                        tmp2 = z.options[z.selectedIndex].value;

                        document.getElementById('card_company').value = tmp1;
                        document.getElementById('card_company_code').value = tmp2;
                    }
                }
            </script>

            <jsp:include page="../main/header.jsp"></jsp:include>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
</head>

<body>
            <jsp:include page="../main/top.jsp"></jsp:include>


 <div class="container b_con">
            <div class="">
                <h1>지불정보 설정</h1>
                <hr/>
            </div>
            <div class="b-main">
                <div class="col-md-3 text-center">
                    <p class="p-name text-right">카드사 :&nbsp;</p>
                    <p class="p-name text-right">카드 번호 :&nbsp;</p>
                    <p class="p-name text-right">만기(월[ex_07]) :&nbsp;</p>
                    <p class="p-name text-right">만기(년[ex_2015]) :&nbsp;</p>
                </div>
            
            <form action="/account/updata_card_payinfo" method="post" id="form_send" name="form_send">
                <div class="col-md-9">
                <c:forEach var="getAllmember" items="${getAllmember}">
					<input type="hidden" name="seq" value="${getAllmember}">
				 </c:forEach>
                     <select class="form-control name_input"  name="cardtype" id="cardtype" onkeypress="return enter2next(event, 'detectPayMethod_getBASICCardType2()')" 
                     onchange="S_text_copy(this)" autofocus style=" width: 186px;">
                            <option value="310">비씨(BC)카드</option>
                            <option value="310">MG새마을체크카드</option>
                            <option value="310">우체국(BC)카드</option>
                            <option value="310">KDB산업은행카드</option>
                            <option value="310">상호저축은행</option>
                            <option value="310">현대증권</option>
                            <option value="410">신한(LG)카드</option>
                            <option value="510">삼성카드</option>
                            <option value="610">현대카드</option>
                            <option value="110">국민(KB)카드</option>
                            <option value="710">롯데카드</option>
                            <option value="210">하나카드(구,외환)</option>
                            <option value="912">농협(NH)카드</option>
                            <option value="923">씨티카드</option>
                            <option value="916">하나카드(구,하나SK)</option>
                            <option value="913">우리카드</option>
                            <option value="918">광주카드</option>
                            <option value="920">전북카드</option>
                            <option value="925">수협카드</option>
                            <option value="610">신협(현대)카드</option>
                            <option value="921">제주카드</option>
                            <option value="511">삼성올앳카드</option>
                            <option id="cardcompanycode" value="<c:forEach var=" payment " items="${payinfo} ">${payment.card_company_code}</c:forEach>" selected="selected">
                                <c:forEach var="payment" items="${payinfo}">${payment.card_company}</c:forEach>
                            </option>
                        </select>
                        <input placeholder="카드번호" type="text" class="form-control name_input" name="card_number" id="cardnumber"  value="<c:forEach var="payment" items="${payinfo}">${payment.card_number}</c:forEach>" size="16" style=" width: 190px;" />
                        
                        <input placeholder="월" class="form-control name_input" name="card_expire_month" id="card_expire_month" value="<c:forEach var="payment" items="${payinfo}">${payment.card_expire_month}</c:forEach>" size="2" style=" width: 45px;"/>
                        
                        <input placeholder="년도" class="form-control name_input" name="card_expire_year" id="card_expire_year" value="<c:forEach var="payment" items="${payinfo}">${payment.card_expire_year}</c:forEach>" size="4" style=" width: 70px;"/>
                
                   <input type="hidden" name="seq" value="<%=request.getParameter(" seq ") %>" />

                        <c:forEach var="payment" items="${payinfo}">
                            <input type="hidden" name="m_seq" value="${sessionScope.seq}" />
                            <input type="hidden" name="email" value="${email}" />
                            <input type="hidden" id="card_company" name="card_company" value="${payment.card_company}" />
                            <input type="hidden" id="card_company_code" name="card_company_code" value="${payment.card_company_code}" />
                        </c:forEach>
                
                </div>
            
            </div>
        </div>
        <div class="text-center" style="padding-bottom: 100px;">
            <input class="btn btn-default login_button" name="commit" tabindex="4" type="submit" value="수정하기">
        </div>
        </form>


            <jsp:include page="../main/footer.jsp"></jsp:include>
        </body>

        </html>