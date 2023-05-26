var fileArr = [];
function checkFileList(){
	
	var length = $('.file_list').children('li').length;
	
	if(length == 0){
		$('.file-list_info').css('display', 'block');
	}else{
		$('.file-list_info').css('display', 'none');
	} 
	
}
function deleteFile(e) {

	var index = $(e.currentTarget).parent('li').index();

	$('.file_list').children('li').eq(index).remove();
	
	fileArr.splice(index,1);

	checkFileList();

}
function deleteAllFile() {
	
	$('.file_list').empty();
	fileArr=[];
	
	checkFileList();
	
}
function attachFile() {

	var input =$('input[name=tmp]');

	var input = $('<input />', { type: 'file', name: 'tmp',  multiple: true });

	//input.css('display', 'none');

	input.click();

	$(input).change(function(e) {

		var files = [];
		
		$(e.target.files).each(function(index, field){
			
			if(field.size <= 0){
			
				alert(field.name + " : 파일 크기가 0 보다 커야 합니다.");
				return;
			}else{
				files.push(field);
				fileArr.push(field);
				console.log(fileArr);
			}
			
			
		});
	
		
		files.forEach(function(file){

			$('.file_list').append(
				"<li><p style='float:left;'>" + file.name + "</p><a href='javascript:void(0);' onclick='deleteFile(event);' class='delete_row_file'>삭제</a></li>"
			);
				
		});
		
		checkFileList();
		
	})


}

$(function(){ 
	checkFileList();

});