<%@page import="modelo.Categoria"%>
<%@page import="java.util.Map"%>
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
<style>
    body {
        background: #141414;
    }
    .category-scroll {
        overflow-x: auto;
        scrollbar-width: thin;
        scrollbar-color: #4a4a4a #141414;
    }
    .category-scroll::-webkit-scrollbar {
        height: 8px;
    }
    .category-scroll::-webkit-scrollbar-track {
        background: #141414;
    }
    .category-scroll::-webkit-scrollbar-thumb {
        background: #4a4a4a;
        border-radius: 4px;
    }
    .movie-card {
        transition: transform 0.3s ease, z-index 0s 0.3s;
    }
    .movie-card:hover {
        transform: scale(1.05);
        z-index: 10;
    }
    .hero-background {
        background: linear-gradient(to bottom, rgba(20,20,20,0) 0%, rgba(20,20,20,1) 100%),
                    linear-gradient(to right, rgba(20,20,20,0.8) 0%, rgba(20,20,20,0) 50%),
                    url('https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=1920');
        background-size: cover;
        background-position: center;
    }
</style>
<body class="min-h-screen w-full">
    <header class="fixed top-0 left-0 right-0 z-50 bg-gradient-to-b from-black to-transparent px-8 py-4">
        <div class="flex items-center justify-between">
            <h1 class="text-red-600 text-4xl font-bold" style="font-family: Arial, sans-serif; letter-spacing: -2px;">NETFLIX</h1>
            <div class="flex items-center gap-6">
                <a href="Autenticacion" class="text-white hover:text-gray-300 transition cursor-pointer">Inicio</a>
                <button class="text-white hover:text-gray-300 transition cursor-pointer">Series</button>
                <button class="text-white hover:text-gray-300 transition cursor-pointer">Películas</button>
                <form action="registroPeliculasServlet" method="get">
				    <button type="submit" class="text-white hover:text-gray-300 transition cursor-pointer">
				        Mi lista
				    </button>
				</form>
			
            </div>
        </div>
    </header>

    <section class="hero-background h-[80vh] flex items-end pb-32 px-8 mb-8">
        <div class="max-w-2xl">
            <h2 class="text-white text-6xl font-bold mb-4">Bienvenido a Netflix</h2>
            <p class="text-white text-xl mb-6">
                Miles de películas y series para disfrutar. Explora nuestro catálogo completo.
            </p>
            <div class="flex gap-4">
                <button class="btn bg-white hover:bg-gray-200 border-none text-black font-semibold px-8">
                    ▶ Reproducir
                </button>
                <button class="btn bg-gray-600 bg-opacity-70 hover:bg-opacity-50 border-none text-white px-8">
                    ℹ Más información
                </button>
            </div>
        </div>
    </section>

    <main class="px-8 pb-12 -mt-32 relative z-10">

<%
    List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("peliculas");

    String categoriaActual = null;
    if (peliculas != null) {
        for (Pelicula pelicula : peliculas) {
            
            if (!pelicula.getNombreCategoria().equals(categoriaActual)) {
                if (categoriaActual != null) { %>
                    </div>
                <% }
                categoriaActual = pelicula.getNombreCategoria(); %>

                <div class="mb-12">
                    <h2 class="text-white text-2xl font-semibold mb-4"><%= categoriaActual %></h2>
                    <div class="category-scroll flex gap-3 pb-4">
            <% } %>

            <div class="movie-card flex-shrink-0 w-72 bg-neutral-800 rounded-lg overflow-hidden cursor-pointer group relative">
                <div class="relative">
                    <img class="w-full h-40 object-cover" 
                         src="<%= pelicula.getUrl_portada() %>" 
                         alt="<%= pelicula.getTitulo() %>"/>
                    <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-60 transition-all duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">
                        <button class="btn btn-circle btn-sm bg-white border-none hover:bg-gray-200">▶</button>
                    </div>
                </div>

                <div class="p-4">
                    <h3 class="text-white font-semibold text-lg mb-2 line-clamp-1">
                        <%= pelicula.getTitulo() %>
                    </h3>

                    <div class="flex items-center gap-2 text-sm text-gray-400 mb-2">
                        <span class="text-green-500 font-semibold"><%= pelicula.getAnio() %></span>
                        <span>•</span>
                        <span><%= pelicula.getDuracion() %> min</span>
                    </div>

                    <p class="text-gray-300 text-sm line-clamp-2 mb-3">
                        <%= pelicula.getDescripcion() %>
                    </p>

                    <div class="flex gap-2">
                        <button class="btn btn-sm flex-1 bg-red-600 hover:bg-red-700 border-none text-white" onclick="toggleAlquiler(this)">
                            <span class="alquilar-text">Alquilar</span>
                            <span class="alquilado-text hidden">✓ Alquilado</span>
                        </button>
                        <button class="btn btn-sm btn-circle btn-outline border-gray-600 text-white hover:bg-gray-700">+</button>
                    </div>
                </div>
            </div>

<%      } 
        if (categoriaActual != null) { %>
            </div> 
        </div>
<%  }} 
%>

</main>


   
    
    <script>
        function toggleAlquiler(button) {
            const alquilarText = button.querySelector('.alquilar-text');
            const alquiladoText = button.querySelector('.alquilado-text');
            
            if (alquilarText.classList.contains('hidden')) {
                alquilarText.classList.remove('hidden');
                alquiladoText.classList.add('hidden');
                button.classList.remove('bg-green-600', 'hover:bg-green-700');
                button.classList.add('bg-red-600', 'hover:bg-red-700');
            } else {
                alquilarText.classList.add('hidden');
                alquiladoText.classList.remove('hidden');
                button.classList.remove('bg-red-600', 'hover:bg-red-700');
                button.classList.add('bg-green-600', 'hover:bg-green-700');
            }
        }

        function abrirModalAgregar() {
            document.getElementById('modal_agregar').showModal();
        }

        function cerrarModalAgregar() {
            document.getElementById('modal_agregar').close();
        }
    </script>
</body>
</html>