
  // Definición de reglas en PeggyJS
 start 
  = regla (nl  regla)* 

 //------ Regla General ----------
 regla = identificador nl "=" _ seleccion nl ";" 
// ----- Manejo de mas de una regla --------
seleccion = expresionConcat (nl "/" nl expresionConcat)* 

// ----- Concatenacion ----------
 expresionConcat = expresion (_ expresion)* 

 expresion = expresionCuenatificada [?+*]? 

 expresionCuenatificada = identificador 
                  / cadena 
                  / "("(_ expresion)*")" 
                  

// ----------------------  expresiones regulares --------------------
cadena
    = "\""([^"]*) "\"" 
    / "'" ([^']*) "'" 

identificador = [_a-z]i[_a-z0-9]i* { return text(); }

 _ = [ \t]* //aqui _ es el nombre de la expresion 

nl "nueva linea"
    = [ \t\r\n]*