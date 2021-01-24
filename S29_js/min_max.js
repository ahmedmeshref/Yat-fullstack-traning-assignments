function min_max(arr) {
    // check f arr is empty or undefined
    if (!arr || !arr.length) { 
        return null; 
    };

    let min = arr[0], max = arr[0];
    for (val of arr) {
        if (val > max) {
            max = val;
        }  else if (val < min) {
            min = val;
        }  
    }
    return [min, max];
}

l_1 = [1, 10, 20, 5, 200, 500, -2, 700, 700];
l_2 = [1000, -1, 0, -2, -6];
console.log(min_max(l_1));
console.log(min_max(l_2));
