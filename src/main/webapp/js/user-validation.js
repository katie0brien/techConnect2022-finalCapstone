let isUserNameAvailable = true;
let userNameAvailableError;
let newUserButton;

async function checkUserName() {
    // get the username that was typed
    const userName = $("#userName").val();

    // create the url to check if it's available
    const url = "/users/checkusername?userName=" + userName;

    // call the api
    return $.get(url, (data) => {

        const userNameAvailable = $('#userNameAvailable')
        userNameAvailable.val(data)

    })


}

$(document).ready(function () {
    //regex validator rules via jquery for our form fields
    $.validator.addMethod('capitals', function (thing) {
        return thing.match(/[A-Z]/);
    });

    $.validator.addMethod('pattern', function (thing2) {
        return thing2.match(/^\(\d{3}\)\d{3}-\d{4}/);
    });
    $.validator.addMethod('emailPattern', function (thing3) {
        return thing3.match(/[a-z0-9]+@+[a-z0-9]+.com/);
    });
    $.validator.addMethod('userNameTaken', function(thing4) {
        let isAvailable = thing4 === 'true';
        return isAvailable;
    });

    $('#userName').keyup(checkUserName);
    newUserButton=$("#newUserButton")
    userNameAvailableError = $("#userNameAvailableError");
    userNameAvailableError.hide();

    //jquery form validator rules
    $("form").validate({

        rules : {
            userName : {
                required : true
            },
            userNameAvailable: {
                required: true,
                userNameTaken: true
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
            userNameAvailable: {
                userNameTaken: "This user name is taken by another user"
            },
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

});





