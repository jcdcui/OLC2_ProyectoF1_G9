
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
                  / "("_ expresion _")"
                  

// ----------------------  expresiones regulares --------------------


cadena
    = "\"" ([^\"])* "\""
   / "\'" ([^\"])* "\'"


 _ = [ \t]* //aqui _ es el nombre de la expresion 

identificador = [_a-z]i[_a-z0-9]i*

nl "nueva linea"
    = [ \t\r\n]*