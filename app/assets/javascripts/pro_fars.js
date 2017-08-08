function Seleccion_Articulo(id,laboratorio) {
	 $("#pro_far_producto_id").val(id);
	 $("#pro_far_farmacium_id").val(laboratorio);
}
 

 function update (id, activo) {
  if(activo==false)
    activo=true
  else
    activo= false
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



// funcion para eliminar producto_farmacia
function delete_producto_farmacia(id) {
    swal({
  title: 'Desea eliminar este producto su farmacia ?',
  text: "",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Si, eliminar.'
}).then(function () {
    $.ajax({
    url:  "/pro_fars/"+id,
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
