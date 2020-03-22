# ![Alt text](https://2f9k4p3rs05u3rzzgj24k7c0-wpengine.netdna-ssl.com/wp-content/uploads/Papa_Johns_Pizza.png "Papa Johns Test")

Prueba basada en Ruby on Rails 5.2.4

## Tabla de contenidos
* [Información general](#información-general)
* [Tecnologías](#tecnologías)
* [Instalación](#instalación) 
* [Carpetas](#carpetas)
* [Ejemplos](#ejemplos)

## Información general
Simple API basada en un CRUD para tiendas (Stores), productos (Products) y ordenes (Orders)

## Tecnologías
Para este proyecto debes considerar o instalar las siguientes versiones:
  * Ruby: `2.6.5`
  * Rails: `5.2.4`
  * PostgreSQL: `>= 9.5`

## Instalación
* Clona este repositorio vía HTTPS: `git clone https://github.com/kevinafernandez/papajohns_api.git`

* Instala todas las gemas y dependencias: `bundle install`

* Crea la base de datos: `rails db:create`

* Ejecuta todas las migraciones: `rails db:migrate`


## Carpetas

* `app/models` - Contiene tres modelos principales (Store, Product, Order), en él se definen métodos, validaciones y relaciones.

* `app/controllers/api/v1` - Contiene tres controladores principales (Stores, Products, Orders), en él se definen las acciones CRUD para cada uno, adicional a esto, un servicio de mailing en orders_controller cuando esta es creada exitósamente.

* `serializers` - Contiene la estructura para la serialización de objetos utilizando FastJSON API.

* `db` - Contiene las migraciones para crear el schema en la base de datos.

* `app/views/order_mailer/order_confirmation.html.erb` - Vista del servicio de mailing.

## Ejemplos

Utiliza algún software o librería de tu preferencia para probar los servicios web (POSTMAN, Curl, entre otros).

###### Store
```
* Obtener todas las tiendas:
    GET /api/v1/stores/

* Crear una tienda:
    POST /api/v1/stores/
		{
			"store": {
				"name": "Bandera",
				"address": "Bandera 304",
				"phone": "912345678"
			}
		}

* Obtener una tienda:    
    GET /api/v1/stores/1

* Actualizar un tienda:
    PUT/PATCH /api/v1/stores/1
		
		{
			"campo1": "dato1",
			"campo2": "dato2",
			"campo_n": "dato_n"
		}

 * Eliminar un tienda:
    DELETE /api/v1/stores/1
```

###### Productos
```
* Obtener todos los products:
    GET /api/v1/products/

* Crear un producto:
    POST /api/v1/products/

		En caso de querer asociar el producto (Product) a una o varias tiendas (Store), agregarle como parametro
		un arreglo de ids -> ejm: store_ids[1,2]
		{
			"product": {
				"name": "Salsa de Tartara",
				"sku": "SAL-TOM",
				"price": 500,
				"product_type": "Complement"
			}
		}

* Obtener un producto:    
    GET /api/v1/products/1

* Actualizar un producto:
    PUT/PATCH /api/v1/products/1

		{
			"campo1": "dato1",
			"campo2": "dato2",
			"campo_n": "dato_n"
		}

 * Eliminar un producto:
    DELETE /api/v1/products/1
```

###### Ordenes
```
* Obtener todas las ordenes:
    GET /api/v1/orders/

* Crear una orden:
    POST /api/v1/orders/

		Se debe agregar a la tienda a la cual pertenece a través del "store_id" y los productos como un arreglo de ids, ejemplo:
		{
			"order": {
				"store_id": 1,
				"product_ids": [1,2]
			}
		}

* Obtener una orden:    
    GET /api/v1/orders/1

* Actualizar una orden:
    PUT/PATCH /api/v1/orders/1

		{
			"campo1": "dato1",
			"campo2": "dato2",
			"campo_n": "dato_n"
		}

 * Eliminar una orden:
    DELETE /api/v1/orders/1
```