console.log("loaded post_options");

$(document).ready(function() {

    $(document).on("click",".actions-button",function(event){
        event.preventDefault();

        let buttonID = this.id.replace("action-button-", "");
        $(`#post-options-${buttonID}`).toggle();
    });

});


