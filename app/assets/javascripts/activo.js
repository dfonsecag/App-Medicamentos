
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



function verificarPago (id, farmacia_id) {
  
swal({
  title: 'Desea verificar este pago farmacia ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, verificar',
  cancelButtonText: 'No, cancelar',
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

// llamar url busqueda pagos
function busquedaPagos()
{
    var nombre =  $("#nombre").val();

    window.location = '/pagos/busqueda/'+nombre;
}

