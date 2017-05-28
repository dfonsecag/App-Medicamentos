// funcion para eliminar laboratorio
function delete_tipoplan(id) {
    swal({
  title: 'Desea eliminar esta descripción ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/tipo_plans/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'Laboratorio eliminado.',
    'success'
  )
    },
     error: function(data) {
     alert('No fue eliminado');
   }
});
})
}