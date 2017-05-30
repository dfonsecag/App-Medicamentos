

// funcion para eliminar producto
function delete_producto(id) {
    swal({
  title: 'Desea eliminar este producto ?',
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
     alert('No fue eliminado');
   }
});
})
}
function Hablilitar() {
  if( $('#plan').prop('checked') ) {    
    $('#plan_paciente').show();
    $('#oferta').show();
}
else{
  $('#plan_paciente').hide();
    $('#oferta').hide();
    $("#producto_plan_paciente_id").val("");
    $("#producto_oferta").val("");
}
}