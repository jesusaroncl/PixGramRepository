Feature:Registrar Usuario
    Como usuario nuevo quiero poder registrarme en 
    la aplicacion para poder usar sus funcionalidades.

    Scenario: Usruario se registra en la aplicación
    Given el <usuario> no posee una cuenta en la aplicacion
    When el <usuario> presione el boton "Crear cuenta"
    And el <usuario> complete los datos del formulario referentes al "Nombre", "Apellido",
        "Contraseña" (1 numero y 1 caracter especial) y "Nombre de usuario"
    And el <usuario> de clic al boton "Crear cuenta"
    Then el sistema de la aplicacion creara una cuenta para el usuario con TEA

    Examples:
        |   Nombres  |     Apellidos     | Nombre del usuario | Contraseña |
        | Yan Marco  |   Soto Benavides  |        YanSB       | Yan%200218 |
        | Gianfranco | Callocondo Choque |       GianFC       | Gian524%20 |
    
    Scenario: La persona con TEA coloca dato invalido
    Given que el <usuario> no posee una cuenta en la aplicación
    When el <usuario> presione el boton "Crear cuenta"
    And la persona con TEA complete los datos pedidos en el formulario
        ("Nombre", "Apellido", "Contraseña", "Correo")
    And coloque algun dato incorrecto (La contraseña no tiene los caracteres
        necesarios, el nombre de usuario ya fue tomado, etc)
    And el usuario con TEA de clic en el boton de "Crear cuenta"
    Then el sistema borrara los datos de la casilla en la cual está ocurriendo el problema
    And solicitara al usuario colocar un nuevo dato valido

    Examples:
        |   Nombres  |     Apellidos     | Correo   | Contraseña |
        | Jherson  |   Pinedo Valverde  | Jpinedovalverde@gmail.com      | Yan200218 |
        | Gianfranco | Callocondo Choque | Gcallocondocloque07@gmail.com | Gian524%20 |
    
Feature: Verificar usuario y contraseña
    Como usuario quiero ingresar  mi usuario y contraseña para 
    poder ingresar a la app

    Scenario: Usuario ingresa a la aplicacion
    Given que el <usuario> (ya registrado) abre la plaicacion
    When digite su usuario y contraseña en las casillas correspondientes
    And el <usuario> dé clicl al boton "Ingresar"
    Then podra acceder al sistema de la aplicación

    Examples:
        |  Nombre de usuario  | Contraseña |         Mensaje de sistemas       |
        |         YanSB       | Yan%200218 | Ha iniciado sesión correctamente  |

    Scenario: Persona con TEA ingresa usuario y contraseña incorrecta
    Given que el <usuario> (ya registrado) abre la aplicacion
    When digite su usuario y contraseña en las casillas correspondientes
    And la perosna con TEA de clic en el boton de "Ingresar"
    And le sale dato incorrecto (la contraseña no contiene los caracteres necesarios,
        el nombre de usuario esta incorrecto)
    Then el siste,a borrará los datos de la casilla en la cual esta ocurriendo el problema
    And solicitará al usuario colocar un usuario y contraseña valido

    Examples:
        |  Nombre de usuario  | Contraseña |                 Mensaje de sistemas                 |
        |        YanSB        | Yan%200218 | Contraseña o usuario incorrecto, vuelve intentarlo  |

Feature: Modificar usuario

    Como usuario quiero poder modificar los datos de mi perfil para poder
    cambiarlos cuando crea conveniente

    Scenario: Persona con TEA personaliza profile
    Given que el <usuario> ingreso a la aplicación como usuario quiere modificar
        su cuenta y información
    When la persona con TEA acceda a su profile al apartado "Perfil"
    And entonces el <usuario> se ubique en la subpagina "Edición del perfil"
    And el <usuario> rellene los campos "Agregar foto del perfil" 
    Then el sistema hara las actualizaciones del usuario podra observar toda 
        su información respectiva
    And podra modificar su usuario y/o contraseña 

    Examples:
    |           Opcion          |       Pasos a seguir    |
    |                           | Perfil                  |
    | Perosnalización de perfil | Edición del perfil      |
    |                           | Agregar foto del perfil |

Feature: Buscar y selecionar pictogramas

   Como persona con TEA, quiero que la aplicación incluyera  opciones
   para poder elegir mas pictogramas y asi enriquecer mi experiencia en 
   el uso

   Scenario: La persona con TEA esta en la aplicacion
   Given que la <persona con autismo> esta en la aplicación
   When la <persona con TEA> quiera Ingresar a "pictogramas o favoritos"
   And de click en el boton de pictogramas
   Then la aplicación le mostrara una ventana con 6 categorias de pictogramas 

   Examples:
       |     Inicio   |
       | Pictogramas  |
       | Favoritos    |
    
    Scenario: Usuario busca en la app mas pictogramas
    Given que el <usuario> esta en la aplicación
    When el <usuario> quiera "Añadir" en mis favoritos los pictogramas para
    que tenga un accceso mas facil
    And cuando el <usuario> agregue en favoritos los pictogramas 
    And presione el botón "Aceptar"
    Then el sistema lo guardara en favoritos 

    Examples:
        | Añadir en mis Favoritos | 
        | Carro                   | 
        | Perro                   |
        | Casa                    |

Feature: Personalizar pictograma
    
        Como familia d ela persona con TEA quiero poder perosnalizar los
        pictogramas para poder mejorar y adecuarme a sus necesidades de
        mi familiar con autismo

    Scenario: Familiar de la persona con TEA visualiza los pictogramas
    Given que el <familiar> esta en la selección de pictogramas
    When el <familiar> observa los pictogramas, puede notar que los colores de las imagenes son de su preferencia 
    And selecione los pictogramas que sea necesario para la persona con TEA
    Then la app solo mostrara los pictogramas establecidos

    Examples:
        | Selección de un pictograma | 
        | Lugares                    | 
        | Colores                    |
        | Animales                   |
        | Comidas                    |
    
    Scenario: El familiar de la persona con TEA sugiere que los pictogramas tienen la capacidad de animarse como un archivo de tipo GIF
    Given que el <familiar>  de la persona con TEA este seleccionando los pictogramas a usar
    When el <familiar> seleccione un pictograma
    And de click en "Añadir"
    Then la aplicacion exhibira al miembro de la familia las opciones de categoria de un pictograma
    que ha seleccionado hasta ese momento

    Examples:
        | Seleccion de un pictograma |
        | Playa                      | 
        | Escuela                    |
        | Parque                     |

Feature: Asistente virtual

    Como usuario, tengo el deseo de que la aplicación cuente con un asistente
    virtual personalizado con el fin de mejorar la utilización de los pictogramas

    Scenario: El usuario ingresa a la app
    Given que el <usuario> prueba las funcionalidades y las herramientas de la app
    When el <usuario> quiere una guia de la funcionalidad de la app
    Then el sistema le mostrara una ventana con instrucciones sobre como usar la app

    Scenario: El usuario busca maneras de utilizar los pictogramas sin cometer errores
    Given que el <usuario> busca emplear la app sin fallas y de manera eficiente
    When el <usuario> desea experimentar con las funciones de la aplicación por
    primera vez
    And cuando de clic en funciones le sale las opciones "Chat", "Formularios" y "redes sociales"
    Then el sistema mostrara unicamente solo las herramientas necesarias

    Examples:
        | Funciones de la aplicación |
        | Chat                       | 
        | Formularios                |
        | Redes sociales             |
