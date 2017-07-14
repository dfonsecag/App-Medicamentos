function Seleccion_Articulo(id,laboratorio) {
	 $("#pro_far_producto_id").val(id);
	 $("#pro_far_farmacium_id").val(laboratorio);
}
 

 function update (id, activo) {
 	 $.ajax({
       url: '/pro_farmacia_update/'+id,
      method: 'put',
      data: JSON.stringify({ 
        activo_produc: activo,

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
