$(document).ready(function(){

    $("#form-signin").submit(function(e){
        e.preventDefault();

        var login = $.trim($("#login").val());
        var password = $.trim($("#password").val());

        if(login == '' || password == '') {
            $("img.profile-img").attr("src", "/images/user-error.png");
        } else {
            $("img.profile-img").attr("src", "/images/user-ok.png");
            $(this).unbind().submit();
        }

    });



    getPageData();



    /* manage data list */
/*
    function manageData() {
        $.ajax({
            dataType: 'json',
            url: 'http://project-2.my/cabinet/getallmodel',
        }).done(function(data){
            manageRow(data.data);
        });


    }
*/


    /* Get Page Data*/
    function getPageData() {
        $.ajax({
            dataType: 'json',
            type: 'GET',
            url: 'http://project-2.my/cabinet/getallmodel'
        }).done(function(data){
            manageRow(data);
        });
    }


    /* Add new Item table row */
    function manageRow(data) {
        var	rows = '';
        $.each( data, function( key, value ) {
            rows = rows + '<tr>';
            rows = rows + '<td>1111<div class="chk-option"><label class="check-task custom-control custom-checkbox d-flex justify-content-center done-task"><input type="checkbox" class="custom-control-input"><span class="custom-control-label"></span></label></div>11111'+value.firstname+'</td>';
            rows = rows + '<td>'+value.lastname+'</td>';
            rows = rows + '<td>'+value.thrname+'</td>';
            rows = rows + '<td>'+value.address+'</td>';
            rows = rows + '<td>'+value.email+'</td>';
            rows = rows + '<td>'+value.zip+'</td>';
            rows = rows + '<td>'+value.kurs_name+'</td>';
            rows = rows + '<td>'+value.faculty_name+'</td>';
            rows = rows + '<td>'+value.whois_name+'</td>';
            rows = rows + '<td data-id="'+value.id+'">';
            rows = rows + '<button data-toggle="modal" data-target="#edit-item" class="btn btn-primary edit-item">Edit</button>';
            rows = rows + '<button class="btn btn-danger remove-item">Delete</button>';
            rows = rows + '</td>';
            rows = rows + '</tr>';
        });


        $("tbody").html(rows);
    }


    /* Create new Item */
    $(".crud-submit").click(function(e){
        e.preventDefault();
        let form_action = $("#create-item").find("form").attr("action");
        let firstname = $("#create-item").find("input[name='firstname']").val();
        let lastname = $("#create-item").find("input[name='lastname']").val();
        let thrname = $("#create-item").find("input[name='thrname']").val();
        let email = $("#create-item").find("input[name='email']").val();
        let address = $("#create-item").find("input[name='address']").val();
        let kurs = $("#create-item").find("input[name='kurs']").val();
        let faculty = $("#create-item").find("input[name='faculty']").val();
        let saveinfo = $("#create-item").find("input[name='saveinfo']").val();
        let whois = $("#create-item").find("input[name='whois']").val();
        let zip = $("#create-item").find("input[name='zip']").val();


        if(firstname != '' && lastname != ''){
            $.ajax({
                dataType: 'text',
                type:'POST',
                url: form_action,
                data:{firstname:firstname, lastname:lastname, thrname:thrname, email:email, address:address, kurs:kurs, faculty:faculty, saveinfo:saveinfo,whois:whois, zip:zip}
             }).done (function(data){
                $("#create-item").find("input[name='firstname']").val('');
                $("#create-item").find("input[name='lastname']").val('');
                $("#create-item").find("input[name='thrname']").val('');
                $("#create-item").find("input[name='email']").val('');
                $("#create-item").find("input[name='address']").val('');
                $("#create-item").find("input[name='kurs']").val('');
                $("#create-item").find("input[name='faculty']").val('');
                $("#create-item").find("input[name='saveinfo']").val('');
                $("#create-item").find("input[name='whois']").val('');
                $("#create-item").find("input[name='zip']").val('');
                getPageData();
                $(".modal").modal('hide');

                //toastr.success('Item Created Successfully.', 'Success Alert', {timeOut: 5000});
            });
        }else{
            alert('You are missing title or description.')
        }


    });


    /* Remove Item */
    $("body").on("click",".remove-item",function(){
        var id = $(this).parent("td").data('id');
        var c_obj = $(this).parents("tr");


        $.ajax({
            dataType: 'json',
            type:'POST',
            url: url + 'api/delete.php',
            data:{id:id}
        }).done(function(data){
            c_obj.remove();
            toastr.success('Item Deleted Successfully.', 'Success Alert', {timeOut: 5000});
            getPageData();
        });


    });


    /* Edit Item */
    $("body").on("click",".edit-item",function(){


        var id = $(this).parent("td").data('id');
        var title = $(this).parent("td").prev("td").prev("td").text();
        var description = $(this).parent("td").prev("td").text();


        $("#edit-item").find("input[name='title']").val(title);
        $("#edit-item").find("textarea[name='description']").val(description);
        $("#edit-item").find(".edit-id").val(id);


    });


    /* Updated new Item */
    $(".crud-submit-edit").click(function(e){


        e.preventDefault();
        var form_action = $("#edit-item").find("form").attr("action");
        var title = $("#edit-item").find("input[name='title']").val();


        var description = $("#edit-item").find("textarea[name='description']").val();
        var id = $("#edit-item").find(".edit-id").val();


        if(title != '' && description != ''){
            $.ajax({
                dataType: 'json',
                type:'POST',
                url: url + form_action,
                data:{title:title, description:description,id:id}
            }).done(function(data){
                getPageData();
                $(".modal").modal('hide');
                toastr.success('Item Updated Successfully.', 'Success Alert', {timeOut: 5000});
            });
        }else{
            alert('You are missing title or description.')
        }


    });
});

