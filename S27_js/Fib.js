

function rec_fib(n) {
    let memo = {};

    function find_memo(n) {
        if (n == 0) return 0;
        else if (n <= 2) return 1;
        else if (n in memo) return memo[n];
        let res = find_memo(n - 1) + find_memo(n - 2);
        memo[n] = res;
        return res
    }

    return find_memo(n);
}


function fib(n) {
    if (n < 0) return null;
    else if (n == 0) return 0;
    else if (n <= 2) return 1;
    else {
        let x = 0, y = 1, z = 1;
        for (let i = 2; i <= n; i++) {
            z = x + y;
            [x, y] = [y, z];
        }
        return z;
    }
}


console.log(fib(5));