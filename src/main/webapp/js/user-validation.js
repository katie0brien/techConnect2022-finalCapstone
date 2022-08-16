$(document).ready(function () {
    $.validator.addMethod('capitals', function(thing){
        return thing.match(/[A-Z]/);
    });
    $.validator.addMethod('pattern', function(thing2){
        return thing2.match(/^\(\d{3}\)\d{3}-\d{4}/);
    });

    $("form").validate({

        rules : {
            userName : {
                required : true
            },
            phoneNumber : {
                required: true,
                minlength:  13,
                pattern: true,
            },
            password : {
                required : true,
                minlength: 8,
                capitals: true,
            },
            confirmPassword : {
                required : true,
                equalTo : "#password"
            }
        },
        messages : {
            password: {
                minlength: "Password too short, make it at least 8 characters",
                capitals: "Field must contain a capital letter",
            },
            phoneNumber:{
                pattern: "Please enter a phone number in the format (###)###-####",
                minlength: "Please enter a phone number in the format (###)###-####",
            },
            confirmPassword : {
                equalTo : "Passwords do not match"
            }
        },
        errorClass : "error"
    });
});