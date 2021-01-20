

function fib(n) {
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

console.log(fib(1000));