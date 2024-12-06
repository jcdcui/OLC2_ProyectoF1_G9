{{
  function makeInteger(o) {
    return parseInt(o.join(""), 10);
  }
}}

{
  if (options.multiplier) {
    input = `(${input})*(${options.multiplier})`;
  }
}

start
  = additive

additive
  = left:multiplicative "+" right:additive { return left + right; }
  / multiplicative

multiplicative
  = left:primary "*" right:multiplicative { return left * right; }
  / primary

primary
  = integer
  / "(" additive:additive ")" { return additive; }

integer "simple number"
  = digits:[0-9]+ { return makeInteger(digits); }