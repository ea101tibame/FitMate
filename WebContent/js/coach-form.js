$(document).ready(function() {
     $("#save-btn").click(function(){


//         console.log($("#add-coach-form").serialize());
         
         document.addCoachForm.submit();

    //     $.ajax({
    //         type: 'POST',
    //         url: 'some.php',
    //         data: {name: 'John', location: 'Boston'},
    //         success: function(msg) {
    //         alert('Data Saved: ' + msg);
    //         }
    //     });


         alert("save!");
     });

});