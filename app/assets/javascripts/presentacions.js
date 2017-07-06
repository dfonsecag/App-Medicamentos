

// funcion para eliminar presentacion
function delete_presentacion(id) {
    swal({
  title: 'Desea eliminar este presentación   ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/presentacions/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'presentación eliminada.',
    'success'
  )
    },
     error: function(data) {
       swal(
  'Existen productos relacionados a esta Presentación',
  '',
  'error'
)
   }
});
})
}