

// funcion para eliminar producto
function delete_producto_id(id) {
    swal({
  title: 'Desea eliminar este  ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/productos/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'producto eliminado.',
    'success'
  )
    },
     error: function(data) {
     swal(
  'Existen farmacias con este productos relacionado.',
  '',
  'error'
)
   }
});
})
}
function Verificar() {
  alert($("#producto_laboratorio_id").val());
}
function Hablilitar() {
      $("#producto_plan_paciente_id option").remove();
  if( $('#plan').prop('checked') ) {    
       $.ajax({
    url:  "/plan_paciente/"+$("#producto_laboratorio_id").val(),
    method: "get",
    success: function(data) {
    if(data=='')  {
      swal('Laboratorio seleccionado no dispone plan paciente','','error')       
    } 
      else   
      {
         $("#producto_oferta1").val(1);
        $("#producto_oferta2").val(1);
        $('#plan_paciente').show();
        $('#divoferta1').show();
        $('#divoferta2').show();
      $("#producto_plan_paciente_id").append('<option value='+data[0].laboratorio_id+'>'+data[0].nombre+'</option>');      
      }
    },
     error: function(data) {
   
   }
});
   
}
else{
  $('#plan_paciente').hide();
     $("#producto_oferta1").val(0);
    $("#producto_oferta2").val(0);
    $('#plan_paciente').hide();
    $('#divoferta1').hide();
    $('#divoferta2').hide();
}
}