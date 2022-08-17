let userNameAvailableError;
let newUserButton;

    function checkUserName()
    {
        // get the username that was typed
        const userName = $("#userName").val();

        // create the url to check if it's available
        const url = "/users/checkusername?userName=" + userName;

        // call the api
        $.get(url, (data) => {

            //display error message if username is taken
            const isNotAvailable = !data;
            newUserButton.prop("disabled", isNotAvailable)
            if(isNotAvailable){
                userNameAvailableError.show();
            }
            else {
                userNameAvailableError.hide();
            }

        })

    }

$(document).ready(function () {
    newUserButton=$("#newUserButton")
    $.validator.addMethod('capitals', function (thing) {
        return thing.match(/[A-Z]/);
    });

    $.validator.addMethod('pattern', function (thing2) {
        return thing2.match(/^\(\d{3}\)\d{3}-\d{4}/);
    });
    $.validator.addMethod('emailPattern', function (thing3) {
        return thing3.match(/[a-z0-9]+@+[a-z0-9]+.com/);
    });
    userNameAvailableError = $("#userNameAvailableError");
    userNameAvailableError.hide();



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
            email : {
                emailPattern: true,
                required: true
            },
            fname : {
              required: true
            },
            lname : {
                required: true
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
            email : {
                emailPattern: "Email must be entered in the format something@something.com",
            },
            confirmPassword : {
                equalTo : "Passwords do not match"
            }
        },
        errorClass : "error"

    });

    $("#userName").blur(checkUserName);
});





