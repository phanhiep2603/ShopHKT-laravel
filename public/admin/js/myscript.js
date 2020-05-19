

$("div.alert").delay(3000).slideUp();

function xoa(message) {
	if(window.confirm(message)) {
		return true;
	}
	return false;
}


$(document).ready( function () {
   $('#addImages').click(function(){
      $('#insert').append('<div class="form-group"><input type="file" name="fEditDetail[]"></div>');
   });
});

$(document).ready( function () {
   $('#addSizes').click(function(){
      $('#insertSize').append('<div class="form-group">Input Size <input type="text" name="SizeAddDetail[]"></div>');
   });
});

$(document).on('click','#delete',function(e){
   var id = $(this).attr('ref');
   var deleteFunction = $(this).attr('ref1');
      swal.fire({
         title: "Are you sure want to delete ?", 
         text: "You won't be able to revert this!",
         icon: 'warning',
         showCancelButton: true,
         confirmButtonColor: '#d33',
         cancelButtonColor: '#3085d6',
         confirmButtonText: 'Yes, delete it!',
         cancelButtonText: 'No, Cancle delete'  
      }).then((result) => {
         if(result.value)
         {
            
            Swal.fire({
               title: 'Deleted!',
               text: "Deleted Successfully",
               icon: 'success',
               timer: 3000,
               timerProgressBar: true,
            });
            window.location.href=deleteFunction+"/"+id
         }
         
         Swal.fire({
            title: 'Oops....',
            text: "Somethings went wrong",
            icon: 'error',
            timer: 3000,
            timerProgressBar: true,
            
         });
         window.location.href=""
      });
      
});

$(document).ready(function() {
   $('#popupclick').click(function(){
   var frametarget = $(this).attr('href');
   var targetmodal = $(this).attr('data-target');
   if (targetmodal === undefined) {
     targetmodal = '#exampleModal';
   }
   $('iframe').attr("src", frametarget );   
   $(targetmodal).modal('show');
   return false;
   });
});

$(document).ready( function () {
   $('a#del_image').on('click',(function(){
      var url = "http://localhost/shopbh/admin/product/delimg/";
      var _token = $("form[name='frmEditProduct']").find("input[name='_token']").val();
      var idImg = $(this).parent().find("img").attr("idImg");
      var img = $(this).parent().find("img").attr("src");
      var rid = $(this).parent().find("img").attr("id");
      $.ajax({
      	url: url + idImg,
      	type: 'GET',
      	cache: false,
      	data: {"_token": _token,"idImg": idImg,"urlImg": img},
      	success: function(data) {
      		if(data == "Ok!"){
      			$("#"+rid).remove();
      		}else{
      			alert("Error!");
      		}
      	}
      });
   }));
});