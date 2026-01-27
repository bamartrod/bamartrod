# Entorno de Desarrollo Vim para Java/Spring Boot/DevOps

Configuración completa de Vim optimizada para desarrollo backend con Java, Spring Boot, microservicios, Docker y Kubernetes.

## 🎯 Características Principales

- ✅ **Desarrollo Java/Spring Boot** con autocompletado inteligente
- ✅ **Language Server Protocol (LSP)** para Java con CoC
- ✅ **Git integrado** con vista de cambios en tiempo real
- ✅ **Soporte Docker/Kubernetes** con sintaxis y comandos
- ✅ **Testing de APIs REST** directamente desde Vim
- ✅ **Navegación rápida** con FZF y búsqueda difusa
- ✅ **Linting y formateo automático** con ALE
- ✅ **Snippets** para código repetitivo
- ✅ **Temas modernos** (Gruvbox, OneDark)

## 📋 Requisitos Previos

### Sistema Operativo
- Linux (Ubuntu, Debian, Fedora, etc.)
- macOS
- WSL2 en Windows

### Software Necesario
Los siguientes paquetes se instalarán automáticamente si no están presentes:
- Vim 8.0+
- Git
- Node.js 14+ y npm
- curl

### Herramientas Opcionales (Recomendadas)
- **Java Development Kit (JDK) 11+**
  ```bash
  # Ubuntu/Debian
  sudo apt-get install openjdk-17-jdk
  
  # macOS
  brew install openjdk@17
  ```

- **Maven**
  ```bash
  # Ubuntu/Debian
  sudo apt-get install maven
  
  # macOS
  brew install maven
  ```

- **Docker CLI**
  ```bash
  # Sigue las instrucciones en: https://docs.docker.com/engine/install/
  ```

- **kubectl**
  ```bash
  # Sigue las instrucciones en: https://kubernetes.io/docs/tasks/tools/
  ```

## 🚀 Instalación Rápida

### Opción 1: Script Automático (Recomendado)

```bash
# 1. Descarga los archivos
git clone https://github.com/tu-usuario/vim-java-config.git
cd vim-java-config

# 2. Da permisos de ejecución al script
chmod +x vim-setup.sh

# 3. Ejecuta el script de instalación
./vim-setup.sh
```

El script automáticamente:
- ✅ Instala dependencias del sistema
- ✅ Hace backup de tu configuración actual
- ✅ Instala vim-plug
- ✅ Configura todos los plugins
- ✅ Instala extensiones de CoC
- ✅ Configura el entorno completo

### Opción 2: Instalación Manual

```bash
# 1. Backup de configuración actual (si existe)
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc.backup
[ -d ~/.vim ] && cp -r ~/.vim ~/.vim.backup

# 2. Instalar vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 3. Copiar archivos de configuración
cp .vimrc ~/.vimrc
cp coc-settings.json ~/.vim/coc-settings.json

# 4. Abrir Vim e instalar plugins
vim +PlugInstall +qall

# 5. Instalar extensiones de CoC
vim -c "CocInstall -sync coc-json coc-yaml coc-java coc-snippets coc-pairs coc-git|q"
```

## 🔧 Configuración Post-Instalación

### 1. Java Language Server

Para soporte completo de Java, necesitas Eclipse JDT Language Server:

```bash
# 1. Crear directorio
mkdir -p ~/.local/share/eclipse.jdt.ls

# 2. Descargar última versión
cd ~/.local/share/eclipse.jdt.ls
wget https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz

# 3. Extraer
tar -xzf jdt-language-server-latest.tar.gz

# 4. Agregar alias a ~/.bashrc o ~/.zshrc
echo 'alias jdtls="java -jar ~/.local/share/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_*.jar"' >> ~/.bashrc

# 5. Recargar shell
source ~/.bashrc
```

### 2. Linters y Formateadores

```bash
# Python linters (para YAML, etc.)
pip install yamllint

# Docker linter
# Ubuntu/Debian
sudo apt-get install hadolint

# macOS
brew install hadolint

# Google Java Format (para formateo de código Java)
cd ~/.vim
wget https://github.com/google/google-java-format/releases/download/v1.17.0/google-java-format-1.17.0-all-deps.jar
```

### 3. Fuentes con Iconos (Opcional pero Recomendado)

Para mejor visualización en NERDTree y Airline:

```bash
# Instalar Nerd Fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh FiraCode
cd .. && rm -rf nerd-fonts
```

Luego configura tu terminal para usar la fuente "FiraCode Nerd Font".

## 📚 Uso Básico

### Primeros Pasos

1. **Abrir Vim**
   ```bash
   vim
   ```

2. **Verificar instalación**
   ```vim
   :PlugStatus      " Ver estado de plugins
   :CocInfo         " Información de CoC
   :checkhealth     " Verificar salud del sistema (Neovim)
   ```

3. **Abrir un proyecto Java**
   ```bash
   cd tu-proyecto-spring-boot
   vim src/main/java/com/example/Application.java
   ```

### Atajos Más Usados

#### Navegación
- `Ctrl+n` - Abrir/cerrar explorador de archivos
- `Ctrl+p` - Búsqueda difusa de archivos
- `Ctrl+f` - Buscar en contenido de archivos
- `F8` - Vista de estructura de código

#### Edición
- `Space+w` - Guardar
- `Space+q` - Salir
- `Space+f` - Formatear código
- `gcc` - Comentar/descomentar línea

#### Java Específico
- `gd` - Ir a definición
- `gr` - Buscar referencias
- `K` - Ver documentación
- `Space+rn` - Renombrar símbolo

Ver la [Guía de Referencia Completa](GUIA_REFERENCIA.md) para todos los atajos.

## 📁 Estructura de Archivos

```
~/.vim/
├── autoload/
│   └── plug.vim              # vim-plug
├── plugged/                  # Plugins instalados
├── coc-settings.json         # Configuración de CoC
├── colors/                   # Temas
└── undodir/                  # Historial de deshacer

~/.vimrc                      # Configuración principal
```

## 🎨 Personalización

### Cambiar Tema

Edita `~/.vimrc`:

```vim
" Cambiar a OneDark
set background=dark
colorscheme onedark
let g:airline_theme='onedark'
```

### Cambiar Leader Key

```vim
" Cambiar Space por coma
let mapleader = ","
```

### Agregar Atajos Personalizados

```vim
" Ejecutar tests de Maven
nnoremap <leader>mt :!mvn test<CR>

" Abrir terminal en nueva pestaña
nnoremap <leader>tt :tabnew | terminal<CR>
```

## 🔍 Proyectos de Ejemplo

### Spring Boot

```bash
# Clonar proyecto de ejemplo
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic

# Abrir con Vim
vim src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java
```

**Características disponibles:**
- Autocompletado de clases Spring
- Navegación entre componentes
- Refactoring de código
- Ejecución con `:SpringBootRun`

### Microservicio con Docker

```bash
# Crear estructura
mkdir mi-microservicio
cd mi-microservicio
vim Dockerfile

# El syntax highlighting y comandos Docker estarán disponibles
```

## 🐛 Solución de Problemas

### CoC no funciona

```vim
:CocInfo                   " Ver información
:CocOpenLog                " Ver logs
:CocRestart                " Reiniciar CoC
```

Si hay errores, verificar:
- Node.js está instalado: `node --version`
- npm está instalado: `npm --version`
- Extensiones instaladas: `:CocList extensions`

### Java LSP no se conecta

1. Verificar instalación de jdtls:
   ```bash
   jdtls --version
   ```

2. Verificar configuración en `~/.vim/coc-settings.json`

3. Ver logs:
   ```vim
   :CocOpenLog
   ```

### Plugins no cargan

```vim
:PlugStatus                " Ver estado
:PlugInstall!              " Reinstalar
:PlugUpdate                " Actualizar
:PlugClean                 " Limpiar no usados
```

### Linting no funciona

Verificar instalación de linters:
```bash
which yamllint
which hadolint
java -jar ~/.vim/google-java-format-*.jar --version
```

## 📊 Rendimiento

### Optimización

Si Vim se siente lento:

1. **Deshabilitar plugins no usados** en `.vimrc`
2. **Reducir plugins de sintaxis** para archivos grandes
3. **Ajustar updatetime**:
   ```vim
   set updatetime=500    " Aumentar si hay lag
   ```

### Perfilado

```vim
:profile start profile.log
:profile func *
:profile file *
" ... usar Vim normalmente ...
:profile pause
:noautocmd qall!
```

Revisar `profile.log` para identificar cuellos de botella.

## 🤝 Contribuir

¿Mejoras o sugerencias? ¡Abre un issue o pull request!

1. Fork el proyecto
2. Crea una rama: `git checkout -b feature/mejora`
3. Commit: `git commit -m 'Agrega mejora'`
4. Push: `git push origin feature/mejora`
5. Abre un Pull Request

## 📝 Licencia

MIT License - Libre de usar y modificar

## 🙏 Agradecimientos

Basado en las mejores prácticas de la comunidad Vim y adaptado específicamente para desarrollo backend profesional con Java, Spring Boot y tecnologías cloud.

### Plugins Utilizados

- [vim-plug](https://github.com/junegunn/vim-plug) - Gestor de plugins
- [coc.nvim](https://github.com/neoclide/coc.nvim) - IntelliSense
- [NERDTree](https://github.com/preservim/nerdtree) - Explorador de archivos
- [fzf.vim](https://github.com/junegunn/fzf.vim) - Búsqueda difusa
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git
- [ALE](https://github.com/dense-analysis/ale) - Linting
- [gruvbox](https://github.com/morhetz/gruvbox) - Tema

Y muchos más... ver `.vimrc` para lista completa.

## 📞 Soporte

- **Issues**: GitHub Issues
- **Documentación**: [GUIA_REFERENCIA.md](GUIA_REFERENCIA.md)
- **Vim Help**: `:help` dentro de Vim

---

**Desarrollado con ❤️ para la comunidad de desarrolladores Java/Spring Boot**

*Última actualización: Enero 2026*
