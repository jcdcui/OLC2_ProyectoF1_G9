
  // Definición de reglas en PeggyJS
 start 
  = regla
 //------ 1. Regla ----------
 regla = left:term "=" right:reglaA { return right; }

 reglaA = left:term "=" right:reglaA { returnright; }
        / left:term { return left; }

// ----- 2. Expresion + --------
expresionMas = left:erm "=" right:term "+" {  return right; }

// ----- 3. expresión_1 expresión_2 ... expresión_n ----------
 expresionConcat = left:term "=" right:expresionConcatA { return right; }

 expresionConcatA = left:expresionConcatA right:term { return left + right; }
                  / left:term { return right; }

 term
    = left:number { return left; }
    / left:identificador { return left; }

// ----------------------  expresiones regulares --------------------

  number = [0-9]+ { return parseInt(text()); }

 _ = [ \t\r\n] //aqui _ es el nombre de la expresion 

identificador = [a-zA-Z]+