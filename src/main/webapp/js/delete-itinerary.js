function delBoxes(){
    var upcomingBoxes = document.getElementsByClassName('upcomingChk');
    var previousBoxes = document.getElementsByClassName('pastChk');
    for(var i = 0; i<upcomingBoxes.length; i++){
        next = upcomingBoxes[i];
        if(next.checked){
            next.parentNode.removeChild(next);
        }
    }
    for(var i = 0; i<upcomingBoxes.length; i++){
        prev = previousBoxes[i];
        if(prev.checked){
            prev.parentNode.removeChild(next);
        }
    }
}

function isChecked() {
    var upcomingBoxes = document.getElementsByClassName('upcomingChk');
    var previousBoxes = document.getElementsByClassName('pastChk');

    for(var i = 0; i<upcomingBoxes.length; i++){
        next = upcomingBoxes[i];
        if(next.checked){
            return true;
        }
    }
    for(var i = 0; i<upcomingBoxes.length; i++){
        prev = previousBoxes[i];
        if(prev.checked){
            return true;
        }
    }

    return false;

}