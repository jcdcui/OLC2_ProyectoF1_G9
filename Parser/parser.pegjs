// Definición de reglas en PeggyJS
 start 
  = primera:regla lista:(nl regla)* {return [primera].concat(lista.map(r => r[1]));}

 //------ Regla General ----------
 regla = id:identificador nl "=" _ sel:seleccion nl ";" { return { type: "regla", id: id, sel: sel }; }
// ----- Manejo de mas de una regla --------
seleccion = primera:expresionConcat lista:(nl "/" nl expresionConcat)* { return [primera].concat(lista.map(r => r[3])); }

// ----- Concatenacion ----------
 expresionConcat = primera:expresion lista:(_ expresion)* { return [primera].concat(lista.map(r => r[1])); }

 expresion = exp:expresionCuenatificada quant:[?+*]? { return quant ? { ...exp, quantifier: quant } : exp; }

 expresionCuenatificada = id:identificador { return { type: "identificador", value: id }; }
                  / cad:cadena { return { type: "cadena", value: cad }; }
                  / "("sel:(_ seleccion)*")"  {return sel; }
                  /ran:rangos { return { type: "rango", value: ran }; }

                  

// ----------------------  expresiones regulares --------------------
cadena 
  = "\"" texto:([^"]*) "\"" { return texto.join(""); }
  / "'" texto:([^']*) "'" { return texto.join(""); }
rangos
	="[" caracteres:caracteres+"]" { return caracteres; }
caracteres
	=  range

range
	=  inicio:[^[\]-] "-" final:[^[\]-] { return { inicio, final }; }
			/ char:[^[\]]+ { return char; }


identificador = [_a-z]i[_a-z0-9]i* { return text(); }

 _ = [ \t]* //aqui _ es el nombre de la expresion 

nl "nueva linea"
    = [ \t\r\n]*