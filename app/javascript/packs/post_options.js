console.log("loaded post_options");

$(document).ready(function() {

    $(document).on("click",".comment-button",function(event){
        event.preventDefault();
        let buttonID = this.id.replace("comment-button-", "");
        $(`#comment-options-${buttonID}`).toggle();
    });

    $(document).on("click",".edit-button",function(event){
        event.preventDefault();
        let buttonID = this.id.replace("edit-button-", "");
        $(`#edit-post-${buttonID}`).toggle();
        $(`#card-text-${buttonID}`).toggle();

    });


});


