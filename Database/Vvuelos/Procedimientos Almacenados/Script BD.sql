USE [MASTER]	
GO

IF ( EXISTS ( SELECT * FROM SYSDATABASES WHERE name = 'WebDB'))
	BEGIN TRY  
		PRINT ' - Eliminando BD previa -  '
		DROP DATABASE WebDB -- Si existe la elimino
	END TRY  
	BEGIN CATCH  
		-- Detalles del error --code to run if error occurs
		PRINT ' - La BD no se pudo eliminar, detalles...'
		PRINT '		Error Number    : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_NUMBER()), ' - ')
		PRINT '		Error State     : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_STATE()), ' - ')
		PRINT '		Error Severity  : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_SEVERITY()), ' - ')
		print '		Error Procedure : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_PROCEDURE()), ' - ')
		PRINT '		Error Line      : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_LINE()), ' - ')
		PRINT '		Error Message   : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_MESSAGE()), ' - ')
		/*SELECT
			ERROR_NUMBER() AS ErrorNumber,		-- Devuelve el n�mero interno del error
			ERROR_STATE() AS ErrorState,		-- Devuelve la informaci�n sobre la fuente
			ERROR_SEVERITY() AS ErrorSeverity,  -- Devuelve la informaci�n sobre cualquier cosa, desde errores informativos hasta errores que el usuario de DBA puede corregir, etc.
			ERROR_PROCEDURE() AS ErrorProcedure,-- Devuelve el nombre del procedimiento almacenado o la funci�n
			ERROR_LINE() AS ErrorLine,			-- Devuelve el n�mero de l�nea en el que ocurri� un error
			ERROR_MESSAGE() AS ErrorMessage*/   -- Devuelve la informaci�n m�s esencial y ese es el mensaje de texto del error
		PRINT '	 ** Posible solucion: Si no ha modificado el script, habilite el ALTER de la linea 5'
		--PRINT '		Error Message   : ' + ISNULL(CONVERT(NVARCHAR(MAX), ERROR_MESSAGE()), ' - ')
	END CATCH
GO

CREATE DATABASE [WebDB]
GO

USE [WebDB]
GO

CREATE TABLE [dbo].[Rol](

	[ROLID] [INT] NOT NULL IDENTITY,
	[Nombre_Rol] [NVARCHAR](20) NOT NULL,
	[Descripcion] [NVARCHAR] (150)

	CONSTRAINT [PK_ROL_ROLID] PRIMARY KEY([ROLID])
)
GO

INSERT INTO [dbo].[Rol] values ('Administrador', 'Acceso a todas las funciones.')

INSERT INTO [dbo].[Rol] values ('Seguridad', 'Acceso exclusivo a la creación de nuevos usuarios y ver los usuarios.')

INSERT INTO [dbo].[Rol] values ('Consecutivo', 'Acceso exclusivo a los consecutivos.')

INSERT INTO [dbo].[Rol] values ('Mantenimiento', 'Acceso a crear, modificar y eliminar registros del menú administración.')

INSERT INTO [dbo].[Rol] values ('Consultas', ' Acceso exclusivo a las consultas que posea el sistema.')

INSERT INTO [dbo].[Rol] values ('Cliente', 'Acceso a los vuelos del sistema.')

GO

CREATE TABLE [dbo].[Usuario](

	[USRID] [INT] NOT NULL IDENTITY,
	[Usuario] [NVARCHAR] (150),
	[Contrasena] [NVARCHAR] (150) NOT NULL,
	[Nombre] [NVARCHAR] (150),
	[Primer_Apellido] [NVARCHAR] (150) NOT NULL,
	[Segundo_Apellido] [NVARCHAR] (150),
	[Pregunta] [NVARCHAR] (150) NOT NULL,
   	[Respuesta] [NVARCHAR] (150) NOT NULL,
	[Correo] [NVARCHAR] (150) NOT NULL,
	[Administrador][BIT],
	[Seguridad][BIT],
	[Consecutivo][BIT],
	[Mantenimiento][BIT],
	[Consulta][BIT],
	[Cliente][BIT]

	CONSTRAINT [PK_USER_USRID] PRIMARY KEY([USRID])
)
GO

INSERT INTO [dbo].[Usuario] values ('user', 'pass', 'Mauricio', 'P', 'M', '¿Cual es su videojuego favorito?', 'War Rock', 'mpm@gmail.com', 1, 1, 1, 1, 1, 0)
GO

CREATE TABLE [dbo].[Rol_Usuario](

	[USRID] [INT] NOT NULL,
	[ROLID] [INT] NOT NULL,
	[Estado] [BIT]

	CONSTRAINT [PK_ROL_USER_ID] PRIMARY KEY([USRID],[ROLID])
	CONSTRAINT [FK1_ROL_USER_USER] FOREIGN KEY ([USRID]) REFERENCES Usuario([USRID]),
	CONSTRAINT [FK2_ROL_USER_ROL] FOREIGN KEY ([ROLID]) REFERENCES Rol([ROLID])
)
GO

INSERT INTO [dbo].[Rol_Usuario] values (1, 1, 1)

INSERT INTO [dbo].[Rol_Usuario] values (1, 2, 1)

INSERT INTO [dbo].[Rol_Usuario] values (1, 3, 1)

INSERT INTO [dbo].[Rol_Usuario] values (1, 4, 1)

INSERT INTO [dbo].[Rol_Usuario] values (1, 5, 1)

INSERT INTO [dbo].[Rol_Usuario] values (1, 6, 0)

GO

CREATE TABLE [dbo].[Consecutivo](

	[CSVID] [INT] NOT NULL IDENTITY,
	[Descripcion] [NVARCHAR] (150) NOT NULL,
	[Consecutivo] [NVARCHAR] (150) NOT NULL,
	[Prefijo] [NVARCHAR] (5),
	[RangoInicial] [INT],
	[RangoFinal] [INT]

	CONSTRAINT [PK_CONSEC_CSVID] PRIMARY KEY([CSVID])
)
GO

INSERT INTO [dbo].[Consecutivo] values ('Aerolínea', '150', 'AE-', 100, 200)

GO


CREATE TABLE [dbo].[Pais](

	[PAISID] [INT] NOT NULL IDENTITY,
	[Consec_Pais] [INT] NOT NULL,
	[CodPais] [NVARCHAR] (150) NOT NULL,
	[Nombre] [NVARCHAR] (150) NOT NULL,
	[Imagen] [NVARCHAR] (max) NOT NULL

	CONSTRAINT [PK_PAIS_PAISID] PRIMARY KEY([PAISID]),
	CONSTRAINT [FK_PAIS_CONSEC] FOREIGN KEY ([Consec_Pais]) REFERENCES Consecutivo([CSVID])
)
GO

INSERT INTO [dbo].[Pais] values (1, 'CR', 'Costa Rica', 'CR.JPG')
GO

CREATE TABLE [dbo].[Bitacora](

	[BTCID] [INT] NOT NULL IDENTITY,
	[Consec_Bitacora] [INT] NOT NULL,
	[Usuario_Bitac] [INT] NOT NULL,
	[Cod_Registro] [INT] NOT NULL,
	[Fecha] [DATETIME] NOT NULL,
	[Tipo] [NVARCHAR] (150) NOT NULL,
	[Descripcion] [NVARCHAR] (150) NOT NULL,
	[Codigo] [NVARCHAR] (150),
	[Nombre] [NVARCHAR] (150),
	[Imagen] [NVARCHAR] (MAX),
	[Num_Puerta] [INT],
	[Detalle] [NVARCHAR] (150),
	[Consec_Descripcion] [NVARCHAR] (150),
	[Consecutivo] [NVARCHAR] (150),
	[Destino] [NVARCHAR] (150),
	[Procedencia] [NVARCHAR] (150),
	[Fecha_Vuelo] [DATETIME],
	[Estado] [NVARCHAR] (150),
	[Monto] [FLOAT]


	CONSTRAINT [PK_BITAC_BTCID] PRIMARY KEY([BTCID]),
	CONSTRAINT [FK_BITAC_USER] FOREIGN KEY ([Usuario_Bitac]) REFERENCES Usuario([USRID])	
)
GO

CREATE TABLE [dbo].[Error](

	[ERRID] [INT] NOT NULL IDENTITY,
	[Fecha] [DATETIME] NOT NULL,
	[Mensaje_Error] [NVARCHAR] (150) NOT NULL

	CONSTRAINT [PK_ERROR_ERRID] PRIMARY KEY([ERRID])
)
GO

CREATE TABLE [dbo].[Compra](

	[CMPID] [INT] NOT NULL IDENTITY,
	[Compra_Usuario] [INT] NOT NULL,
	[Consec_Compra] [INT] NOT NULL,
	[Destino] [NVARCHAR] (150) NOT NULL,
	[Cant_Boletos] [INT] NOT NULL,
	[TotalCompra] [FLOAT] NOT NULL

	CONSTRAINT [PK_COMPRA_CMPID] PRIMARY KEY([CMPID]),
	CONSTRAINT [FK1_COMPRA_USER] FOREIGN KEY ([Compra_Usuario]) REFERENCES Usuario([USRID]),
	CONSTRAINT [FK2_COMPRA_CONSEC] FOREIGN KEY ([Consec_Compra]) REFERENCES Consecutivo([CSVID])
)
GO

INSERT INTO [dbo].[Compra] values (1, 1, 'Costa Rica', 1, 25000)
GO

CREATE TABLE [dbo].[Reserva_Boleto](

	[RSVID] [INT] NOT NULL IDENTITY,
	[Reserva_Usuario] [INT] NOT NULL,
	[Consec_Reserva] [INT] NOT NULL,
	[Destino] [NVARCHAR] (150) NOT NULL,
	[Cant_Boletos] [INT] NOT NULL,
	[TotalCompra] [FLOAT] NOT NULL,
	[Num_Reserva] [INT] NOT NULL,
	[BookingID] [NVARCHAR] (7) NOT NULL

	CONSTRAINT [PK_RESERVA_RSVID] PRIMARY KEY([RSVID]),
	CONSTRAINT [UK_RESERVA_BOOK] UNIQUE(bookingID),
	CONSTRAINT [FK1_RESERVA_USER] FOREIGN KEY ([Reserva_Usuario]) REFERENCES Usuario([USRID]),
	CONSTRAINT [FK2_RESERVA_CONSEC] FOREIGN KEY ([Consec_Reserva]) REFERENCES Consecutivo([CSVID])
)
GO

INSERT INTO [dbo].[Reserva_Boleto] values (1, 1, 'Costa Rica', 1, 25000, 2000, 'ABCD75X')
GO

CREATE TABLE [dbo].[Aeropuerto](

	[APTID] [INT] NOT NULL IDENTITY,
	[Consec_Aerop] [INT] NOT NULL,
	[Cod_Puerta] [NVARCHAR] (150) NOT NULL,
	[Num_Puerta] [INT] NOT NULL,
	[Detalle] [NVARCHAR] (150) NOT NULL

	CONSTRAINT [PK_AEROP_APTID] PRIMARY KEY([APTID]),
	CONSTRAINT [FK_AEROP_CONSEC] FOREIGN KEY ([Consec_Aerop]) REFERENCES Consecutivo([CSVID])
)
GO

INSERT INTO [dbo].[Aeropuerto] values (1, 'PTA', 4, 'Abierta')
GO

CREATE TABLE [dbo].[Aerolinea](

	[ALNID] [INT] NOT NULL IDENTITY,
	[Aerol_Pais] [INT] NOT NULL,
	[Consec_Aerol] [INT] NOT NULL,
	[Codigo] [NVARCHAR] (150) NOT NULL,
	[Nombre] [NVARCHAR] (150) NOT NULL,
	[Imagen] [NVARCHAR] (max) NOT NULL

	CONSTRAINT [PK_AEROL_ALNID] PRIMARY KEY([ALNID]),
	CONSTRAINT [FK1_AEROL_CONSEC] FOREIGN KEY ([Consec_Aerol]) REFERENCES Consecutivo([CSVID]),
	CONSTRAINT [FK2_AEROL_PAIS] FOREIGN KEY ([Aerol_Pais]) REFERENCES Pais(PAISID)
)
GO

INSERT INTO [dbo].[Aerolinea] values (1, 1, 'CR-001', 'Copa', 'Copa.JPG')
GO

CREATE TABLE [dbo].[Vuelo](

	[VLOID] [INT] NOT NULL IDENTITY,
	[Consec_Vuelo] [INT] NOT NULL,
	[Vuelo_Aerol] [INT] NOT NULL,
	[Vuelo_Aerop] [INT] NOT NULL,
	[CodVuelo] [NVARCHAR] (150) NOT NULL,
	[Destino] [NVARCHAR] (150),
	[Procedencia] [NVARCHAR] (150),
	[Fecha] [DATETIME] NOT NULL,
	[Estado] [NVARCHAR] (150) NOT NULL,
	[Monto] [FLOAT] NOT NULL

	CONSTRAINT [PK_VUELO_VLOID] PRIMARY KEY([VLOID]),
	CONSTRAINT [FK1_VUELO_CONSEC] FOREIGN KEY ([Consec_Vuelo]) REFERENCES Consecutivo([CSVID]),
	CONSTRAINT [FK2_VUELO_AEROL] FOREIGN KEY ([Vuelo_Aerol]) REFERENCES Aerolinea([ALNID]),
	CONSTRAINT [FK3_VUELO_AEROP] FOREIGN KEY ([Vuelo_Aerop]) REFERENCES Aeropuerto([APTID])
)
GO

INSERT INTO [dbo].[Vuelo] values (1, 1, 1, 'CM 796', 'Costa Rica', '', 07/02/2020, 'Confirmado', 25000)
GO


-- Encriptacion de la base de datos
PRINT '... Encriptando BD ... Espere por favor ... '  


USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Vvuelos$Key';
GO

--Llave Maestra


OPEN MASTER KEY DECRYPTION BY PASSWORD = 'Vvuelos$Key';
GO
BACKUP MASTER KEY TO FILE = 'D:\Servicios Web\masterkey.mk' 
    ENCRYPTION BY PASSWORD = 'Vvuelos$Key';
GO


USE master;
GO 
-- Certificado
CREATE CERTIFICATE Vue_certificate WITH SUBJECT = 'Vuelos Certificate';
GO

SELECT * FROM sys.certificates where [name] = 'Vue_certificate'
GO


BACKUP CERTIFICATE Vue_certificate TO FILE = 'D:\Servicios Web\Vue_certificate.cer'
   WITH PRIVATE KEY (
         FILE = 'D:\Servicios Web\Vue_certificate.pvk',
         ENCRYPTION BY PASSWORD = 'Vue_certificate');
GO

-- Proceso de Encriptacion 
USE WebDB
GO

CREATE DATABASE ENCRYPTION KEY
   WITH ALGORITHM = AES_256
   ENCRYPTION BY SERVER CERTIFICATE Vue_certificate;
GO


ALTER DATABASE WebDB SET ENCRYPTION ON;
GO



/* Verificar Encriptacion */
SELECT 
DB_NAME(database_id) AS 'Base de datos'
,Encryption_State AS 'Estado de Encriptacion'
,key_algorithm AS 'Algoritmo de Encriptacion'
,key_length AS 'Tamaño de la llave'
FROM sys.dm_database_encryption_keys
GO
SELECT 
NAME AS 'Base de Datos'
,IS_ENCRYPTED AS 'Estado' 
FROM sys.databases where name ='WebDB'
GO