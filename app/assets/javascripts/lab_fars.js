// Metodo ajax para actualizar estado de laboratorio farmacia

 function updateLaboratorio (id, activo) {
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
