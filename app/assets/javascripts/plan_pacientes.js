#Crear laboratorio por ajax
function crearTodos() {
	var data = $(this).serializeArray();

	 $.ajax({
      url: '/todos',
      method: 'post',
      data: JSON.stringify({ 
        // Those property names must match the property names of your PromotionDecision  view model
        description: $('#description').val(), 
        priority: $('#priority').val()
    }),
    contentType: "application/json; charset=utf-8",
      success: function(data) {
       alert('creado exitosamente');
   },
   error: function(data) {
    alert('Verificar que los campos necesarios esten completos.');
   }

    });
}