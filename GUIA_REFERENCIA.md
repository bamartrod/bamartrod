# Guía de Referencia Rápida - Vim para Desarrollo Java/Spring Boot

## 📋 Índice
1. [Comandos Básicos](#comandos-básicos)
2. [Navegación de Archivos](#navegación-de-archivos)
3. [Desarrollo Java](#desarrollo-java)
4. [Git Integration](#git-integration)
5. [Docker & Kubernetes](#docker--kubernetes)
6. [Testing de APIs](#testing-de-apis)
7. [Atajos Personalizados](#atajos-personalizados)
8. [Plugins Instalados](#plugins-instalados)

---

## Comandos Básicos

### Modos de Vim
- `ESC` - Modo Normal (para comandos)
- `i` - Modo Inserción (antes del cursor)
- `a` - Modo Inserción (después del cursor)
- `v` - Modo Visual (selección)
- `V` - Modo Visual por línea
- `:` - Modo Comando

### Guardar y Salir
- `<Space>w` - Guardar archivo
- `<Space>q` - Salir
- `<Space>wq` - Guardar y salir
- `:w` - Guardar
- `:q!` - Salir sin guardar
- `:wq` - Guardar y salir

### Edición Básica
- `u` - Deshacer
- `Ctrl+r` - Rehacer
- `dd` - Eliminar línea
- `yy` - Copiar línea
- `p` - Pegar
- `x` - Eliminar carácter
- `.` - Repetir último comando

---

## Navegación de Archivos

### NERDTree (Explorador de Archivos)
- `Ctrl+n` - Abrir/cerrar NERDTree
- `<Space>nf` - Encontrar archivo actual en NERDTree

**Dentro de NERDTree:**
- `Enter` - Abrir archivo o directorio
- `s` - Abrir en split vertical
- `i` - Abrir en split horizontal
- `t` - Abrir en nueva pestaña
- `m` - Menú de operaciones (crear, eliminar, mover)
- `R` - Refrescar árbol
- `?` - Ayuda

### FZF (Búsqueda Difusa)
- `Ctrl+p` - Buscar archivos
- `Ctrl+f` - Buscar en contenido (ripgrep)
- `<Space>b` - Lista de buffers
- `<Space>h` - Historial de archivos

**Dentro de FZF:**
- `Ctrl+j/k` - Navegar resultados
- `Enter` - Abrir archivo
- `Ctrl+t` - Abrir en nueva pestaña
- `Ctrl+x` - Abrir en split horizontal
- `Ctrl+v` - Abrir en split vertical

### Tagbar (Estructura de Código)
- `F8` - Abrir/cerrar Tagbar
- Muestra clases, métodos, variables, etc.

---

## Desarrollo Java

### Completado y Navegación
- `Tab` - Autocompletar (cuando aparece menú)
- `Shift+Tab` - Navegar hacia atrás en autocompletado
- `Enter` - Confirmar selección

### Navegación de Código
- `gd` - Ir a definición
- `gy` - Ir a tipo de definición
- `gi` - Ir a implementación
- `gr` - Buscar referencias
- `K` - Mostrar documentación
- `Ctrl+o` - Volver a posición anterior
- `Ctrl+i` - Ir a posición siguiente

### Refactoring
- `<Space>rn` - Renombrar símbolo
- `<Space>f` - Formatear código
- `<Space>ji` - Organizar imports (en archivos Java)
- `<Space>jg` - Generar getters/setters (en archivos Java)

### Comandos Maven/Spring Boot
```vim
:SpringBootRun     " Ejecutar aplicación Spring Boot
:SpringBootTest    " Ejecutar tests
:MavenClean        " mvn clean install
:GradleBuild       " gradle build
```

### Linting y Diagnóstico
- `[e` - Ir a error/warning anterior
- `]e` - Ir a siguiente error/warning
- Los errores se muestran automáticamente con ALE

---

## Git Integration

### Fugitive (Git)
```vim
:Git status        " git status
:Git add %         " git add archivo actual
:Git commit        " git commit
:Git push          " git push
:Git pull          " git pull
:Git log           " git log
:Git blame         " git blame
:Gdiff             " git diff
```

### GitGutter (Cambios en Archivo)
- `<Space>gn` - Ir al siguiente cambio
- `<Space>gp` - Ir al cambio anterior
- Los cambios se muestran en el margen izquierdo:
  - `+` - Línea agregada
  - `~` - Línea modificada
  - `-` - Línea eliminada

---

## Docker & Kubernetes

### Dockerfile
- Al abrir un Dockerfile, syntax highlighting automático
- `<Space>db` - Build imagen Docker (en archivos Dockerfile)

### Kubernetes YAML
- `<Space>ka` - Aplicar archivo YAML (kubectl apply -f)
- Soporte completo de sintaxis YAML con validación

### Comandos Personalizados
```vim
:DockerPs          " docker ps
:DockerImages      " docker images
:KubectlPods       " kubectl get pods
:KubectlServices   " kubectl get services
```

---

## Testing de APIs

### vim-rest-console
Para hacer peticiones HTTP directamente desde Vim:

1. Crear archivo con extensión `.rest` o `.http`
2. Escribir la petición:

```http
# Ejemplo GET
GET https://api.example.com/users
Content-Type: application/json

# Ejemplo POST
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "Brandon",
  "email": "bamartrod@gmail.com"
}
```

3. Colocar cursor en la petición
4. Presionar `Ctrl+j` para ejecutar

---

## Atajos Personalizados

### Navegación de Ventanas
- `Ctrl+h` - Ir a ventana izquierda
- `Ctrl+j` - Ir a ventana inferior
- `Ctrl+k` - Ir a ventana superior
- `Ctrl+l` - Ir a ventana derecha

### Buffers
- `<Space>bn` - Siguiente buffer
- `<Space>bp` - Buffer anterior
- `<Space>bd` - Cerrar buffer

### Útiles
- `<Space><Space>` - Limpiar resaltado de búsqueda
- `<Space>t` - Abrir terminal en split inferior
- `Alt+j` - Mover línea hacia abajo
- `Alt+k` - Mover línea hacia arriba

### Comentarios
- `gcc` - Comentar/descomentar línea actual
- `gc` (en modo visual) - Comentar/descomentar selección

---

## Plugins Instalados

### Navegación y Archivos
- **NERDTree** - Explorador de archivos
- **FZF** - Búsqueda difusa de archivos
- **Tagbar** - Vista de estructura de código

### Git
- **vim-fugitive** - Integración completa de Git
- **vim-gitgutter** - Muestra cambios en el margen

### Java y Completado
- **coc.nvim** - Motor de IntelliSense (LSP)
- **vim-javacomplete2** - Completado específico de Java
- **JavaDecompiler** - Descompilar archivos .class

### Sintaxis y Lenguajes
- **vim-polyglot** - Soporte para múltiples lenguajes
- **Dockerfile.vim** - Sintaxis de Dockerfile
- **vim-yaml** - Soporte mejorado de YAML
- **vim-json** - Soporte de JSON
- **xml.vim** - Soporte de XML

### Linting y Formateo
- **ALE** - Linting asíncrono
- **editorconfig-vim** - Soporte de EditorConfig

### Utilidades
- **vim-commentary** - Comentar código fácilmente
- **vim-surround** - Manipular delimitadores (paréntesis, comillas, etc.)
- **auto-pairs** - Cerrar paréntesis/llaves automáticamente
- **vim-snippets** - Colección de snippets

### Testing
- **vim-rest-console** - Cliente REST para testing de APIs

### Temas
- **gruvbox** - Tema principal
- **onedark** - Tema alternativo
- **vim-airline** - Barra de estado mejorada

---

## Configuración CoC (Language Server)

### Extensiones CoC Instaladas
- `coc-json` - JSON
- `coc-yaml` - YAML
- `coc-java` - Java
- `coc-snippets` - Snippets
- `coc-pairs` - Auto-pares
- `coc-git` - Git

### Comandos CoC
```vim
:CocInfo           " Información de CoC
:CocConfig         " Editar configuración
:CocList extensions " Ver extensiones instaladas
:CocUpdate         " Actualizar extensiones
```

---

## Tips y Trucos

### Buscar y Reemplazar
```vim
:%s/viejo/nuevo/g       " Reemplazar en todo el archivo
:s/viejo/nuevo/g        " Reemplazar en línea actual
:%s/viejo/nuevo/gc      " Reemplazar con confirmación
```

### Splits
```vim
:split archivo.java     " Split horizontal
:vsplit archivo.java    " Split vertical
:only                   " Cerrar todos los splits excepto el actual
```

### Pestañas
```vim
:tabnew archivo.java    " Nueva pestaña
gt                      " Siguiente pestaña
gT                      " Pestaña anterior
:tabclose               " Cerrar pestaña
```

### Macros
```vim
qa                      " Iniciar grabación de macro en registro 'a'
...comandos...          " Ejecutar comandos
q                       " Detener grabación
@a                      " Ejecutar macro 'a'
@@                      " Repetir última macro
```

### Copiar/Pegar con Sistema
- `"+y` - Copiar selección al portapapeles del sistema
- `"+p` - Pegar desde portapapeles del sistema

---

## Archivos de Configuración

### Ubicaciones
```
~/.vimrc                    # Configuración principal
~/.vim/coc-settings.json    # Configuración de CoC
~/.vim/plugged/             # Directorio de plugins
```

### Recargar Configuración
```vim
:source ~/.vimrc           " Recargar configuración
```

### Actualizar Plugins
```vim
:PlugUpdate               " Actualizar todos los plugins
:PlugUpgrade              " Actualizar vim-plug
:PlugClean                " Eliminar plugins no utilizados
```

---

## Troubleshooting

### Problemas Comunes

1. **CoC no funciona**
   ```vim
   :CocInfo                " Ver estado
   :CocRestart             " Reiniciar CoC
   ```

2. **Java LSP no se conecta**
   - Verificar que jdtls esté instalado
   - Verificar ruta en coc-settings.json
   - Revisar logs: `:CocOpenLog`

3. **Plugins no se instalan**
   ```vim
   :PlugInstall!           " Reinstalar plugins
   ```

4. **Formateo no funciona**
   - Verificar que google-java-format esté instalado
   - Revisar configuración de ALE

### Logs y Diagnóstico
```vim
:messages               " Ver mensajes de Vim
:CocOpenLog             " Ver log de CoC
:ALEInfo                " Información de ALE
```

---

## Recursos Adicionales

### Documentación
- `:help` - Ayuda general de Vim
- `:help {comando}` - Ayuda de comando específico
- `:help coc` - Ayuda de CoC

### Links Útiles
- [Vim Cheatsheet](https://vim.rtorr.com/)
- [CoC Documentation](https://github.com/neoclide/coc.nvim)
- [Spring Boot Vim Guide](https://docs.spring.io/spring-boot/docs/current/reference/html/)

---

## Personalización

Para personalizar tu configuración:

1. Editar `~/.vimrc`
2. Agregar tus preferencias
3. Guardar y recargar: `:source ~/.vimrc`

Ejemplo de personalización:
```vim
" Cambiar tema
colorscheme onedark

" Cambiar leader key
let mapleader = ","

" Agregar mapeo personalizado
nnoremap <leader>c :!mvn clean<CR>
```

---

**¡Disfruta tu entorno de desarrollo Vim!** 🚀

Para más ayuda, consulta la documentación o abre un issue en GitHub.
