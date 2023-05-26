<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_4010 committee_setup_popup" >
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">전문위원회 구성</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body" >
				<div class="LayerBodySection" style="height:100%">
					<div class="SectionTitleBox">
						<input type="hidden" name="stap_idx" class="stap_idx" id="stap_idx" value="1">
						<h1 class="TitleBoxTit">개최 후보일 설정</h1> 
					</div>
					<div class="SectionBarBox"></div>
					<div class="AgendaModiForm">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>* 위원회의 세부 설정을 입력해주세요.</li>
								<li>* 대면으로 개최되는 위원회는 개최 후보일을 설정 합니다.</li>
								<li>* 서면으로 개최되는 위원회는 열람가능일만 설정 합니다.</li>
	                        </ul>
	                    </div>
	                    <div class="ComSetupBox">
	                    	<div class="ComTypeBox">
	                    		<input type="hidden" id="committee_type" name="committee_type" value="A">
	                    		<ul class="ComTypeList">
	                    			<li class="${committeeData.committeeType eq 'A' ? 'TypeOn' : '' }"><a href="#none" class="ComTypeItem" data-type-code="A">대면</a></li>
	                    			<li class="${committeeData.committeeType eq 'B' ? 'TypeOn' : '' }"><a href="#none" class="ComTypeItem" data-type-code="B">서면</a></li>
	                    		</ul>
	                    	</div>
	                    	<div class="DatePickBox DatePickBox0">
	                    		<p class="Date_tit" id="PickCom">참석일 선택 기간</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="str_date" name="str_date" class="DateFormI" value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickSDF : committeeData.committeeModiSDF }" placeholder="시작일 설정" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH"><c:out value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickSH : committeeData.committeeModiSH }"></c:out></a>
	                    				<input type="hidden" id="str_dateH" class="DateHD" name="str_dateH " value="00">
	                    				<div class="HourPick AutoH01">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<a href="#none" class="DateM"><c:out value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickSM : committeeData.committeeModiSM }"></c:out></a>
	                    				<input type="hidden" id="str_dateM" class="DateMD" name="str_dateM" value="00">
		                    			<div class="MinPick AutoH01">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
	                    			</div>
	                    			<div class="DateFormD">
	                    				~
	                    			</div>
									<div class="DateForm DateFormR">
	                    				<input type="text" id="end_date" name="end_date" class="DateFormI" value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickEDF : committeeData.committeeModiEDF}" placeholder="종료일 설정" data-language="en" autocomplete="off" >
	                    				<input type="hidden" id="end_dateH" class="DateHD" name="end_dateH " value="00">
	                    				<a href="#none" class="DateH"><c:out value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickEH : committeeData.committeeModiEH }"></c:out></a>
	                    				<div class="HourPick AutoH01">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<input type="hidden" id="end_dateM" class="DateMD" name="end_dateM" value="00">
	                    				<a href="#none" class="DateM"><c:out value="${committeeData.committeeType eq 'A' ? committeeData.committeeDatePickEM : committeeData.committeeModiEM }"></c:out></a>
		                    			<div class="MinPick AutoH01">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
	                    			</div>
	                    		</div>
	                    	</div>
	                    	<div class="DatePickBox DatePickBox1">
	                    		<p class="Date_tit">개최 후보일 1</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="DateNom01" name="nomedate01" class="DateFormI" value="${committeeData.committeeDatePick1DF }" placeholder="후보일1" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH"><c:out value="${committeeData.committeeDatePick1H }"></c:out></a>
	                    				<input type="hidden" id="nome_date1H" class="DateHD" name="nomedateH01 " value="00">
	                    				<div class="HourPick AutoH01">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<a href="#none" class="DateM"><c:out value="${committeeData.committeeDatePick1M }"></c:out></a>
	                    				<input type="hidden" id="nome_date1M" class="DateMD" name="nomedateM01" value="00">
		                    			<div class="MinPick AutoH01">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
	                    			</div>
	                    			<br>
	                    			
	                    		</div>
	                    		<input type="text" class="DateFormT" id="nomeDate1Add" name="nomedateK01" value="${committeeData.committeeDateAdd1 }" placeholder="장소를 입력해주세요.">
	                    		<p class="Date_tit">개최 후보일 2</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="DateNom02" name="nomedate02" class="DateFormI" value="${committeeData.committeeDatePick2DF }" placeholder="후보일2" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH"><c:out value="${committeeData.committeeDatePick2H }"></c:out></a>
	                    				<input type="hidden" id="nome_date2H" class="DateHD" name="nomedateH02 " value="00">
	                    				<div class="HourPick AutoH01">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<a href="#none" class="DateM"><c:out value="${committeeData.committeeDatePick2M }"></c:out></a>
	                    				<input type="hidden" id="nome_date2M" class="DateMD" name="nomedateM02" value="00">
		                    			<div class="MinPick AutoH01">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
	                    			</div>
	                    			<br>
	                    			
	                    		</div>
	                    		<input type="text" class="DateFormT" id="nomeDate2Add" name="nomedateK02" value="${committeeData.committeeDateAdd2 }" placeholder="장소를 입력해주세요.">
								<p class="Date_tit">개최 후보일 3</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="DateNom03" name="nomedate03" class="DateFormI" value="${committeeData.committeeDatePick3DF }" placeholder="후보일3" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH"><c:out value="${committeeData.committeeDatePick3H }"></c:out></a>
	                    				<input type="hidden" id="nome_date3H" class="DateHD" name="nomedateH03 " value="00">
	                    				<div class="HourPick AutoH01">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<a href="#none" class="DateM"><c:out value="${committeeData.committeeDatePick3M }"></c:out></a>
	                    				<input type="hidden" id="nome_date3M" class="DateMD" name="nomedateM03" value="00">
		                    			<div class="MinPick AutoH01">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
	                    			</div>
	                    			<br>
	                    			
	                    		</div>
	                    		<input type="text" class="DateFormT" id="nomeDate3Add" name="nomedateK03" value="${committeeData.committeeDateAdd3 }" placeholder="장소를 입력해주세요.">
							</div>
	                    </div>
					</div>
				</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close_4002 btn_close">닫기</a>
                <a href="#none" class="btn btn_save_4002">저장</a>
            </div>
		</div>
	</div>
