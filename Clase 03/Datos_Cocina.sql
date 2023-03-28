Use CocinApp
go
-- Platos
SET IDENTITY_INSERT Platos ON
Insert into Platos(IDPlato, Nombre, TiempoCoccion)
Values 
(1, 'Milanesa con papas fritas', 50),
(2, 'Tacos veggies con harina de arroz', 80),
(3, 'Lasagna', 90)
SET IDENTITY_INSERT Platos OFF

SET IDENTITY_INSERT Ingredientes ON
-- Ingredientes
Insert into Ingredientes(IDIngrediente, Nombre, Vegano, Vegetariano, AptoCeliaco)
Values
(1,'Peceto', 0, 0, 1),
(2,'Papas', 1, 1, 1),
(3,'Pan rallado', 1, 1, 0),
(4,'Huevos', 0, 1, 1),
(5,'Ajo', 1, 1, 1),
(6,'Tortitas de harina de arroz', 1, 1, 1),
(7,'Soja texturizada', 1, 1, 1),
(8,'Cebolla', 1, 1, 1),
(9,'Agua', 1, 1, 1),
(10,'Harina de trigo', 1, 1, 0),
(11,'Salsa de tomate', 1, 1, 1),
(12,'Ricota', 0, 1, 1)
SET IDENTITY_INSERT Ingredientes OFF
-- Recetas
Insert into Recetas(IDPlato, IDIngrediente, Cantidad, UnidadMedida)
Values
(1 , 1 ,  500, 'gramos'),
(1, 2 , 300, 'gramos'),
(1,  3, 100, 'gramos'),
(1, 4,   2,  'unidad'),
(1, 5,   50,  'gramos'),
(3, 10, 500, 'gramos'),
(3, 11, 300, 'gramos'),
(3, 12, 700, 'gramos'),
(3, 9, 0.25, 'litros'),
(3, 8, 200, 'gramos'),
(2, 6, 10, 'unidades'),
(2, 7, 30,'gramos'),
(2, 8, 3, 'unidades')

-- Cargamos un plato más
Insert into Platos(Nombre, TiempoCoccion)
Values ('Sopa', 40)

Insert into Platos(Nombre, TiempoCoccion)
Values ('Sopa', 100)

-- Modificacion
Update Platos SET Nombre = 'Carne empanada con papas acariciadas por aceite'
Where TiempoCoccion > 70

Update Recetas Set Cantidad = 250, UnidadMedida = 'CC'
Where IDIngrediente = 9 And IDPlato = 3

-- Eliminación de los platos cuyo nombre sean 'Sopa'
Delete from Platos Where Nombre = 'Sopa'

-- Eliminación del plato cuyo ID = 4
Delete from Platos Where IDPlato = 4

-- Eliminación de todos los registros (porque no tiene WHERE)
Delete From Recetas
Delete From Platos
Delete From Ingredientes



