// Metodo ajax para actualizar estado de laboratorio farmacia

 function updateLaboratorio (id, activo) {
   if(activo==false)
    activo=true
  else
    activo= false
 	 $.ajax({
       url: '/lab_fars/'+id,
      method: 'put',
      data: JSON.stringify({ 
        activo: activo,

    }),
    contentType: "application/json; charset=utf-8",
        success:function(data){
              swal(
    'Estado Laboratorio',
    'Actualizado.',
    'success'
  )
        },
        error:function(data){
            alert('error');
        }
    });
 }
 // funcion para eliminar producto_farmacia
function delete_laboratorio_farmacia(id) {
    swal({
  title: 'Desea eliminar este laboratorio de su farmacia ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/lab_fars/"+id,
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
    
   }
});
})
}
// llamar url busqueda laboratorios de farmacia
function busquedaLabsFar()
{
    var nombre =  $("#nombre").val();

    window.location = '/lab_fars/busqueda/'+nombre;
}
// llamar url busqueda laboratorios farmacia anadidos
function busquedaLabsFarmaciaAgregados()
{
    var nombre =  $("#nombre").val();

    window.location = '/lab_fars/busquedalaboratoriosfarmacia/'+nombre;
}