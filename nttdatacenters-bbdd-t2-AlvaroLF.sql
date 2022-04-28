------------------------------------------------------
-- Autor       : Álvaro Limón Flor
-- Descripción : Script PL/SQL - Formación SQL
------------------------------------------------------

DECLARE 
--Declaracion de variables y cursores
    CLUB_NAME VARCHAR(30);
    TRANSFER_COST VARCHAR(50);
    AGENT VARCHAR(30);
    TRANSFER_BONUS PLS_INTEGER;
    AVG_STADIUM VARCHAR(50);
    CURSOR CLUB_AND_STADIUMS IS SELECT NAME,STADIUM FROM FPD_SOCCER_TEAM;
    CURSOR JAEN_CLUB IS SELECT NAME FROM FPD_SOCCER_TEAM WHERE CITY LIKE 'Jaén';
    CURSOR AVG_STADIUM_CAPACITY IS SELECT AVG(STADIUM_CAPACITY) FROM FPD_SOCCER_TEAM;
BEGIN
--Se abre el cursor AVG_STADIUM_CAPACITY
    OPEN AVG_STADIUM_CAPACITY;
    --Se traslada la información del cursor a una variable
    FETCH AVG_STADIUM_CAPACITY INTO AVG_STADIUM;
    --La variable pasa por unos IFS
        IF AVG_STADIUM < 10000 THEN
            AVG_STADIUM := 'necesitan ampliar las gradas';
        ELSE 
            AVG_STADIUM := 'caben muchas personas en general';
        END IF;
        --Se imprime el resultado de la variable tras ser modificada por los IFS
        dbms_output.put_line('En estos estadios ' || AVG_STADIUM);
        --Se añade una línea en blanca para que sea más visual la salida del script por DBMS
        dbms_output.new_line;
    --Se asigna un valor a la variable
    TRANSFER_COST := '50.000.000 euros';
    --Se imprime el resultado de la variable
    dbms_output.put_line('El traspaso tiene un coste de ' || TRANSFER_COST);
    dbms_output.new_line;
    --Se asigna un valor a la variable
    AGENT := 'Mino Raiola';
    --Se imprime el resultado de la variable
    dbms_output.put_line('El agente del futbolista es ' || AGENT);
    dbms_output.new_line;
    --Se asigna un valor a la variable
    TRANSFER_BONUS := 10000000;
    --Se imprime el resultado de la variable
    dbms_output.put_line('La prima por fichaje es de ' || TRANSFER_BONUS || ' euros');
    dbms_output.new_line;
    --Se abre el cursor JAEN_CLUB
    OPEN JAEN_CLUB;
    --La información es depositada en la variable CLUB_NAME
    FETCH JAEN_CLUB INTO CLUB_NAME;
    --Se imprime el resultado de la variable
    dbms_output.put_line('El nombre del equipo de Jaén es '|| CLUB_NAME);
    dbms_output.new_line;
    --Se crea un FOR para el cursor CLUB_AND_STADIUMS
FOR CLUB_AND_STADIUM IN CLUB_AND_STADIUMS
    --Inicio del LOOP
    LOOP
    --Se imprimen las dos líneas junto con los valores que van recogiendo del cursor
    dbms_output.put_line('El nombre del club es ' || CLUB_AND_STADIUM.NAME || ',');
    dbms_output.put_line('y el nombre del estadio es ' || CLUB_AND_STADIUM.STADIUM);
    dbms_output.new_line;
    --Fin del LOOP
    END LOOP;
END;

--El procedimiento se debe ejecutar de manera individual, de lo contrario el script da fallo.
--Por ello está comentada, de forma que no da errores al lanzar el script
/*
CREATE OR REPLACE
PROCEDURE CHANGE_TEAM_FIRST_COLOR(ClubName VARCHAR,FirstColor VARCHAR)
IS
BEGIN
  UPDATE FPD_SOCCER_TEAM
    SET FIRST_COLOR = FirstColor WHERE NAME = ClubName;
END CHANGE_TEAM_FIRST_COLOR;
*/