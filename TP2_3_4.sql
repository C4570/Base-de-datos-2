USE Trabajo_practico_2

GO

CREATE PROCEDURE activo 
AS
BEGIN

UPDATE subscripcion --fecha_venc esta en la tabla pago
SET ds_activo = 'Inactivo'  -- si la fecha de vencimiento ha sido superada, se marca como inactivo
    FROM pago, subscripcion 
	WHERE (subscripcion.id_sub = pago.id_sub and GETDATE() > pago.fecha_ven)
UPDATE subscripcion 
SET ds_activo = 'Activo'  -- si la fehca de vencimiento no ha sido superada 
	FROM pago, subscripcion
	WHERE (subscripcion.id_sub = pago.id_sub and GETDATE() <= pago.fecha_ven)

END

GO

SELECT * FROM pago
SELECT * FROM subscripcion

EXEC activo

UPDATE pago
SET fecha_ven = '2022-12-7'
WHERE usuario = 'Lara'

----------------------------------------------------------------------------------------------------
--Ejercicio 4 


--Creacion del SP  
GO 

CREATE PROCEDURE usp_validlogin
@username nvarchar(50),
@pass nvarchar(50),
@isvalid int OUTPUT
AS
BEGIN

SET @isvalid = (SELECT COUNT(usuario.usuario) 
FROM Usuario, Subscripcion
WHERE Usuario.usuario = @username AND 
               Usuario.contraseña = @pass AND 
               Subscripcion.ds_activo = 'Activo')

IF @isvalid = 0
	SET @isvalid = 0
ELSE
	SET @isvalid = 1
END

GO

--Ejecutamos 

DECLARE @isvalid INT --Declaramos la variable OUTPUT
EXEC usp_validlogin 'Lara', '123', @isvalid OUTPUT
select @isvalid as Respuesta_del_SP --Mostramos lo que devuelve el SP. 

--Interpretacion del resultado de "@isvalid":
--Si me devuelve 1 quiere decir que el Usuario ingresado y la contraseña son correctas, y que ademas la subscripcion del mismo se encuentra activa

SELECT * FROM subscripcion, pago
WHERE pago.id_sub = subscripcion.id_sub