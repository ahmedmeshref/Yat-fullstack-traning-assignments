let degree = window.prompt("Input a number?");  

switch (degree) {
    case degree <= 0:
        console.log("Freezing");
        break;
    case degree > 0 && degree < 10:
        console.log("Cool");
        break;
    case degree >= 10 && degree < 25:
        console.log("fine");
        break;
    case degree >= 25 && degree < 40:
        console.log("hot");
        break;
    default:
        console.log("Too hot");
}