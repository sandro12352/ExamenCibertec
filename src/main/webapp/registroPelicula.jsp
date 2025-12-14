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
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
</head>
<style>
    body {
        background: #141414;
    }
</style>
<body class="min-h-screen w-full">
    <header class="fixed top-0 left-0 right-0 z-50 bg-black px-8 py-4 shadow-lg">
        <div class="flex items-center justify-between">
            <h1 class="text-red-600 text-4xl font-bold" style="font-family: Arial, sans-serif; letter-spacing: -2px;">NETFLIX</h1>
            <div class="flex items-center gap-6">
                <form action="PeliculaServlet" method="get" class="inline">
                    <button type="submit" class="text-white hover:text-gray-300 transition cursor-pointer">Volver al Catálogo</button>
                </form>
                <button onclick="abrirModalAgregar()" class="btn btn-sm bg-red-600 hover:bg-red-700 border-none text-white">
                    + Agregar Película
                </button>
            </div>
        </div>
    </header>

    <main class="pt-28 px-8 pb-12">
        <div class="bg-neutral-900 rounded-lg p-6 shadow-xl">
            <h2 class="text-white text-3xl font-bold mb-6">Administrar Películas</h2>
            
            <div class="overflow-x-auto">
                <table class="table ">
                    <thead>
                        <tr class="text-white bg-neutral-800">
                            <th>ID</th>
                            <th>Portada</th>
                            <th>Título</th>
                            <th>Categoría</th>
                            <th>Año</th>
                            <th>Duración</th>
                            <th>Descripción</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("listaPeliculas");
                            if (peliculas != null && !peliculas.isEmpty()) {
                                for (Pelicula pelicula : peliculas) {
                        %>
                        <tr class="text-gray-300 ">
                            <td class="font-semibold"><%= pelicula.getId_pelicula() %></td>
                            <td>
                                <div class="avatar">
                                    <div class="w-16 h-24 rounded">
                                        <img src="<%= pelicula.getUrl_portada() %>" alt="<%= pelicula.getTitulo() %>" class="object-cover" />
                                    </div>
                                </div>
                            </td>
                            <td class="font-semibold text-white max-w-xs">
                                <%= pelicula.getTitulo() %>
                            </td>
                            <td>
                                <span class="badge badge-outline badge-accent">
                                    <%= pelicula.getNombreCategoria()%>
                                </span>
                            </td>
                            <td><%= pelicula.getAnio() %></td>
                            <td><%= pelicula.getDuracion() %> min</td>
                            <td class="max-w-sm">
                                <p class=" text-sm"><%= pelicula.getDescripcion() %></p>
                            </td>
                            <td>
                                <div class="flex gap-2 justify-center">
                                    <button class="btn-edit btn btn-sm bg-blue-600 hover:bg-blue-700 border-none text-white"
                                    	data-id=<%=pelicula.getId_pelicula() %>
                                    	data-titulo="<%=pelicula.getTitulo() %>"
                                    	data-anio=<%=pelicula.getAnio()%>
                                    	data-duracion=<%=pelicula.getDuracion()%>
                                    	data-categoria=<%=pelicula.getId_categoria()%>
                                    	data-url_portada=<%=pelicula.getUrl_portada()%>
                                    	data-descripcion="<%=pelicula.getDescripcion() %>"
                                    
                                    >
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                                            <path d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z" />
                                            <path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" clip-rule="evenodd" />
                                        </svg>
                                        Editar
                                    </button>
                                  
                                    <button onclick="confirmarEliminar(<%= pelicula.getId_pelicula() %>, '<%= pelicula.getTitulo() %>')" class="btn btn-sm bg-red-600 hover:bg-red-700 border-none text-white">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
                                        </svg>
                                        Eliminar
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center text-gray-400 py-8">
                                No hay películas registradas
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <dialog id="modal_agregar" class="modal">
        <div class="modal-box bg-neutral-900 text-white max-w-2xl">
            <h3 id="titulo-modal" class="font-bold text-2xl mb-6">Agregar Nueva Película</h3>
            
            <form action="PeliculaServlet" method="post" class="space-y-4">
            <input type="hidden" id="accion" name="accion" value="agregar" />
    		<input type="hidden" id="id_pelicula" name="id_pelicula" value="" />
                <div class="form-control">
                    <label class="label">
                        <span class="label-text text-white">Título</span>
                    </label>
                    <input type="text" id="titulo" name="titulo" placeholder="Ej: El Padrino" class="input input-bordered bg-neutral-800 text-white w-full" required />
                </div>	

                <div class="grid grid-cols-2 gap-4">
                    <div class="form-control">
                        <label class="label">
                            <span class="label-text text-white">Año</span>
                        </label>
                        <input type="number" id="anio" name="anio" placeholder="2024" class="input input-bordered bg-neutral-800 text-white w-full" required />
                    </div>

                    <div class="form-control">
                        <label class="label">
                            <span class="label-text text-white">Duración (min)</span>
                        </label>
                        <input type="number" id="duracion" name="duracion" placeholder="120" class="input input-bordered bg-neutral-800 text-white w-full" required />
                    </div>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text text-white">Categoría</span>
                    </label>
                    <select id="categoria" name="id_categoria" class="select select-bordered bg-neutral-800 text-white w-full" required>
                        <option value="">Selecciona una categoría</option>
                        <option value="1">Acción</option>
                        <option value="2">Comedia</option>
                        <option value="3">Drama</option>
                        <option value="4">Terror</option>
                        <option value="5">Ciencia Ficción</option>
                        <option value="6">Romance</option>
                    </select>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text text-white">URL de Portada</span>
                    </label>
                    <input type="url" id="url_portada" name="url_portada" placeholder="https://ejemplo.com/imagen.jpg" class="input input-bordered bg-neutral-800 text-white w-full" required />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text text-white">Descripción</span>
                    </label>
                    <textarea name="descripcion" id="descripcion" rows="4" placeholder="Escribe una breve descripción de la película..." class="textarea textarea-bordered bg-neutral-800 text-white w-full" required></textarea>
                </div>

                <div class="modal-action">
                    <button type="button" onclick="cerrarModalAgregar()" class="btn btn-ghost text-white">Cancelar</button>
                    <button type="submit" class="btn bg-red-600 hover:bg-red-700 border-none text-white">Guardar Película</button>
                </div>
            </form>
        </div>
        <form method="dialog" class="modal-backdrop">
            <button>cerrar</button>
        </form>
    </dialog>

    <dialog id="modal_eliminar" class="modal">
        <div class="modal-box bg-neutral-900 text-white">
            <h3 class="font-bold text-xl mb-4">Confirmar Eliminación</h3>
            <p class="mb-6">¿Estás seguro de que deseas eliminar la película <strong id="titulo_eliminar"></strong>?</p>
            <p class="text-red-500 text-sm mb-4">Esta acción no se puede deshacer.</p>
            
            <div class="modal-action">
                <button onclick="cerrarModalEliminar()" class="btn btn-ghost text-white">Cancelar</button>
                <form id="form_eliminar" action="eliminarPeliculaServlet" method="post" class="inline">
                    <input type="hidden" id="id_eliminar" name="id_pelicula" value="" />
                    <button type="submit" class="btn bg-red-600 hover:bg-red-700 border-none text-white">Eliminar</button>
                </form>
            </div>
        </div>
        <form method="dialog" class="modal-backdrop">
            <button>cerrar</button>
        </form>
    </dialog>
    
    
    
    <script>
    document.querySelectorAll(".btn-edit").forEach(btn => {
        btn.addEventListener("click", (e) => {
            const button = e.currentTarget;

            document.getElementById("titulo-modal").innerText = "Editar Película";
            document.getElementById("accion").value = "actualizar";  // importante
            document.getElementById("id_pelicula").value = button.dataset.id; // pasar id al formulario
            document.getElementById("titulo").value = button.getAttribute("data-titulo");
            document.getElementById("anio").value = button.getAttribute("data-anio");
            document.getElementById("duracion").value = button.getAttribute("data-duracion");
            document.getElementById("categoria").value = button.getAttribute("data-categoria");
            document.getElementById("url_portada").value = button.getAttribute("data-url_portada");
            document.getElementById("descripcion").value = button.getAttribute("data-descripcion");
			console.log( document.getElementById("id_pelicula").value);
            document.getElementById("modal_agregar").showModal();
        });
    });

	
    
    
        function abrirModalAgregar() {
        	document.getElementById('titulo-modal').innerText = 'Agregar Nueva Película';
            document.getElementById('accion').value = 'agregar';
            document.getElementById('id_pelicula').value = '';
            document.getElementById("titulo").value = "";
            document.getElementById("anio").value = "";
            document.getElementById("duracion").value = "";
            document.getElementById("categoria").value = "";
            document.getElementById("url_portada").value = "";
            document.getElementById("descripcion").value = "";
            document.getElementById('modal_agregar').showModal();
        }

        function cerrarModalAgregar() {
            document.getElementById('modal_agregar').close();
        }

        function editarPelicula(id) {
            // Redirigir al servlet de edición
            window.location.href = 'editarPelicula?id=' + id;
        }

        function confirmarEliminar(id, titulo) {
            document.getElementById('id_eliminar').value = id;
            document.getElementById('titulo_eliminar').textContent = titulo;
            document.getElementById('modal_eliminar').showModal();
        }

        function cerrarModalEliminar() {
            document.getElementById('modal_eliminar').close();
        }
    </script>
</body>
</html>