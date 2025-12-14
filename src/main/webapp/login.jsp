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
    
</style>
<body class="min-h-screen flex items-center justify-center bg-[linear-gradient(to_bottom,rgba(0,0,0,0.7),rgba(0,0,0,0.9)),url('https://assets.nflxext.com/ffe/siteui/vlv3/29b665f6-0a62-4745-b9c2-f617fb7eadc6/web/PE-es-20251208-TRIFECTA-perspective_2c7ec717-a137-4e30-a156-9bb2046a2d6f_large.jpg')]">

    <div class="absolute top-8 left-8">
        <h1 class="text-red-600 text-4xl font-bold" style="font-family: Arial, sans-serif; letter-spacing: -2px;">NETFLIX</h1>
    </div>

    <div class="bg-black/75 backdrop-blur-md w-full max-w-md rounded-lg p-16 shadow-2xl">
        <h2 class="text-white text-3xl font-medium mb-8">Inicia sesión</h2>
        
        <form id="formularioLogin" action="Autenticacion" method="post" autocomplete="off" class="space-y-6">
            <div class="form-control">
                <input 
                    type="text" 
                    id="usuario"
                    name="usuario" 
                    placeholder="Email o número de teléfono" 
                    class="input w-full bg-neutral-700 border-none text-white placeholder-gray-400 focus:bg-neutral-600 rounded px-5 py-4 h-auto"
                    required 
                />
            </div>
            
            <div class="form-control">
                <input 
                    type="password" 
                    id="password"
                    name="password" 
                    placeholder="Contraseña" 
                    class="input w-full bg-neutral-700 border-none text-white placeholder-gray-400 focus:bg-neutral-600 rounded px-5 py-4 h-auto"
                    required 
                />
            </div>
            
            <button type="submit"  class="btn w-full bg-red-600 hover:bg-red-700 border-none text-white font-medium text-base h-12 rounded">
                Iniciar sesión
            </button>
            
            <div class="flex items-center justify-between text-sm">
                <label class="flex items-center text-gray-300 cursor-pointer">
                    <input type="checkbox" name="remember" class="checkbox checkbox-sm mr-2 border-gray-400" />
                    Recuérdame
                </label>
                <a href="#" class="text-gray-300 hover:underline">¿Necesitas ayuda?</a>
            </div>
        </form>
        
        <% 
        String error =(String) request.getAttribute("error");
        if (error != null) {
        %>
            <div class="alert bg-orange-600 text-white mt-4 rounded border-none">
                <span><%=error %></span>
            </div>
        <% } %>
        
        <div class="mt-16 text-gray-400">
            <p class="mb-2">¿Primera vez en Netflix? <a href="#" class="text-white hover:underline">Suscríbete ahora</a>.</p>
            <p class="text-xs mt-4">Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot. <a href="#" class="text-blue-500 hover:underline">Más info</a>.</p>
        </div>
    </div>
    
    <div class="absolute bottom-8 left-0 right-0 px-8">
        <div class="max-w-4xl mx-auto text-gray-400 text-sm">
            <p class="mb-4">¿Preguntas? Llama al <a href="#" class="underline">0-800-000-0000</a></p>
            <div class="grid grid-cols-4 gap-4 text-xs">
                <a href="#" class="hover:underline">Preguntas frecuentes</a>
                <a href="#" class="hover:underline">Centro de ayuda</a>
                <a href="#" class="hover:underline">Términos de uso</a>
                <a href="#" class="hover:underline">Privacidad</a>
            </div>
        </div>
    </div>
</body>
</html>


<script type="text/javascript">
		const validator = new JustValidate('#formularioLogin');
		validator
		.addField('#usuario',[
			{rule:'required',errorMessage:'usuario requerido'},
		],{errorsContainer: '#error-titulo'})
		.addField('#password',[
			{rule:'required',errorMessage:'contraseña requerida'},
		],{errorsContainer: '#error-precio_alquiler'})
		.onSuccess((event) => {
			  event.preventDefault(); // evita que recargue
	    		  event.target.submit();
			});
		

	</script>