// funcion para eliminar Plan paciente
function deletePlanPaciente(id) {
    swal({
  title: 'Desea eliminar este plan paciente ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/plan_pacientes/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'Plan Paciente eliminado.',
    'success'
  )
    },
     error: function(data) {
       swal(
  'Existen productos relacionados a este Plan Paciente',
  '',
  'error'
)
   }
});
})
}