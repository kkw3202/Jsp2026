<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <link rel="stylesheet" href="style/section.css">

		<div class="section_wrap">
			<div class="word">HOME</div>
			<div class="content">
				<div class="carList">
					<c:forEach var="car" items="${carAll }" >
						<div class="carItem">
							<img alt="${car.carName }" src="img/${car.img }">
							<div class="carName">${car.carName }</div>
							<div class="carPrice">
								<fmt:formatNumber value="${car.price }" pattern="#,##0"/>원
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

