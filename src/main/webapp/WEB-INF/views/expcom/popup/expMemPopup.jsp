<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
	<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Exp02">
       	<div class="layer_popup_tit">
			<h1 class="layer_tit">구성원 등록</h1>
			<a href="javascript:void(0);" class="layer_closer"></a>
		</div>
		<div class="popup_utile_box">
			<div class="mem_add_cnt_box">
				<ul class="com_mem_tap_list t1">
					<li>
						<a href="javascript:void(0);" class="mem_tap_item chkOn" data-amg-code="show04">
							<span class="cnt_tit">소관과</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" class="mem_tap_item" data-amg-code="show03">
							<span class="cnt_tit">기밀보호센터</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" class="mem_tap_item" data-amg-code="show05">
							<span class="cnt_tit">전문위원</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" class="mem_tap_item" data-amg-code="show06">
							<span class="cnt_tit">기술간사</span>
						</a>
					</li>
				</ul>	
			</div>
		</div>
		<div class="layer_popup_body popup_mem_box nct_scroll">
			<div class="nct_bro_item type_07 show04">
				<c:if test="${fn:length(memList) == 0 }">
					<div class="no_list">
						조회된 검색 결과가 없습니다.
					</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				<!--검색결과가 있는 경우 : 시작-->
				<c:if test="${fn:length(memList) != 0 }">
					<c:set var="amg03Cnt" value="0"></c:set>
					<c:set var="amg04Cnt" value="0"></c:set>
					<c:set var="amg05Cnt" value="0"></c:set>
					<c:set var="amg06Cnt" value="0"></c:set>
					<ul class="popup_mem_list list_amg04">
					<c:forEach items="${memList}" var="expMem"  varStatus="status">
						<c:if test="${expMem.admGroup eq 'AMG04'}">
							<c:set var="amg04Cnt" value = "${amg04Cnt + 1}"/>
							<li class="add_mem Adm${expMem.admId}" data-memadmid="${expMem.admId}" data-memadm-amg="${expMem.admGroup eq 'AMG04' ? 'Amg04' : '' }">
								<div class="seleted_item"><p>이미 등록 된 구성원 입니다.</p></div>
								<div class="mem_num">
									${amg04Cnt}
								</div>
								<div class="mem_body type01">
									<p class="agd_mem_adm">소관과</p>
									<p class="agd_mem_name"><span class="agd_add_name">${expMem.admName}</span> <span class="agd_mem_names">${expMem.admDept} ${expMem.admPositon}</span></p>
									<p class="agd_mem_sub_info">${expMem.admCom}</p>
									<p class="agd_mem_sub_info">${expMem.admMobile1}-${expMem.admMobile2}-${expMem.admMobile3} / ${expMem.admEmail}</p>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${amg04Cnt eq '0'}">
						<li>
							<div class="no_list">
								조회된 검색 결과가 없습니다.
							</div>
						</li>
					</c:if>
					</ul>
					<ul class="popup_mem_list list_amg03">
					<c:forEach items="${memList}" var="expMem"  varStatus="status">
						<c:if test="${expMem.admGroup eq 'AMG03'}">
							<c:set var="amg03Cnt" value = "${amg03Cnt + 1}"/>
							<li class="add_mem Adm${expMem.admId}" data-memadmid="${expMem.admId}" data-memadm-amg="${expMem.admGroup eq 'AMG03' ? 'Amg03' : '' }">
								<div class="seleted_item"><p>이미 등록 된 구성원 입니다.</p></div>
								<div class="mem_num">
									${amg03Cnt}
								</div>
								<div class="mem_body type01">
									<p class="agd_mem_adm">기밀보호센터</p>
									<p class="agd_mem_name"><span class="agd_add_name">${expMem.admName}</span> <span class="agd_mem_names">${expMem.admDept} ${expMem.admPositon}</span></p>
									<p class="agd_mem_sub_info">${expMem.admCom}</p>
									<p class="agd_mem_sub_info">${expMem.admMobile1}-${expMem.admMobile2}-${expMem.admMobile3} / ${expMem.admEmail}</p>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${amg03Cnt eq '0'}">
						<li>
							<div class="no_list">
								조회된 검색 결과가 없습니다.
							</div>
						</li>
					</c:if>
					</ul>
					<ul class="popup_mem_list list_amg05">
					<c:forEach items="${memList}" var="expMem"  varStatus="status">
						<c:if test="${expMem.admGroup eq 'AMG05'}">
							<c:set var="amg05Cnt" value = "${amg05Cnt + 1}"/>
							<li class="add_mem Adm${expMem.admId}" data-memadmid="${expMem.admId}" data-memadm-amg="${expMem.admGroup eq 'AMG05' ? 'Amg05' : '' }">
								<div class="seleted_item"><p>이미 등록 된 구성원 입니다.</p></div>
								<div class="mem_num">
									${amg05Cnt}
								</div>
								<div class="mem_body type01">
									<p class="agd_mem_adm">전문위원</p>
									<p class="agd_mem_name"><span class="agd_add_name">${expMem.admName}</span> <span class="agd_mem_names">${expMem.admDept} ${expMem.admPositon}</span></p>
									<p class="agd_mem_sub_info">${expMem.admCom}</p>
									<p class="agd_mem_sub_info">${expMem.admMobile1}-${expMem.admMobile2}-${expMem.admMobile3} / ${expMem.admEmail}</p>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${amg05Cnt eq '0'}">
						<li>
							<div class="no_list">
								조회된 검색 결과가 없습니다.
							</div>
						</li>
					</c:if>
					</ul>
					<ul class="popup_mem_list list_amg06">
					<c:forEach items="${memList}" var="expMem"  varStatus="status">
						<c:if test="${expMem.admGroup eq 'AMG06'}">
							<c:set var="amg06Cnt" value = "${amg06Cnt + 1}"/>
							<li class="add_mem Adm${expMem.admId}" data-memadmid="${expMem.admId}" data-memadm-amg="${expMem.admGroup eq 'AMG06' ? 'Amg06' : '' }">
								<div class="seleted_item"><p>이미 등록 된 구성원 입니다.</p></div>
								<div class="mem_num">
									${amg06Cnt}
								</div>
								<div class="mem_body type01">
									<p class="agd_mem_adm">기술간가</p>
									<p class="agd_mem_name"><span class="agd_add_name">${expMem.admName}</span> <span class="agd_mem_names">${expMem.admDept} ${expMem.admPositon}</span></p>
									<p class="agd_mem_sub_info">${expMem.admCom}</p>
									<p class="agd_mem_sub_info">${expMem.admMobile1}-${expMem.admMobile2}-${expMem.admMobile3} / ${expMem.admEmail}</p>
								</div>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${amg06Cnt eq '0'}">
						<li>
							<div class="no_list">
								조회된 검색 결과가 없습니다.
							</div>
						</li>
					</c:if>
					</ul>
				</c:if>
	        </div>
	    </div>
        <div class="layer_popup_btn">
            <a href="#none" class="btn btn_close">닫기</a>
            <a href="javascript:addExpMemList();" class="btn datepicksave1">구성원 등록</a>
        </div>
	</div>
</div>
