

 function updatefarmacia (id, activo) {

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

