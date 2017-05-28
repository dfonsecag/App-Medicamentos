
  

// funcion para eliminar laboratorio
function delete_laboratorio(id) {
    swal({
  title: 'Desea eliminar este laboratorio   ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/laboratorios/"+id,
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