$(function(){
    Dropzone.autoDiscover = false;

    $("#my-dropzone").dropzone({
        maxFilesize: 1,
        addRemoveLinks: true,
        paramName: 'upload[image]'
    });
});