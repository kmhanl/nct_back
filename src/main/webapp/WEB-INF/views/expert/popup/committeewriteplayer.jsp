<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_3003 committee_setup_popup" >
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">위원회 구성2</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body" >
				<div class="LayerBodySection" style="height:100%">
					<div class="SectionTitleBox">
						<input type="hidden" name="stap_idx" class="stap_idx" id="stap_idx" value="1"> 
						<ul class="TitleTapList">
							<li class="techSettingTab TapOn"><a href="#none" class="TitleTapItem">분야 설정</a></li>
							<li><a href="#none" class="TitleTapItem">안건 구성 설정</a></li>
							<li><a href="#none" class="TitleTapItem">위원 구성 설정</a></li>
							<li><a href="#none" class="TitleTapItem">위원회 설정</a></li>
						</ul>
					</div>
					<div class="SectionBarBox"></div>
					<div class="AgendaModiForm AgendaModi00">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>* 위원회를 구성할 분야를 선택해주세요.</li>
							</ul>
	                    </div>
	                    <div class="agenda_send_warp">
		                	<div class="depth_select_warp">
		                	<input type="hidden" name="ComTechType" id="ComTechType" value=""> 
	                        <ul class="dept_list_01">
		                        
	                            	<li data-tech-id="KTS00701">반도체</li>
	                           	
	                            	<li data-tech-id="KTS00702">디스플레이</li>
	                           	
	                            	<li data-tech-id="KTS00703">전기전자</li>
	                           	
	                            	<li data-tech-id="KTS00704">자동차ㆍ철도</li>
	                           	
	                            	<li data-tech-id="KTS00705">철강</li>
	                           	
	                            	<li data-tech-id="KTS00706">조선</li>
	                           	
	                            	<li data-tech-id="KTS00707">원자력</li>
	                           	
	                            	<li data-tech-id="KTS00708">정보통신</li>
	                           	
	                            	<li data-tech-id="KTS00709">우주</li>
	                           	
	                            	<li data-tech-id="KTS00710">생명공학</li>
	                           	
	                            	<li data-tech-id="KTS00711">기계</li>
	                           	
	                            	<li data-tech-id="KTS00712">로봇</li>
	                           	
	
	                        </ul>
	                    </div>
	                    
	                </div>
	                    
					</div>
					<div class="AgendaModiForm AgendaModi01" style="display:none;">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>* 위원회를 구성할 안건을 선택해주세요.</li>
								<li>* 검토 준비중인 안건을 선택 하여 추가 버튼을 선택하거나 드래그하여 안건을 추가 할수 있습니다.</li>
	                        </ul>
	                    </div>
	                    <div class="WriteFormItem02">
	             			<div class="PupLeft height100">
	             				<div class="write_section02" style="height: calc(100% - 2px);">
				                	<div class="write_section_tit">
				            			<p class="section_label">검토 준비중 안건</p> 
				            			<a href="javascript:moveToAgenda();" class="agendaadd">선택 안건 추가</a>
				            		</div>
				            		<div class="AgendaListBox">
					            		<ul id="sortable1" class="agenda_list connectedSortable ui-sortable" data-list-name="results_agenda">
										</ul>
					            	</div>
				            	</div>
	             			</div>
	             			<div class="PupRight height100">
	             				<div class="write_section02" style="height: calc(100% - 2px);">
				                	<div class="write_section_tit">
				            			<p class="section_label">위원회 구성 안건</p> 
				            			<a href="javascript:backToAgenda();" class="agendadel">선택 안건 삭제</a>
				            		</div>
				            		<div class="AgendaListBox">
				            			<input type="hidden" name="send_agenda_count" class="send_agenda_count" id="send_agenda_count" value="0"> 
					            		 <ul id="sortable2" class="agenda_list connectedSortable ui-sortable" data-list-name="send_agenda">
											
										</ul>
					            	</div>
				            	</div>
	             			</div>
			            </div>
					</div>
					<div class="AgendaModiForm AgendaModi02">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>*  위원회를 구성원을 설정해주세요.</li>
	                            <li>*  사무관 권한의 구성원은 위원회 열람만 가능 하며, 의견제출이 불가능 합니다.</li>
							</ul>
	                    </div>
	                    <div class="ComMemeberBox">
	                    	<div class="MemberTapBox">
	                    		<ul class=MemberTapList>
	                    			<li class="TapOn" data-adm-group="AMG05"><a href="#none" class="MemberTapItem">위원</a>
	                    			<li data-adm-group="AMG06"><a href="#none" class="MemberTapItem">기술위원</a>
	                    			<li data-adm-group="AMG03"><a href="#none" class="MemberTapItem">산업기밀보호센터</a>
	                    			<li data-adm-group="AMG04"><a href="#none" class="MemberTapItem">소관과</a>
	                    		</ul> 
	                    	</div>
	                    	<div class="MemberListBox MemberListBox0">
	                    		<ul class="ComMemList">
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox1">
	                    		<ul class="ComMemList">
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox2">
	                    		<ul class="ComMemList">
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox3">
	                    		<ul class="ComMemList">
	                    		</ul>
	                    	</div>
	                    </div>
	                </div>
					<div class="AgendaModiForm AgendaModi03">
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
	                    			<li class="TypeOn"><a href="#none" class="ComTypeItem" data-type-code="A">대면</a></li>
	                    			<li><a href="#none" class="ComTypeItem" data-type-code="B">서면</a></li>
	                    		</ul>
	                    	</div>
	                    	<div class="DatePickBox DatePickBox0">
	                    		<p class="Date_tit" id="PickCom">참석여부 조사기간</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="str_date" name="str_date" class="DateFormI" placeholder="시작일 설정" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH">00</a>
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
	                    				<a href="#none" class="DateM">00</a>
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
	                    				<input type="text" id="end_date" name="end_date" class="DateFormI" placeholder="종료일 설정" data-language="en" autocomplete="off" >
	                    				<input type="hidden" id="end_dateH" class="DateHD" name="end_dateH " value="00">
	                    				<a href="#none" class="DateH">00</a>
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
	                    				<a href="#none" class="DateM">00</a>
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
	                    				<input type="text" id="DateNom01" name="nomedate01" class="DateFormI" placeholder="후보일1" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH">00</a>
	                    				<input type="hidden" id="can_date1H" class="DateHD" name="nomedateH01 " value="00">
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
	                    				<a href="#none" class="DateM">00</a>
	                    				<input type="hidden" id="can_date1M" class="DateMD" name="nomedateM01" value="00">
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
	                    		<input type="text" class="DateFormT" id="can_addr1" name="nomedateK01" value="" placeholder="장소를 입력해주세요.">
	                    		<p class="Date_tit">개최 후보일 2</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="DateNom02" name="nomedate02" class="DateFormI" placeholder="후보일2" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH">00</a>
	                    				<input type="hidden" id="can_date2H" class="DateHD" name="nomedateH02 " value="00">
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
	                    				<a href="#none" class="DateM">00</a>
	                    				<input type="hidden" id="can_date2M" class="DateMD" name="nomedateM02" value="00">
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
	                    		<input type="text" class="DateFormT" id="can_addr2" name="nomedateK02" value="" placeholder="장소를 입력해주세요.">
								<p class="Date_tit">개최 후보일 3</p>
	                    		<div class="DateLength">
	                    			<div class="DateForm DateFormL">
	                    				<input type="text" id="DateNom03" name="nomedate03" class="DateFormI" placeholder="후보일3" data-language="en" autocomplete="off" >
	                    				<a href="#none" class="DateH">00</a>
	                    				<input type="hidden" id="can_date3H" class="DateHD" name="nomedateH03 " value="00">
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
	                    				<a href="#none" class="DateM">00</a>
	                    				<input type="hidden" id="can_date3M" class="DateMD" name="nomedateM03" value="00">
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
	                    		<input type="text" class="DateFormT" id="can_addr3" name="nomedateK03" value="" placeholder="장소를 입력해주세요.">
								
	                    		
	                    		
	                    	</div>
	                    	
	                    	
	                    </div>
					</div>
				</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_pre_3003">이전</a>
                <a href="#none" class="btn btn_save_3003">위원회 구성 저장</a>
                <a href="#none" class="btn btn_next_3003">다음</a>
            </div>
		</div>
	</div>
