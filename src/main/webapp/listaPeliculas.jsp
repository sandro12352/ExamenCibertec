<%@page import="modelo.Pelicula"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-neutral-900  min-h-screen w-full">
	<header class="w-full items-center justify-around py-4">
	  <h1 class="text-center text-5xl text-white mb-5">Lista de Peliculas</h1>
	  
	  	
		
	</header>
	<main class="flex gap-1 p-5 gap-5 flex-wrap justify-center min-h-screen w-full">
	  		<%
	  			List<Pelicula> peliculas = (List<Pelicula>)request.getAttribute("listaPeliculas");
	  			if(peliculas !=null){
	  		    for(Pelicula pelicula:peliculas){
	  		%>
	  	
			 <div class="card card-side bg-base-100 shadow-sm h-90 w-3xl transition-transform duration-700 hover:scale-99">
				  <figure class="w-70 flex-shrink-0">
				    <img 
				      class="w-full h-full object-cover" 
				      src="<%=pelicula.getUrl_portada() %>" 
				      alt="Movie" 
				    />
				  </figure>
				  <div class="card-body flex flex-col justify-between">
				    <div>
				      <h2 class="card-title line-clamp-2"><%= pelicula.getTitulo() %></h2>
				      <p><strong>Codigo:</strong><%= pelicula.getId_pelicula() %></p>
				      <p><strong>Duración:</strong> <%= pelicula.getDuracion() %> minutos</p>
				      <p><strong>Año:</strong> <%= pelicula.getAnio() %></p>
				      <p><strong>Precio alquiler:</strong> S/ <%= pelicula.getPrecio_alquiler() %></p>
				       <p class="line-clamp-3">
				        <strong>Descripción:</strong> <%= pelicula.getDescripcion() %>
				      </p>
				    </div>
				    <div class="card-actions justify-end mt-4">
						  <button 
						    class="btn btn-accent group"
						    onclick="this.classList.toggle('btn-success'); this.classList.toggle('btn-accent');"
						  >
						    <svg class="text-white group-[.btn-success]:hidden" xmlns="http://www.w3.org/2000/svg" width="24" 
						      height="24" 
						      viewBox="0 0 24 24" 
						      fill="none" 
						      stroke="currentColor" 
						      stroke-width="2" 
						      stroke-linecap="round" 
						      stroke-linejoin="round"
						    >
						      <circle cx="12" cy="12" r="10"/>
						    </svg>
						    
						    <svg 
						      class="text-white hidden group-[.btn-success]:block" 
						      xmlns="http://www.w3.org/2000/svg" 
						      width="24" 
						      height="24" 
						      viewBox="0 0 24 24" 
						      fill="none" 
						      stroke="currentColor" 
						      stroke-width="2" 
						      stroke-linecap="round" 
						      stroke-linejoin="round"
						    >
						      <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
						      <polyline points="22 4 12 14.01 9 11.01"/>
						    </svg>
						    
						    <span class="group-[.btn-success]:hidden">Alquilar</span>
						    <span class="hidden group-[.btn-success]:inline">Alquilado</span>
						  </button>
						</div>
				  </div>
				</div>
		      <% 
			  	}}
		      %>
      
		</main>
	
		<form action="registroPelicula.jsp" method="get">
    <button class="btn bg-red-500 px-3 py-4 text-xl text-white transition-transform hover:scale-110">Volver..</button>
  </form>
	
	
</body>
</html>