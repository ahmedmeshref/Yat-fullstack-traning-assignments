/*
Create a function that takes an array of numbers and return 
"Boom!" if the digit 7 appears in the array. Otherwise, return
 "there is no 7 in the array".
*/

function sevenBoom(arr) {
    for (let num of arr) {
        while (num != 0) {
            if (num % 10 == 7) return "Boom!";
            num = Math.floor(num / 10);
        }
    }
    return "there is no 7 in the array";
}

// let sevenBoom = (arr) => {
//     return arr.join("").indexOf('7') >= 0 ? "Boom" : "there is no 7 in the array";
// }   

console.log(sevenBoom([1, 2, 3, 4, 5, 6, 7])) // "Boom!"
// 7 contains the number seven.

console.log(sevenBoom([8, 6, 33, 100])) // "there is no 7 in the array"
// None of the items contain 7 within them.

console.log(sevenBoom([2, 55, 60, 97, 86])) // "Boom!"
// 97 contains the number seven.