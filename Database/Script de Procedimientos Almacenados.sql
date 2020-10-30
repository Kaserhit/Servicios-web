Use WebDB
Go
CREATE PROCEDURE SP_Solicitar_Info_Consecutivos
AS
SELECT * FROM dbo.Consecutivo


CREATE PROCEDURE SP_Inserta_Consecutivo
( @Consec_Pais int,
  @Descripcion nvarchar,  
  @Consecutivo nvarchar,
  @Prefijo nvarchar,
  @RangoInicial int,
  @RangoFinal int)

 AS

Insert into dbo.Consecutivo(Consec_Pais, Descripcion,Consecutivo,Prefijo, RangoInicial, RangoFinal) values(@Consec_Pais, @Descripcion,@Consecutivo, @Prefijo,@RangoInicial,@RangoFinal)


exec SP_Solicitar_Info_Consecutivos