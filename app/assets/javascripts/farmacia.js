// funcion para eliminar laboratorio
function delete_farmacia(id,nombre) {
    swal({
  title: 'Desea eliminar la farmacia '+nombre+'?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/farmacia/"+id,
    method: "delete",
    success: function(data) { 
        $("#"+id).remove();
          swal(
    'Eliminado!',
    'Farmacia eliminada.',
    'success'
  )
    },
     error: function(data) {
     swal(
  'Existen productos relacionados a este laboratorio',
  '',
  'error'
)
   }
});
})
}


 function updatefarmacia (id, activo) {
  if(activo==false)
    activo=true
  else
    activo= false

  swal.queue([{
  title: 'Verificar Farmacia',
  confirmButtonText: 'Verificar',
  text:
    'Se le notificará por medio correo eléctronico a la Farmacia.',
  showLoaderOnConfirm: true,
  preConfirm: function () {
    return new Promise(function (resolve) {
     $.ajax({
       url: '/farmacia_verificado/'+id,
      method: 'put',
      data: JSON.stringify({ 
      activo: activo

    }),
    contentType: "application/json; charset=utf-8",
        success:function(data){
              swal.insertQueueStep("Famacia Verificada")
          resolve()
        }
    });

    })
  }
}])

}

