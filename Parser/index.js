let x; 

function hola(){
    console.log("Holaa")
}

document.getElementById("procesar").addEventListener("click", function(){
    console.log("hola a todos!!!");
    x = document.getElementById("entrada").value;
    document.getElementById("salida").innerHTML = x;
});