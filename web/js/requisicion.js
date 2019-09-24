window.errorDet = [];

$('.multiple-input').on('afterInit', function() 
{
    if($('.list-cell__det_clave').find('input').val()!="")
    {
        $('.btn-success').click();

    }else{
        validateDetalles();
    }
    $('.list-cell__det_id').hide();
    $('#alert-id').find('.close').attr("data-dismiss","modal"); 


   
    $('#ModalDet').modal('show');
    setTimeout(function() {
            $('#ModalDet').modal('hide');
    }, 2500);

    $('#alert-det').find('.close').attr('data-dismiss','modal');



}).on('afterAddRow', function(e, row, currentIndex) 
{
    $('.list-cell__det_id').hide();

    var first = $('.js-input-plus').clone();
    var last = $('.js-input-remove').first().clone();
    $('.js-input-plus').replaceWith(last);
    $('.multiple-input-list__btn').first().replaceWith(first);

    validateDetalles();
 
}).on('beforeAddRow', function(e, row, currentIndex)
{
    if(errorDet.length!=0){
        return false;
    }
}).on('beforeDeleteRow', function(e, row, currentIndex)
{
    var conf;

    if ($(row).find('input').eq(1).val()== ""){
        conf = true;
    }
    else {
        conf =  confirm('¿Seguro que quieres eliminar esta fila?');
    }

    if(conf){
        $(row).find('input').each(
            function(index,det) {
              removeError($(det).attr('id'));
            }
        );
    }
    return conf;
});

//on change
function validateDetalles(){

    $("[id^='reqdetalle-temp']").on('change.yii',function(){
    var detalle =$(this).attr('id');

        if (detalle.includes('det_clave')){
            if($(this).val().length > 100)
            {

                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Clave  debería contener hasta 100 caracteres."]);
                addError(detalle);

            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_partida')){

            if($(this).val().length > 6)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Partida  debería contener hasta 6 caracteres."]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_cantidad')){
            
            if($(this).val().length > 14)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería contener hasta 14 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_unidad')){
            if($(this).val().length > 20)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Unidad debería contener hasta 20 caracteres"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('det_descripcion')){
            if($(this).val().length > 5000)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Descripcion debería contener hasta 500 caracteres"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }
        
        }
        if (detalle.includes('det_costo')){
            
            if($(this).val().length > 14)
            {
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Costo debería contener hasta 14 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Costo debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#requisicion-form').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }
        }

    });
}

function removeError(detalle){
    var index = errorDet.indexOf(detalle);
    
    if(index!=-1){
        errorDet.splice(index);
    }

}

function addError(detalle){
    var index = errorDet.indexOf(detalle);

    if(index==-1){
       errorDet.push(detalle);
    }

}

$('#requisicion-form').on('submit', function (e) {
   
    if(errorDet.length!=0){

        $('#ModalCenter').modal('toggle');
        
        setTimeout(function() {
            $('#ModalCenter').modal('hide');
        }, 2500);
        e.preventDefault();
        
        return false;
   }
}); 


    function actualizarFirmas(a, b, c)
    {
        $('#fSuperior').val(a);
        $('#fPlaneacion').val(b);
        $('#fDirector').val(c);
        $('#alertFirmas').alert('close');
    }