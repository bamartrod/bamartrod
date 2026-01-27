# Vim Cheat Sheet - Comandos del Día a Día
## Para Brandon Martinez - Backend Developer

---

## 🚀 INICIO RÁPIDO (Primeros 5 minutos)

```bash
# Abrir Vim con un archivo
vim MiClase.java

# Dentro de Vim:
Ctrl+n          # Abrir explorador de archivos
Ctrl+p          # Buscar archivos rápidamente
i               # Entrar en modo inserción (para escribir)
ESC             # Volver a modo normal
:w              # Guardar
:q              # Salir
```

---

## 📁 NAVEGACIÓN DE PROYECTO

### Abrir y Buscar Archivos
```vim
Ctrl+n          # Toggle NERDTree (explorador)
Ctrl+p          # Buscar archivos por nombre (fuzzy)
Ctrl+f          # Buscar dentro de archivos (contenido)
Space+b         # Lista de buffers abiertos
Space+h         # Historial de archivos recientes

# En NERDTree:
Enter           # Abrir archivo
s               # Abrir en split vertical
i               # Abrir en split horizontal
t               # Abrir en nueva pestaña
m               # Menú (crear, eliminar, mover archivos)
R               # Refrescar árbol
?               # Ayuda
```

### Navegación entre Archivos Abiertos
```vim
Space+bn        # Siguiente buffer
Space+bp        # Buffer anterior
Space+bd        # Cerrar buffer actual
:ls             # Listar todos los buffers
:b 3            # Ir al buffer número 3
```

---

## ✏️ EDICIÓN DE CÓDIGO

### Modos Básicos
```vim
i               # Insertar antes del cursor
a               # Insertar después del cursor
I               # Insertar al inicio de la línea
A               # Insertar al final de la línea
o               # Nueva línea abajo
O               # Nueva línea arriba
ESC             # Volver a modo normal
```

### Copiar, Cortar, Pegar
```vim
yy              # Copiar línea
3yy             # Copiar 3 líneas
dd              # Cortar línea
3dd             # Cortar 3 líneas
p               # Pegar abajo
P               # Pegar arriba
"+y             # Copiar al portapapeles del sistema
"+p             # Pegar desde portapapeles del sistema
```

### Deshacer y Rehacer
```vim
u               # Deshacer
Ctrl+r          # Rehacer
.               # Repetir último comando
```

### Buscar y Reemplazar
```vim
/texto          # Buscar "texto"
n               # Siguiente ocurrencia
N               # Anterior ocurrencia
:%s/viejo/nuevo/g       # Reemplazar en todo el archivo
:s/viejo/nuevo/g        # Reemplazar en línea actual
:%s/viejo/nuevo/gc      # Reemplazar con confirmación
```

---

## 🔧 DESARROLLO JAVA

### Autocompletado
```vim
# En modo inserción:
Tab             # Activar autocompletado
Shift+Tab       # Navegar hacia atrás
Enter           # Seleccionar opción
Ctrl+Space      # Forzar autocompletado
```

### Navegación de Código
```vim
gd              # Ir a definición (Go to Definition)
gr              # Ver referencias (Go to References)
gi              # Ir a implementación
gy              # Ir a tipo
K               # Ver documentación (hover)
Ctrl+o          # Volver atrás
Ctrl+i          # Ir adelante
F8              # Abrir Tagbar (estructura de clase)
```

### Refactoring
```vim
Space+rn        # Renombrar símbolo
Space+f         # Formatear código
Space+ji        # Organizar imports (en archivos .java)
Space+jg        # Generar getters/setters
```

### Ver Errores
```vim
]e              # Siguiente error/warning
[e              # Error/warning anterior
:lopen          # Abrir lista de errores
```

---

## 🏗️ SPRING BOOT

### Comandos Personalizados
```vim
:SpringBootRun      # Ejecutar aplicación
:SpringBootTest     # Ejecutar tests
:MavenClean         # mvn clean install
:GradleBuild        # gradle build
```

### Snippets Útiles
```vim
# En modo inserción, escribir el atajo y presionar Tab:

sbapp           # Clase Application completa
sbcontroller    # REST Controller completo
sbservice       # Service con logging
sbrepo          # Repository interface
sbentity        # JPA Entity con Lombok
sbdto           # DTO con validaciones
sbtest          # Clase de test
```

---

## 🐳 DOCKER & KUBERNETES

### Docker
```vim
:DockerPs           # docker ps
:DockerImages       # docker images
Space+db            # Build imagen (en Dockerfile)

# Snippets:
dockerfile          # Dockerfile multi-stage completo
```

### Kubernetes
```vim
:KubectlPods        # kubectl get pods
:KubectlServices    # kubectl get services
Space+ka            # kubectl apply -f archivo.yaml

# Snippets:
k8sdeployment       # Deployment completo
k8sservice          # Service completo
```

---

## 🔍 GIT

### Comandos Git
```vim
:Git status         # Ver estado
:Git add %          # Agregar archivo actual
:Git commit         # Commit
:Git push           # Push
:Git pull           # Pull
:Git log            # Ver log
:Git blame          # Ver quién modificó cada línea
:Gdiff              # Ver diff del archivo actual

Space+gn            # Siguiente cambio en archivo
Space+gp            # Cambio anterior en archivo
```

### Ver Cambios
```
En el margen izquierdo verás:
+ = Línea agregada
~ = Línea modificada
- = Línea eliminada
```

---

## 🧪 TESTING DE APIs

### REST Console
```vim
# 1. Crear archivo con extensión .rest
# 2. Escribir petición HTTP:

GET http://localhost:8080/api/users
Content-Type: application/json
Authorization: Bearer token

---

POST http://localhost:8080/api/users
Content-Type: application/json

{
  "name": "Brandon",
  "email": "bamartrod@gmail.com"
}

# 3. Colocar cursor en la petición
# 4. Presionar Ctrl+j para ejecutar
```

---

## 🪟 VENTANAS Y SPLITS

### Crear Splits
```vim
:split archivo.java     # Split horizontal
:vsplit archivo.java    # Split vertical
Ctrl+w s                # Split horizontal del actual
Ctrl+w v                # Split vertical del actual
```

### Navegar entre Splits
```vim
Ctrl+h              # Ir a split izquierdo
Ctrl+j              # Ir a split inferior
Ctrl+k              # Ir a split superior
Ctrl+l              # Ir a split derecho
```

### Gestionar Splits
```vim
Ctrl+w =            # Igualar tamaños
Ctrl+w +            # Aumentar altura
Ctrl+w -            # Disminuir altura
Ctrl+w >            # Aumentar anchura
Ctrl+w <            # Disminuir anchura
:only               # Cerrar todos excepto actual
```

---

## 📑 PESTAÑAS

```vim
:tabnew archivo.java    # Nueva pestaña
:tabnew                 # Pestaña vacía
gt                      # Siguiente pestaña
gT                      # Pestaña anterior
:tabclose               # Cerrar pestaña actual
:tabonly                # Cerrar todas las demás
```

---

## 💬 COMENTARIOS

```vim
gcc                 # Comentar/descomentar línea
gc (modo visual)    # Comentar selección
3gcc                # Comentar 3 líneas
```

---

## 🔧 UTILIDADES

### Terminal Integrada
```vim
Space+t             # Abrir terminal en split
:terminal           # Abrir terminal
exit                # Cerrar terminal
```

### Macros (Automatizar tareas repetitivas)
```vim
qa                  # Empezar a grabar macro en registro 'a'
...comandos...      # Ejecutar los comandos que quieres repetir
q                   # Detener grabación
@a                  # Ejecutar macro 'a'
@@                  # Repetir última macro
10@a                # Ejecutar macro 10 veces
```

### Búsqueda Visual
```vim
*                   # Buscar palabra bajo el cursor hacia adelante
#                   # Buscar palabra bajo el cursor hacia atrás
Space+Space         # Limpiar resaltado de búsqueda
```

### Mover Líneas
```vim
Alt+j               # Mover línea hacia abajo
Alt+k               # Mover línea hacia arriba
# (funciona en modo normal y visual)
```

---

## ⚙️ CONFIGURACIÓN

### Recargar Configuración
```vim
:source ~/.vimrc        # Recargar configuración
```

### Ver Configuración
```vim
:set number?            # Ver valor de una opción
:set                    # Ver todas las opciones modificadas
```

### Plugins
```vim
:PlugInstall            # Instalar plugins nuevos
:PlugUpdate             # Actualizar plugins
:PlugClean              # Limpiar plugins no usados
:PlugStatus             # Ver estado de plugins
```

### CoC (Language Server)
```vim
:CocInfo                # Información de CoC
:CocConfig              # Editar configuración
:CocList extensions     # Ver extensiones
:CocUpdate              # Actualizar extensiones
:CocRestart             # Reiniciar CoC
```

---

## 🆘 AYUDA

```vim
:help                   # Ayuda general
:help comando           # Ayuda de comando específico
:help coc               # Ayuda de CoC
:help nerdtree          # Ayuda de NERDTree
K                       # Ayuda sobre palabra bajo cursor
```

---

## 💡 TIPS PROFESIONALES

### Workflow Típico de Desarrollo

```bash
# 1. Abrir proyecto
cd mi-proyecto-spring-boot
vim .

# 2. En Vim:
Ctrl+n              # Abrir explorador
Ctrl+p              # Buscar archivo por nombre
# Navegar y editar...

# 3. Guardar todo
:wa                 # Write all (guardar todos los buffers)

# 4. Ejecutar
:SpringBootRun

# 5. Tests
:SpringBootTest

# 6. Git
:Git status
:Git add %
:Git commit
```

### Productividad

1. **Usa Fuzzy Search (Ctrl+p)** en lugar de navegar manualmente
2. **Aprende a navegar sin mouse** (Ctrl+hjkl para splits)
3. **Usa snippets** para código repetitivo
4. **Configura macros** para tareas repetitivas
5. **Usa :bufdo** para operaciones en múltiples archivos

### Atajos para Recordar (Top 10)

```
1. Ctrl+p           → Buscar archivos
2. Ctrl+n           → Explorador
3. gd               → Ir a definición
4. Space+f          → Formatear
5. Space+rn         → Renombrar
6. gcc              → Comentar
7. Space+w          → Guardar
8. F8               → Estructura
9. K                → Documentación
10. :Git status     → Git
```

---

## 🎓 RECURSOS DE APRENDIZAJE

- Práctica interactiva: `vimtutor` (en terminal)
- Documentación: `:help user-manual`
- Vim Adventures: https://vim-adventures.com/
- Vim Golf: https://www.vimgolf.com/

---

**💪 Práctica diaria:**
- Día 1-7: Movimientos básicos (hjkl, w, b, e)
- Día 8-14: Edición (yy, dd, p, u, Ctrl+r)
- Día 15-21: Búsqueda y navegación (/, *, gd, gr)
- Día 22-30: Personalización y productividad avanzada

**¡Con práctica, Vim se vuelve segunda naturaleza!** 🚀
