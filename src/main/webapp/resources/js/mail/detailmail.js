function checkimportant(event) {
    event.stopPropagation();
    
    var $icon = $(".icon-copy.star");
    
    if ($icon.hasClass("ion-ios-star-outline")) {
        $icon.removeClass("ion-ios-star-outline").addClass("ion-ios-star");
    } else if ($icon.hasClass("ion-ios-star")) {
        $icon.removeClass("ion-ios-star").addClass("ion-ios-star-outline");
    }
}

function checkdelete(){
	window.history.back();
}

