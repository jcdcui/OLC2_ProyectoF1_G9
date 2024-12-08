// Definición de reglas en PeggyJS
 start 
  = regla (nl  regla)* 

 //------ Regla General ----------
 regla = identificador nl "=" nl seleccion nl ";" 
// ----- Manejo de mas de una regla --------
seleccion = expresionConcat (nl "/" nl expresionConcat)* 

// ----- Concatenacion ----------
 expresionConcat = expresion (_ expresion)* 

 expresion = expresionCuenatificada [?+*]? 

 expresionCuenatificada = identificador 
                  / cadena 
                  / "("(_ expresion)*")" 
                  /rangos
                  

// ----------------------  expresiones regulares --------------------
cadena
    = "\""([^"]*) "\"" 
    / "'" ([^']*) "'" 
rangos
	="[" caracteres+"]"
caracteres
	=  range

range
	=  [^[\]-] "-" [^[\]-]
			/ [^[\]]+


identificador = [_a-z]i[_a-z0-9]i* { return text(); }

 _ = [ \t]* //aqui _ es el nombre de la expresion 

nl "nueva linea"
    = [ \t\r\n]*