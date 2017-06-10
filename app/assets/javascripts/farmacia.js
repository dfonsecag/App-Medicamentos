

 function updatefarmacia (id, activo) {
 	 $.ajax({
       url: '/farmacia_verificado/'+id,
      method: 'put',
      data: JSON.stringify({ 
        activo: activo

    }),
    contentType: "application/json; charset=utf-8",
        success:function(data){
              swal(
    'Estado Producto',
    'Actualizado.',
    'success'
  )
        },
        error:function(data){
            alert('error');
        }
    });
 }
