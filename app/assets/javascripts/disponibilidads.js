
  

// funcion para eliminar disponibilidad
function delete_disponibilidad(id) {
    swal({
  title: 'Desea eliminar este disponibilidad   ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/disponibilidads/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'disponibilidad eliminada.',
    'success'
  )
    },
     error: function(data) {
     alert('No fue eliminado');
   }
});
})
}