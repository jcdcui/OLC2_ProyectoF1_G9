// Definición de reglas en PeggyJS
 start 
  =  comments.* /nl primera:regla* 
    

 //------ Regla General ----------
 regla = nl id:identificador nl cadena? nl "=" _ sel:seleccion nl (_ ";" _)? { return { type: "regla", id: id, sel: sel }; }
// ----- Manejo de mas de una regla --------
seleccion = primera:expresionConcat comentario: comments lista:(nl "/" nl expresionConcat)* { return [primera].concat(lista.map(r => r[3])); }

// ----- Concatenacion ----------
 expresionConcat = primera:expresionArranque lista:(_ expresionArranque)* { return [primera].concat(lista.map(r => r[1])); }

expresionArranque = "@"? _ etiqueta

etiqueta = (identificador _ ":")? _ expresion

expresion = "$"? _ expresionAnalisis _ quanticador?
            / "!"? _ expresionAnalisis _ quanticador?
            /"&"? _ expresionAnalisis _ quanticador?


quanticador = [?+*]
  / "|" _ (digito / identificador) _ "|"
  / "|" _ (digito / identificador)? _ ".." _ (digito / identificador)? _ "|"
  / "|" _ (digito / identificador)? _ "," _ seleccion _ "|"
  / "|" _ (digito / identificador)? _ ".." _ (digito / identificador)? _ "," _ seleccion _ "|"


 expresionAnalisis = id:identificador { return { type: "identificador", value: id }; }
                  / cad:cadena "i"? { return { type: "cadena", value: cad }; }
                  / "("_ sel:seleccion _")"  {return sel; }
                  /ran:rangos "i"? { return { type: "rango", value: ran }; }

// ----------------------  expresiones regulares ---pluc-----------------
comments
  = "//" content:([^\n]*) "\n"* 
    /"/*" content:(nopermitido*) "*/" "\n"* 
nopermitido
  = [^*] / "*" [^/]
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

digito
  = [0-9]+