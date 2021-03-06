USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Aerolineas

AS

SELECT * FROM dbo.Aerolinea

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Aerolinea
( @Aerol_Pais int,
  @Consec_Aerol int,
  @Codigo nvarchar(150),
  @Nombre nvarchar(150),
  @Imagen nvarchar(max))

 AS

INSERT INTO dbo.Aerolinea(Aerol_Pais, Consec_Aerol, Codigo, Nombre, Imagen) VALUES (@Aerol_Pais, @Consec_Aerol, @Codigo, @Nombre, @Imagen)
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Actualiza_Aerolinea(@ALNID int, @Aerol_Pais int, @Consec_Aerol int, @Codigo nvarchar(150), @Nombre nvarchar(150), @Imagen nvarchar(max))

AS  

UPDATE dbo.Aerolinea SET Aerol_Pais = @Aerol_Pais, Consec_Aerol = @Consec_Aerol, Codigo = @Codigo, Nombre = @Nombre, Imagen = @Imagen
WHERE ALNID = @ALNID;  
IF @@rowcount <> 1   
RAISERROR('ID Aerolinea Invalido',16,1) 
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Eliminar_Aerolinea
( @ALNID int)

AS

DELETE FROM dbo.Aerolinea WHERE ALNID = @ALNID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Consec_Aerolinea(@ALNID int)

AS

Select Consec_Aerol from dbo.Aerolinea where ALNID = @ALNID

GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Aeropuertos

AS

SELECT * FROM dbo.Aeropuerto

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Aeropuerto
( @Consec_Aerop int,
  @Cod_Puerta nvarchar(150),
  @Num_Puerta int,
  @Detalle nvarchar(150))

 AS

INSERT INTO dbo.Aeropuerto(Consec_Aerop, Cod_Puerta, Num_Puerta, Detalle) VALUES (@Consec_Aerop, @Cod_Puerta, @Num_Puerta, @Detalle)
Go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Actualiza_Aeropuerto(@APTID int, @Consec_Aerop int, @Cod_Puerta nvarchar(150), @Num_Puerta int, @Detalle nvarchar(150))  

AS  

UPDATE dbo.Aeropuerto SET Consec_Aerop= @Consec_Aerop, Cod_Puerta = @Cod_Puerta, Num_Puerta = @Num_Puerta, Detalle = @Detalle  
WHERE APTID = @APTID;  
IF @@rowcount <> 1   
RAISERROR('ID Aeropuerto Invalido',16,1) 
Go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Eliminar_Aeropuerto
( @APTID int)

AS

DELETE FROM dbo.Aeropuerto WHERE APTID = @APTID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Consec_Aeropuerto(@APTID int)

AS

Select Consec_Aerop from dbo.Aeropuerto where APTID = @APTID

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Bitacoras

AS

SELECT * FROM dbo.Bitacora

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Bitacora
( @Consec_Bitacora int,
  @Usuario_Bitac int,
  @Cod_Registro int,
  @Fecha datetime,
  @Tipo nvarchar(150),
  @Descripcion nvarchar(150),
  @Codigo nvarchar(150),
  @Nombre nvarchar(150),
  @Imagen nvarchar(MAX),
  @Num_Puerta int,
  @Detalle nvarchar(150),
  @Consec_Descripcion nvarchar(150),
  @Consecutivo nvarchar(150),
  @Destino nvarchar(150),
  @Procedencia nvarchar(150),
  @Fecha_Vuelo datetime,
  @Estado nvarchar(150),
  @Monto float)

 AS

INSERT INTO dbo.Bitacora(Consec_Bitacora, Usuario_Bitac, Cod_Registro, Fecha, Tipo, Descripcion, Codigo, Nombre, Imagen, Num_Puerta, Detalle, Consec_Descripcion, Consecutivo, Destino, Procedencia, Fecha_Vuelo, Estado, Monto) 
VALUES (@Consec_Bitacora,@Usuario_Bitac, @Cod_Registro, @Fecha,@Tipo,@Descripcion,@Codigo,@Nombre,@Imagen,@Num_Puerta,@Detalle,@Consec_Descripcion,@Consecutivo,@Destino, @Procedencia,@Fecha_Vuelo,@Estado,@Monto)

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Consecutivos

AS

SELECT * FROM dbo.Consecutivo

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_CSVID_Consecutivos

AS

SELECT TOP 1 CSVID FROM dbo.Consecutivo ORDER BY CSVID DESC

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Consecutivo
( @Descripcion nvarchar(150),
  @Consecutivo nvarchar(150),
  @Prefijo nvarchar(150),
  @RangoInicial int,
  @RangoFinal int)

 AS

INSERT INTO dbo.Consecutivo(Descripcion,Consecutivo,Prefijo, RangoInicial, RangoFinal) VALUES (@Descripcion,@Consecutivo,@Prefijo,@RangoInicial,@RangoFinal)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Go

USE WebDB
Go
CREATE PROCEDURE SP_Actualiza_Consecutivo(@CSVID int, @Descripcion nvarchar(150), @Consecutivo nvarchar(150), @Prefijo nvarchar(150), @RangoInicial int, @RangoFinal int )  

AS  

UPDATE dbo.Consecutivo SET Descripcion = @Descripcion, Consecutivo = @Consecutivo, Prefijo = @Prefijo, RangoInicial = @RangoInicial, RangoFinal = @RangoFinal  
WHERE CSVID = @CSVID;  
IF @@rowcount <> 1   
RAISERROR('ID Consecutivo Invalido',16,1) 
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Eliminar_Consecutivo
( @CSVID int)

AS

DELETE FROM dbo.Consecutivo WHERE CSVID = @CSVID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Consec_ID(@CSVID int)

AS

Select CSVID from dbo.Consecutivo where CSVID = @CSVID  

GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
GO
CREATE PROCEDURE SP_Solicitar_Info_Errores

AS

SELECT * FROM dbo.Error
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
GO
CREATE PROCEDURE SP_Inserta_Error
( @Fecha datetime,
  @Mensaje_Error nvarchar(150))

AS

INSERT INTO dbo.Error(Fecha, Mensaje_Error) VALUES(@Fecha, @Mensaje_Error)

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Paises
AS
SELECT * FROM dbo.Pais

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Inserta_Pais
( @Consec_Pais int,
  @CodPais nvarchar(150),
  @Nombre nvarchar(150),
  @Imagen nvarchar(max))

 AS

Insert into dbo.Pais(Consec_Pais, CodPais, Nombre,Imagen) values(@Consec_Pais, @CodPais, @Nombre,@Imagen)
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Pais(@PAISID int, @Consec_Pais bit, @CodPais nvarchar(150), @Nombre nvarchar(150), @Imagen nvarchar(max))  

AS  

update dbo.Pais set Consec_Pais = @Consec_Pais, CodPais = @CodPais, Nombre = @Nombre, Imagen = @Imagen
where PAISID = @PAISID;  
if @@rowcount <> 1   
raiserror('ID Pais Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Eliminar_Pais
( @PAISID int)

 AS

Delete from dbo.Pais where PAISID = @PAISID
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Filtro_Pais(@Nombre nvarchar(150))

AS

SELECT PAISID FROM dbo.Pais WHERE Nombre = @Nombre
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Consec_Pais(@PAISID int)

AS

Select Consec_Pais from dbo.Pais where PAISID = @PAISID   

GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Rol_Usuarios
AS

SELECT * FROM dbo.Rol_Usuario

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
GO
CREATE PROCEDURE SP_Inserta_Rol_Usuarios
( @USRID int,
  @ROLID int,
  @Estado bit)

AS

INSERT INTO dbo.Rol_Usuario(USRID, ROLID, Estado) VALUES(@USRID, @ROLID,@Estado)
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Administrador(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Seguridad(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Consecutivo(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Mantenimiento(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Consultas(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Estado_Clientes(@USRID int, @ROLID int, @Estado bit)  

AS  

update dbo.Rol_Usuario set Estado = @Estado
where USRID = @USRID AND ROLID = @ROLID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1)

GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Usuarios

AS

SELECT * FROM dbo.Usuario

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_USRID_Usuarios

AS

SELECT TOP 1 USRID FROM dbo.Usuario ORDER BY USRID DESC

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Usuario
( @Usuario nvarchar(150),
  @Contrasena nvarchar(150),
  @Nombre nvarchar(150),
  @Primer_Apellido nvarchar(150),
  @Segundo_Apellido nvarchar(150),
  @Pregunta nvarchar(150),
  @Respuesta nvarchar(150),
  @Correo nvarchar(150),
  @Administrador bit,
  @Seguridad bit,
  @Consecutivo bit,
  @Mantenimiento bit,
  @Consulta bit,
  @Cliente bit)

 AS

INSERT INTO dbo.Usuario(Usuario,Contrasena, Nombre, Primer_Apellido,Segundo_Apellido,Pregunta,Respuesta,Correo,Administrador,Seguridad,Consecutivo,Mantenimiento,Consulta,Cliente) VALUES (@Usuario, @Contrasena,@Nombre,@Primer_Apellido,@Segundo_Apellido,@Pregunta,@Respuesta,@Correo,0,0,0,0,0,1)
Go

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

USE WebDB
Go
CREATE PROCEDURE SP_Actualiza_contrasena(@Contrasena nvarchar(150), @newContrasena nvarchar(150))  

AS  

UPDATE dbo.Usuario SET Contrasena = @newContrasena 
WHERE Contrasena = @Contrasena;  
IF @@rowcount <> 1   
RAISERROR('Fallo en la Actualizacion de la contrasena',16,1) 
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Eliminar_Usuario
(@USRID int)

AS

DELETE FROM dbo.Usuario WHERE USRID = @USRID

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Login_Usuario(@Usuario nvarchar (150), @Contrasena nvarchar (150))  

AS 

Begin

declare @return int;

set @return  = (SELECT COUNT(*) FROM dbo.Usuario  WHERE Usuario = @Usuario  AND Contrasena = @Contrasena);

return @return;

End

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Administrador(@USRID int, @Administrador bit)  

AS  

update dbo.Usuario set Administrador = @Administrador
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Seguridad(@USRID int, @Seguridad bit)  

AS  

update dbo.Usuario set Seguridad = @Seguridad
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Consecutivo(@USRID int, @Consecutivo bit)  

AS  

update dbo.Usuario set Consecutivo = @Consecutivo 
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Mantenimiento(@USRID int, @Mantenimiento bit)  

AS  

update dbo.Usuario set Mantenimiento = @Mantenimiento 
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Consulta(@USRID int, @Consulta bit)  

AS  

update dbo.Usuario set Consulta= @Consulta
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1) 

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Actualiza_Rol_Cliente(@USRID int, @Cliente bit)  

AS  

update dbo.Usuario set Cliente = @Cliente 
where USRID = @USRID;  
if @@rowcount <> 1   
raiserror('ID Usuario Invalido',16,1)
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Vuelos

AS

SELECT * FROM dbo.Vuelo

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_VLOID_Vuelos

AS

SELECT TOP 1 VLOID FROM dbo.Vuelo ORDER BY VLOID DESC

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Vuelos_Llegada

AS

SELECT * FROM dbo.Vuelo WHERE Procedencia != ''

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Vuelos_Salida

AS

SELECT * FROM dbo.Vuelo WHERE Destino != ''

Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Vuelo
( @Consec_Vuelo int,
  @Vuelo_Aerol int,
  @Vuelo_Aerop int,
  @CodVuelo nvarchar(150),
  @Destino nvarchar(150),
  @Procedencia nvarchar(150),
  @Fecha datetime,
  @Estado nvarchar(150),
  @Monto float)

 AS

INSERT INTO dbo.Vuelo(Consec_Vuelo, Vuelo_Aerol, Vuelo_Aerop, CodVuelo, Destino, Procedencia, Fecha, Estado, Monto)
VALUES (@Consec_Vuelo,@Vuelo_Aerol, @Vuelo_Aerop, @CodVuelo,@Destino,@Procedencia,@Fecha,@Estado,@Monto)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Go

USE WebDB
Go
CREATE PROCEDURE SP_Actualiza_Vuelo(@VLOID int, @Consec_Vuelo int, @Vuelo_Aerol int, @Vuelo_Aerop int, @CodVuelo nvarchar(150), @Destino nvarchar(150), 
@Procedencia nvarchar(150), @Fecha datetime, @Estado nvarchar(150), @Monto float)

AS  

UPDATE dbo.Vuelo SET Consec_Vuelo = @Consec_Vuelo, Vuelo_Aerol = @Vuelo_Aerol, Vuelo_Aerop = @Vuelo_Aerop, CodVuelo = @CodVuelo, Destino = @Destino, 
Procedencia = @Procedencia, Fecha = @Fecha, Estado = @Estado, Monto = @Monto
WHERE VLOID = @VLOID;  
IF @@rowcount <> 1   
RAISERROR('ID Vuelo Invalido',16,1) 
Go

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Eliminar_Vuelo
(@VLOID int)

AS

DELETE FROM dbo.Vuelo WHERE VLOID = @VLOID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Consec_Vuelo(@VLOID int)

AS

Select Consec_Vuelo from dbo.Vuelo where VLOID = @VLOID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Destino(@VLOID int)

AS

Select Destino from dbo.Vuelo where VLOID = @VLOID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Aerolinea_Vuelo(@VLOID int)

AS

SELECT Aerolinea.Nombre FROM dbo.Vuelo INNER JOIN dbo.Aerolinea ON Vuelo.Vuelo_Aerol = Aerolinea.ALNID WHERE Vuelo.VLOID = @VLOID
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Aeropuerto_Vuelo(@VLOID int)

AS

SELECT Aeropuerto.Num_Puerta FROM dbo.Vuelo INNER JOIN dbo.Aeropuerto ON Vuelo.Vuelo_Aerop = Aeropuerto.APTID WHERE Vuelo.VLOID = @VLOID
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Compras

AS

SELECT * FROM dbo.Compra

Go


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Compra
( 
  @Compra_Usuario int,
  @Consec_Compra int,
  @Destino nvarchar(150),
  @Cant_Boletos int,
  @TotalCompra float)


 AS

INSERT INTO dbo.Compra(Compra_Usuario, Consec_Compra, Destino, Cant_Boletos, TotalCompra)
VALUES (@Compra_Usuario, @Consec_Compra, @Destino,@Cant_Boletos,@TotalCompra)

GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Reservas

AS

SELECT * FROM dbo.Reserva_Boleto

Go


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE WebDB
Go
CREATE PROCEDURE SP_Inserta_Reservas
( 
  @Reserva_Usuario int,
  @Consec_Reserva int,
  @Destino nvarchar(150),
  @Cant_Boletos int,
  @TotalCompra float,
  @Num_Reserva int,
  @BookingID nvarchar(7))


 AS

INSERT INTO dbo.Reserva_Boleto(Reserva_Usuario, Consec_Reserva, Destino, Cant_Boletos, TotalCompra, Num_Reserva, BookingID)
VALUES (@Reserva_Usuario, @Consec_Reserva, @Destino,@Cant_Boletos,@TotalCompra,@Num_Reserva,@BookingID)

GO