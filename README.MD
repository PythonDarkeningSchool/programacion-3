# Tabla de contenidos

<details open>
    <summary>Mostrar/Ocultar</summary>

- [Introduccion](#introduccion)
- [Como funciona el proyecto](#como-funciona-el-proyecto)
  * [Pestaña `Home`](#pestaña-home)
  * [Pestaña `Admin`](#pestaña-admin)
    + [Insert class section](#insert-class-section)
    + [Insert Careers section](#insert-careers-section)
  * [Pestaña `Insert`](#pestaña-insert)
  * [Pestaña `delete`](#pestaña-delete)
  * [Pestaña `update`](#pestaña-delete)
  * [Pestaña `Show data`](#pestaña-admin)
- [Desarrollo](#desarrollo)
  * [Escalabilidad y confiabilidad](#escalabilidad-y-confiabilidad)
  * [Creacion de tablas e insercion de datos](#creacion-de-tablas-e-insercion-de-datos)
  * [Estructura del projecto](#estructura-del-projecto)
    + [La carpeta `admin`](#la-carpeta-admin)
    + [La carpeta `delete`](#la-carpeta-delete)
    + [La carpeta `img`](#la-carpeta-img)
    + [La carpeta `insert`](#la-carpeta-insert)
    + [La carpeta `update`](#la-carpeta-update)
- [Herramientas utilizadas para el desarrollo](#herramientas-utilizadas-para-el-desarrollo)
  * [Servidor web](#servidor-web)
  * [Base de datos](#base-de-datos)
  * [USB WebServer](#usb-webserver)
- [Conclusion](#conclusion)
- [Biografia](#biografia)
- [Datos personales](#datos-personales)

</details>

# Introduccion

Se desarrollo un projecto web con la finalidad de conectarlo con una base de datos en `mysql.`

Las tecnologias usadas para este proyecto fueron las siguientes:

| #    | Tecnologia | Descripcion                                                  | Logotipo                                      |
| ---- | ---------- | ------------------------------------------------------------ | --------------------------------------------- |
| 1    | Java       | Java es un lenguaje de programación y una plataforma informática comercializada por primera vez en 1995 por Sun Microsystems. Hay muchas aplicaciones y sitios web que no funcionarán a menos que tenga Java instalado y cada día se crean más. Java es rápido, seguro y fiable :point_right: [Mas informacion aqui](https://www.java.com/es/download/faq/whatis_java.xml) | ![java_logo](img/readme/java_logo.png)        |
| 2    | JavaScript | Javascript es un lenguaje con muchas posibilidades, utilizado para crear pequeños programas que luego son insertados en una página web y en programas más grandes, orientados a objetos mucho más complejos :point_right: [Mas informacion aqui](http://www.maestrosdelweb.com/que-es-javascript) | ![JavaScript](img/readme/javascript_icon.png) |
| 3    | Bootstrap  | [Bootstrap](http://getbootstrap.com/) es un [framework](http://jordisan.net/blog/2006/que-es-un-framework/) desarrollado y liberado por Twitter que tiene como objetivo **facilitar el diseño web** :point_right:[Mas informacion aqui](https://puntoabierto.net/blog/que-es-bootstrap-y-cuales-son-sus-ventajas​) | ![Bootstrap](img/readme/bootstrap_icon.png)   |
| 4    | HTML       | HTML es un lenguaje de programación que se utiliza para el desarrollo de páginas de Internet. Se trata de la siglas que corresponden a HyperText Markup Language, es decir, Lenguaje de Marcas de Hipertexto :point_right: [Mas informacion aqui](https://codigofacilito.com/articulos/que-es-html) | ![HTML](img/readme/html_icon.png)             |
| 5    | CSS        | Es un lenguaje que define la apariencia de un documento escrito en un lenguaje de marcado (por ejemplo, [HTML](http://www.arumeinformatica.es/dudas/html)) :point_right: [Mas informacion aqui](​http://www.arumeinformatica.es/dudas/css) | ![css](img/readme/css_icon.png)               |

# Como funciona el proyecto

## Pestaña `Home`

![home_tab](img/readme/home_tab.JPG)

La imagen anterior muestra como luce la pestaña `Home` la cual su funcion principal es contar el numero de registros totales en la base de datos pero solo los datos en la tabla `Student`. Para mas informacion sobre como fue creada la tabla `Students` [Click aqui](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/README.md#tables-creation)

## Pestaña `Admin`

### Insert class section

En esta seccion se podra insertar clases a la base de datos, a la tabla `Class` ([Consultar como la tabla fue creada](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/README.md#tables-creation)).

Los campos requeridos son:

- `Class ID`: que es el ID para identificar una clase insertada, este no puede repetirse, de lo contrario la base de datos regresara un error
- `Class Name`: El cual es el nombre de la clase que va ligada a su `Class ID` y de igual manera este no podra ser repetido ya que la base de datos arrojara un error

Ejemplo:

![admin_insert_class](img/readme/gif/admin_insert_class.gif)

### Insert Careers section

En esta seccion se podra insertar carreras a la base de datos, a la tabla `Careers` ([Consultar como la tabla fue creada](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/README.md#tables-creation)).

Los campos requeridos son:

- `Career ID`: el cual es el identificador de la carrera y este no podra ser repetido ya que de lo contrario la base de datos arrojara un error
- `Career Name`: el cual es el nombre de la carrera y este no podra ser repetido ya que de lo contrario la base de datos arrojara un error

Ejemplo:

![admin_insert_career](img/readme/gif/admin_insert_career.gif)

## Pestaña `Insert`

En esta seccion se podran insertar registros a la base de datos los cuales son los datos de un estudiante.

Los campos requeridos son:

- `First Name`: el cual el el nombre(s) del estudiante
- `Last Name`: el cual es el apellido del estudiante
- `Email`: el cual es el email del estudiante
- `Career`: el cual es la carrera a la cual el estudiante se registrara
- `Class`: el cual es la clase a la cual el estudiante se registrara
- `ID`: el cual es el identificador del estudiante

Ejemplo:

![insert_tab_example](img/readme/gif/insert_tab_example.gif)

## Pestaña `delete`

En esta seccion se podran eliminar registros de base de datos del estudiante

Los campos requeridos son:

- `StudentID`: El cual es el `identificador` del estudiante previamente registrado en la pestaña de `Insert`

Ejemplo:

![delete_tab_example](img/readme/gif/delete_tab_example.gif)



## Pestaña `update`

En esta seccion se podran actualizar registro por registro los datos de un estudiante

Los campos requeridos son:

- `StudentID`: El cual es el `identificador` del estudiante previamente registrado en la pestaña de `Insert`, si el `ID` no existe, la base de datos regresara un error

Los campos opcionales son:

- `Name`: el cual es el nuevo -
- nombre del estudiante
- `Last Name`: el cual es el nuevo apellido del estudiante
- `Email`: el cual es el nuevo email del estudiante
- `Career`: el cual es la nueva carrera a la cual el estudiante pertencera
- `Class`: el cual es la nueva clase a la que el estudiante pertenecera

> El campo que se necesite actualizar solo es necesario hacer click en el checkbox antes de dar click en el boton `Submit form`

Ejemplo:

![update_tab_example](img/readme/gif/update_tab_example.gif)

## Pestaña `Show data`

En esta pestaña se mostrara en tiempo real los registros en la base de datos y en esta se podra filtrar por cualquier campo en cualquier columna

Ejemplo:

![show_data_tab_example](img/readme/gif/show_data_tab_example.gif)

# Desarrollo

## Escalabilidad y confiabilidad

Este proyecto fue desarrollado con un sistema de control de versiones (:link: [git](https://git-scm.com/book/es/v1/Empezando-Fundamentos-de-Git)​) el cual permite en resumidas palabras tener control sobre los cambios de codigo realizados a lo largo del projecto. Se utilizo este sistema ya que permite escalabilidad y confiabilidad al momento de desarrollar software

## Creacion de tablas e insercion de datos

Para esta parte del desarrollo, el siguiente codigo se utilizo para la creacion de tablas e insercion de datos en `MySQL`

:point_right: [Creacion de tablas con MySQL](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/README.md#tables-creation)

:point_right: [Insercion de datos con MySQL](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/README.md#data-insert)

## Estructura del projecto

En github el projecto esta estructurado como se muestra a continuacion

![folder_structure](img/readme/folder_structure.JPG)

### La carpeta `admin`

Esta carpeta contiene los siguientes archivos

![admin_cards_files](img/readme/admin_cards_files.JPG)

:page_facing_up: `admin_cards.jsp` *=>* Este archivo contiene las siguientes vistas las cuales pertenencen al tab `Admin`

![admin_cards_example](img/readme/admin_cards_example.JPG) 

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/admin/admin_cards.jsp)​

:page_facing_up: `admin_modal_careers.jsp` *=>* Este archivo contiene el modal cuando se invoca al boton `GO!`

![modal_careers_example](img/readme/modal_careers_example.JPG)

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/admin/admin_modal_careers.jsp)

:page_facing_up: `admin_modal_class.jsp` *=>* Este archivo contiene el modal cuando se invoca al boton `GO!`

![modal_class_example](img/readme/modal_class_example.JPG)

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/admin/admin_modal_class.jsp)

### La carpeta `delete`

Esta carpeta contiene los siguientes archivos:

![delete_files](img/readme/delete_files.JPG)

:page_facing_up: `delete_modal.jsp` *=>* Este archivo contiene el modal que se invoca cuando se presiona el boton `GO!`

![delete_modal_example](img/readme/delete_modal_example.JPG)

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/delete/delete_modal.jsp)

:page_facing_up: `delete_form.jsp` *=>* Este archivo contiene el formulario dentro del modal que se invoca cuando se presiona el boton `GO!`, la imagen es la misma que la anterior

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/delete/delete_form.jsp)

### La carpeta `img`

Esta carpeta contiene todas las imagenes necesarias para desplegar nuestro sitio web las cuales son

![img_folder_files](img/readme/img_folder_files.JPG)

### La carpeta `insert`

Esta contiene los siguientes archivos:

![insert_folder_files](img/readme/insert_folder_files.JPG)

:page_facing_up: `insert_modal.jsp` *=>Este archivo contiene el modal que se invoca cuando se presiona el boton `GO!* 

![insert_modal_example](img/readme/insert_modal_example.JPG)

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/insert/insert_modal.jsp)

:page_facing_up: `insert_form.jsp` *=>* Este archivo contiene el formulario dentro del modal que se invoca cuando se presiona el boton `GO!`, la imagen es la misma que la anterior

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/insert/insert_form.jsp)

### La carpeta `update`

Esta contiene los siguientes archivos:

![update_folder_files](img/readme/update_folder_files.JPG)

:page_facing_up: `update_modal.jsp` *=>Este archivo contiene el modal que se invoca cuando se presiona el boton `GO!* 

![update_modal_example](img/readme/update_modal_example.JPG)

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/update/update_modal.jsp)

:page_facing_up: `update_form.jsp` *=>* Este archivo contiene el formulario dentro del modal que se invoca cuando se presiona el boton `GO!`, la imagen es la misma que la anterior

El codigo que contiene es el siguiente :floppy_disk: [Ver en github](https://github.com/PythonDarkeningSchool/java/blob/master/uteg/bootstrap_v4.3/web/update/update_form.jsp)

# Herramientas utilizadas para el desarrollo

## Servidor web

El servidor utilizado para este proyecto fue `Apache Tomcat` en su version *7.0.93*

| Servidor      | Descripcion                                                  | Pagina Oficial                               | Imagen                                                   |
| ------------- | ------------------------------------------------------------ | -------------------------------------------- | -------------------------------------------------------- |
| Apache Tomcat | **Apache Tomcat** (también llamado **Jakarta Tomcat** o simplemente **Tomcat**) funciona como un contenedor de *servlets* desarrollado bajo el [proyecto Jakarta](https://es.wikipedia.org/wiki/Proyecto_Jakarta) en la [Apache Software Foundation](https://es.wikipedia.org/wiki/Apache_Software_Foundation). Tomcat implementa las especificaciones de los servlets y de [JavaServer Pages](https://es.wikipedia.org/wiki/JavaServer_Pages) (JSP) de [Oracle Corporation](https://es.wikipedia.org/wiki/Oracle_Corporation) (aunque creado por [Sun Microsystems](https://es.wikipedia.org/wiki/Sun_Microsystems)). | [Apache Web Page](http://tomcat.apache.org/) | ![apache_tomcat_icon](img/readme/apache_tomcat_icon.png) |

## Base de datos

La base de datos utilizada en este proyecto fue `MySQL` debido a su gran popularidad y facilidad de uso

| Base de datos | Descripcion                                                  | Pagina oficial                          | Imagen                                     |
| ------------- | ------------------------------------------------------------ | --------------------------------------- | ------------------------------------------ |
| MySQL         | MySQL es un sistema de administración de bases de datos (*Database Management System, DBMS*) para bases de datos relacionales | [MySQL Web Page](https://www.mysql.com) | ![my_sql_icon](img/readme/my_sql_icon.jpg) |

## USB WebServer

La herramienta usada en este proyecto fue `USBWebServer` por su facilidad de uso, ya que para los sistemas operativos Windows es portable.

Que es USBWebServer?

Es una combinacion de populares softwares como: Apache, MySQL, PHP y phpMyAdmin. Con esta herramienta es posible mostrar tus sitios web en `PHP` asi como en `JSP` en donde sea.

Sitio oficial: :link: [USB WebServer](https://www.usbwebserver.net/webserver)​

# Conclusion

Este proyecto en lo personal me tomo mucho tiempo en integrar el framework `bootstrap` con la parte web ya que es un proyecto visualmente agradable.

Java Server Pages (`JSP`) es una tecnologia muy robusta para el desarrollo web aunque no es la mejor en mi punto de vista personal para desarrollo web, JavaScript es la mejor eleccion ya que tiene muchas mas bondades pero al igual tiene muchas contras, JavaScript se compensa en su gran mayoria con el lenguage de alto nivel `TypeScript`.

Quede muy satisfecho con este proyecto ya que mi pasion siempre ha sido desarrollar la parte web (front-end) para integralo con un servicio de base de datos.

En lo personal la base de datos utilizada (a pesar de ser muy popular) no es la mejor eleccion, ya que esta muy de moda (y con buena razon) utilizar software de licencia libre y multiplataforma, en este caso la mejor eleccion de bases de datos *no relaciones* hubiera sido `mongoDB`

# Biografia

 A lo largo de este ensayo se inscrustraron varios links con referencias a lo que se esta hablando, este apartado es un resumen de los lnks mencionados:

:link: [USB Webserver](https://www.usbwebserver.net/webserver)

:link: [Apache Tomcat](http://tomcat.apache.org)

:link: [MySQL](https://www.mysql.com)

:link: [JavaScript](https://www.javascript.com)

:link: [Java](https://www.java.com/es)

:link: [HTML](https://en.wikipedia.org/wiki/HTML)

:link: [CSS](https://www.w3schools.com/csS/css_intro.asp)

:link: [Bootstrap](https://getbootstrap.com)

# Datos personales

- Materia: Programacion III
- Maestro: Pedro Echeverria
- Alumno: Humberto Israel Perez Rodriguez
- Carrera: Ingeneria en Computacion
- Grado: 4 Cuatrimestre