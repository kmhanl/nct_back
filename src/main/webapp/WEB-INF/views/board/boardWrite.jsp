<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$( document ).ready(function() {
	// 기술유출 상담 저장
	$(".WriteBtnWrapper .policySave").on("click",function(){
		var status = "S";
		var policyTitle = $("#infoBoardTitle").val();
		
		
		if(policyTitle==""){
			alert("제목을 입력해주세요.");
			status = "F";
			return;
		}
	
		var policyName = $("#infoBoardId").val();
		if(policyName==""){
			alert("작성자를 입력해주세요.");
			return;
		}
		var policyContent = $("#infoBoardContent").val();
		if(policyContent==""){
			alert("내용을 입력해주세요.");
			status = "F";
			return;
		}
		
		var policyViewYn =$('input[name=infoBoardViewYn]:checked').val();
		if(policyViewYn==""){
			alert("게시,미게시 여부를 선택 해주세요.");
			status = "F";
			return;
		}
		
		if(status=="S"){
			//PageLoadingPopup.open();
			 
			
			var policyDepth = '1';
			var policyTitle = $("#infoBoardTitle").val();
			var policyContent = $("#infoBoardContent").val();
			var policyId = $("#infoBoardId").val();
			var policyCode = $("#infoBoardCode").val();
			var policyViewYn =$('input[name=infoBoardViewYn]:checked').val();
			
			$.ajax({
				type:'POST',
				url: "/board/saveData.do",
				data : {
			 		 "policyDepth": "1"
			 		,"infoBoardTitle": policyTitle
			 		,"infoBoardContent": policyContent
			 		,"infoBoardId": policyId
			 		,"infoBoardCode" : policyCode
			 		, "infoBoardViewYn" : policyViewYn
			 	}, 
			 	dataType : "json",
				success : function(data) {
					console.log("메타 데이터 저장 완료 > 파일 저장 시도 ");
					console.log(data);
					sendFileData(data.resultData); 
				},
				error: function(e) {
					alert("접수 신청서 임시 저장에 실패 했습니다. 다시 시도해주세요.");
					return;
				}
			});
		}
	});
	
});
function sendFileData(policyCode){
	var formData = new FormData();
	formData.append("infoBoardCode",infoBoardCode);
	
	var multifilecount = $("#uploadfile .section_item").length;
	var fileIdx = 0;
	if(multifilecount !=0){
		fileIdx = multifilecount;
	}else{
		fileIdx = 0;
	}
	$(fileArr).each(function(idx, file){
		console.log(file);
		formData.append(`fileList[${fileIdx}].file`, file);
		formData.append(`fileList[${fileIdx}].depth`, "F");
		formData.append(`fileList[${fileIdx}].type`, "IF01");
		formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
		fileIdx++;
	});
	console.log(formData);
//		fileIdx++;
	if(fileIdx == 0){
		//alert("첨부 파일 없네 ?? 저장 완료 ");
		alert("등록이 완료되었습니다.");
		console.log(policyCode);	
		location.href="/board/informationList.do";
		//location.reload();
		return;
	}else{
		console.log("첨부 파일 저장 해보고 오겠음 ....파일 저장 안되면 저장된 메타는 지울게 ");
		console.log(formData);
        $.ajax({
            type: "POST",
        	url: "/board/uploadFile.do",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
		 	success : function(data) { 
				switch (data.resultCode){
					case 'S':
						alert("등록이 완료되었습니다.");
						location.href="/board/informationList";
						break;
					case 'F':
						alert('파일 저장 중 오류 발생');
						//deleteMeta(metaCode);
						break;
				}
			},
            error : function(requestObject, error, errorThrown){
               	if(error === "error"){
					alert("파일 업로드에 실패하였습니다.\n파일이 열려있는지 확인하시고 다시 시도해주세요.");
					//deleteMeta(metaCode);
				}
				
            }
		});
	}
};
</script>
<div class="body_wrapper">
<div class="list_wrapper ">
	            <table class="table_list receiptList InsertReceipt" style="border-bottom:0;">
	                <colgroup>
	                    <col width="15%">
	                    <col width="">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th class="stat">
	                           	제목
	                        </th>
	                        <td class="tit">
	                           	<input type="text" name="infoBoardTitle" class="forminput02" id="infoBoardTitle" value="" maxlength="200">
	                           	<input type="hidden" name="infoBoardCode" class="forminput02" id="infoBoardCode" value="">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	작성자
	                        </th>
	                        <td class="tit">
	                           	<input type="text" name="infoBoardId" class="forminput02" id="infoBoardId" value="${user.admId}" style="width:50%" maxlength="20" readonly>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	내용
	                        </th>
	                        <td>
	                           	<textarea class="rcptTechForm textareaForm" name="infoBoardContent" id="infoBoardContent" rows="12" title=""></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	첨부파일
	                        </th>
	                        <td class="file-list-td numbering">
								<div class="ept_box">
				          			<div class="new_file_box">
			                          <div class="new_file_box_brn_warp">
			                              <a href="javascript:attachFile();" class="file_box_brn add_file">파일첨부</a>
			                              <a href="javascript:deleteAllFile();" class="file_box_brn select_all">전체삭제</a>
			                          </div>
				                      <div class="new_file_box_list">
				                      	<p class="file-list_info" style="display: block;">
					                 		파일을 첨부해주세요.
					            		</p>
					            		<ul class="file_list">
										</ul>
	                       				</div>
	                   				</div> 
	       						</div>
							</td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	게시여부 
	                        </th>
	                         <td>
	                        
	                            <input type="radio" name="infoBoardViewYn" value="Y" id="infoBoardViewYn1"><label for="infoBoardViewYn1">승인</label>
	                            <input type="radio" name="infoBoardViewYn" value="N" id="infoBoardViewYn2"><label for="infoBoardViewYn2">미승인</label>
	                         </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <div class="WriteBtnWrapper">
	        	<a href="/board/informationList.do" class="Btn">목록보기</a>
            	<a href="javascript:void(0);" class="Btn policySave">저장</a>
            </div>
</div>