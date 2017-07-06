

// funcion para eliminar sustancia
function delete_sustancia(id) {
    swal({
  title: 'Desea eliminar este sustancia   ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/sustancia/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'sustancia eliminada.',
    'success'
  )
    },
     error: function(data) {
       swal(
  'Existen productos relacionados a esta Sustancia',
  '',
  'error'
)
   }
});
})
}