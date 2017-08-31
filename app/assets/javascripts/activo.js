
// actualizar activo
function Activo (id, activo, elemento) {
  if(activo==false)
    activo=true
  else
    activo= false
  
   $.ajax({
       url: '/'+elemento+'_activo/'+id,
      method: 'put',
      data: JSON.stringify({ 
        activo: activo,

    }),
    contentType: "application/json; charset=utf-8",
        success:function(data){
              swal(
    'Estado '+elemento,
    'Actualizado.',
    'success'
  )
        },
        error:function(data){
            alert('error');
        }
    });
 }



function verificarPago (id, verificado, farmacia_id) {
  
swal({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!',
  cancelButtonText: 'No, cancel!',
  confirmButtonClass: 'btn btn-success',
  cancelButtonClass: 'btn btn-danger',
  buttonsStyling: false
}).then(function () {
  
  
   $.ajax({
       url: '/pagos/'+id+'/'+farmacia_id,
      method: 'put',
      data: JSON.stringify({ 

    }),
    contentType: "application/json; charset=utf-8",
        success:function(data){
              swal(
    'Verificación de pago',
    'Actualizado.',
    'success'
  )
        }
    });
}, function (dismiss) {
  // dismiss can be 'cancel', 'overlay',
  // 'close', and 'timer'
  if (dismiss === 'cancel') {
    window.location = '/pagos';
  }
})
}

