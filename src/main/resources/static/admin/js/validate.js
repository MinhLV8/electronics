$(document).ready(function(){
    $("#formNew").validate({
    	/*onkeyup: true,*/
        rules: {
            title: {
                required: true,
                minlength: 20
            },
            shortDes: {
                required: true,
                minlength: 20
            },
            newCategoryCode: {
              required: true,            
            },
        },
        messages: {
        	title:
            {
                required: "Vui lòng nhập một tiêu đề phù hợp",
                minlength: "Tối thiểu phải là 20 kí tự",
            },
            shortDes:
            {
                required: "Vui lòng nhập một mô tả phù hợp",
                minlength: "Tối thiểu phải là 20 kí tự",
            },           
            newCategoryCode:
            {
                required: "Vui lòng chọn một thể loại hợp lệ",
            },
        },
        errorClass: "is-invalid",
        validClass: "is-valid"
    });

    $("#formLogin").validate({
    	/*onkeyup: true,*/
        rules: {
        	j_username: {
                required: true,
                minlength: 5
            },
            j_password: {
                required: true,
                minlength: 6
            },
        },
        messages: {
        	j_username:
            {
                required: "Vui lòng nhập tên đăng nhập",
                minlength: "Tối thiểu phải là 5 kí tự",
            },
            j_password:
            {
                required: "Vui lòng nhập mật khẩu",
                minlength: "Tối thiểu phải là 6 kí tự",
            },           
        },
        errorClass: "is-invalid",
        validClass: "is-valid",
    });
});