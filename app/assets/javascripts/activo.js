
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

