<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
</head>
<body>
	<header class="fixed top-0 left-0 z-50 flex w-full items-center justify-around py-4">
  <h1 class="text-center text-5xl font-medium text-red-500">Netchis</h1>
  <form action="PeliculaServlet" method="get">
  	  <button class="btn bg-red-500 px-3 py-4 text-xl text-white transition-transform hover:scale-110">Ver Pelicuas</button>
  	
  </form>
</header>

<main>
  <section class="relative">
    <div>
      <img class="w-full h-svh  object-cover brightness-50" src="https://poptv.orange.es/wp-content/uploads/sites/3/2023/01/blue-monday-peliculas-alegrarte-dia-1100x648.jpg" />
    </div>
    <div class="absolute inset-0 flex flex-col items-center justify-center text-white ">
      <h2 class="text-5xl font-bold drop-shadow-lg">Las Mejores Películas del 2025</h2>
      <p class="py-6 text-2xl ">
        Descubre y alquila las mejores pelicuas..!!!
      </p>
      <button  onclick="my_modal_3.showModal()" class="btn bg-red-500 px-3 py-5 text-xl text-white transition-transform hover:scale-110">Registrar Pelicula</button>
      
    </div>
    
  </section>
  
  
</main>

<!-- You can open the modal using ID.showModal() method -->
<dialog id="my_modal_3" class="modal">
  <div class="modal-box">
    <form id="formularioPelicula" action="PeliculaServlet" method="post" autocomplete="off">

  <h3 class="text-lg font-bold mb-4">Registra la Película</h3>

  <label class="font-semibold ">Título:</label>
  <input 
    type="text" 
    name="titulo" 
    class="input input-bordered w-full mb-3"
    id="titulo"
  />
  <span class="text-red-500 text-sm" id="error-titulo"></span>
  
  <label class="font-semibold">Duración (minutos):</label>
  <input 
    type="number" 
    name="duracion" 
    class="input input-bordered w-full mb-1"
    id="duracion"
  />
  <span class="text-red-500 text-sm" id="error-duracion"></span>

  <label class="font-semibold">URL de la portada:</label>
  <input 
    type="url" 
    name="url_portada" 
    class="input input-bordered w-full mb-1"
    placeholder="https://example.com/imagen.jpg"
    id="url_portada"
  />
 

  <label class="font-semibold">Año:</label>
  <input 
    type="number" 
    name="anio" 
    class="input input-bordered w-full mb-1"
    id="anio"
  />
   <span class="text-red-500 text-sm" id="error-anio"></span>

  <label class="font-semibold ">Precio de alquiler (S/):</label>
  <input 
    type="number"
    name="precio_alquiler"
    class="input input-bordered w-full mb-1"
    id="precio_alquiler"
  />
  <span class="text-red-500 text-sm" id="error-precio_alquiler"></span>
  
  <label class="font-semibold ">Descripción:</label>
  <textarea 
    name="descripcion" 
    class="textarea textarea-bordered w-full mb-1"
    rows="3"
    id="descripcion"
    
  ></textarea>
 <span class="text-red-500 text-sm" id="error-descripcion"></span>
 
  <div class="flex justify-end gap-3">
    <button type="button" class="btn btn-ghost" onclick="my_modal_3.close()">Cancelar</button>
    <button 
      class="btn bg-red-500 px-4 py-2 text-white hover:scale-110 transition-transform duration-300" 
      type="submit">
      Registrar
    </button>
  </div>

</form>

  </div>
</dialog>

<script type="text/javascript">
		const validator = new JustValidate('#formularioPelicula');
		validator
		.addField('#titulo',[
			{rule:'required',errorMessage:'Titulo requerido'},
			{rule: 'minLength',  value: 3,errorMessage:'Minino 3 caracteres'},
			{rule: 'maxLength',  value: 40,errorMessage:'Maximo 40 caracteres'},
		],{errorsContainer: '#error-titulo'})
		
		.addField('#descripcion',[
			{rule:'required',errorMessage:'Descripcion requerida'},
			{rule: 'minLength',  value: 3,errorMessage:'Minino 3 caracteres'},
			{rule: 'maxLength',  value: 100,errorMessage:'Maximo 40 caracteres'},
		],{errorsContainer: '#error-descripcion'})
		
		.addField('#duracion',[
			{rule:'required',errorMessage:'Duración requerida'},
			{rule: 'number',errorMessage:'La duración debe ser un número'},
		],{errorsContainer: '#error-duracion'})
		
		.addField('#anio',[
			{rule:'required',errorMessage:'Año requerido'},
			{ rule: 'customRegexp', value: /^[0-9]{4}$/,errorMessage: 'Debe ser un número entero de 4 dígitos' },
		],{errorsContainer: '#error-anio'})
		
		.addField('#precio_alquiler',[
			{rule:'required',errorMessage:'Precio requerido'},
			{ rule: 'customRegexp', value: /^[0-9]+(\.[0-9]{1,2})?$/,errorMessage: 'Debe ser un número con hasta 2 decimales' },
		],{errorsContainer: '#error-precio_alquiler'})
		.onSuccess((event) => {
			  event.preventDefault(); // evita que recargue
			
			  const modalBox = document.querySelector('.modal-box');
			  const msg = document.createElement('p');
			  msg.className = "text-green-600 font-semibold mt-3";
			  msg.textContent = "Película registrada";
			
			  modalBox.appendChild(msg);
			  
			
	    	  setTimeout(() => {
	    		  msg.textContent = "";
	    		  event.target.submit();
	    	    }, 1000);
	    	  
	    	 
			});
		

	</script>
	
</body>
</html>