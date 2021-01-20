/*
Create a function that determines whether a number is Oddish or Evenish. 
A number is Oddish if the sum of all of its digits is odd, and a number is
 Evenish if the sum of all of its digits is even. If a number is Oddish,
  return "Oddish". Otherwise, return "Evenish".

For example, oddishOrEvenish(121) should return "Evenish", since 1 + 2 + 1 = 4. 
oddishOrEvenish(41) should return "Oddish", since 4 + 1 = 5.
*/

function oddishOrEvenish(num) {
    let tot = 0;
    while (num != 0) {
        tot += num % 10;
        num = Math.floor(num / 10);
    }
    if (tot % 2 == 0) return "Evenish";
    else return "Oddish";
}

console.log(oddishOrEvenish(10))
console.log(oddishOrEvenish(4433))
console.log(oddishOrEvenish(53)) // Evenish
console.log(oddishOrEvenish(21)) // Oddish