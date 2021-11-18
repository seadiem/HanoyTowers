
struct EvenOdd {
    func odd(number a: Int) -> Bool {
        a / 2 == (a - 1) / 2
    }
    
}

struct Multiplycation {
    
    func recursevlyHalf(n: Int) {
        print(n)
        if n == 1 { return }
        recursevlyHalf(n: n / 2)
    }
    
    func recursevlyMinus(n: Int) {
        print(n)
        if n == 1 { return }
        recursevlyMinus(n: n - 1)
    }
    
    func multiplyBy15(number a: Int) -> Int {
        let b = (a + a) + a
        let c = b + b
        let d = (c + c) + b
        return d
    }
    
    func multyply2(a: Int, times n: Int) -> Int {
        if n == 1 { return a }
        return multAcc4(r: a, n: n - 1, a: a)
    }
    
    func multAcc4(r: Int, n: Int, a: Int) -> Int {
        while true {
            var r = r
            var n = n
            var a = a
            if EvenOdd().odd(number: n) {
                r = r + a
                if (n == 1) { return r }
            }
            n = n / 2
            a = a + a
        }
    } 
    
    func multAcc3(r: Int, n: Int, a: Int) -> Int {
        var r = r
        var n = n
        var a = a
        if EvenOdd().odd(number: n) {
            r = r + a
            if (n == 1) { return r }
        }
        n = n / 2
        a = a + a
        return multAcc2(r: r, n: n, a: a)
    }
    
    func multAcc2(r: Int, n: Int, a: Int) -> Int {
        var r = r
        if EvenOdd().odd(number: n) {
            r = r + a
            if (n == 1) { return r }
        }
        return multAcc2(r: r, n: n / 2, a: a + a)
    }
    
    func multAcc1(r: Int, n: Int, a: Int) -> Int {
        var r = r
        if n == 1 { return r + a }
        if EvenOdd().odd(number: n) { r = r + a }
        return multAcc0(r: r, n: n / 2, a: a + a)
    }
    
    func multAcc0(r: Int, n: Int, a: Int) -> Int {
        if n == 1 { return r + a }
        if EvenOdd().odd(number: n) { return multAcc0(r: r + a, n: n / 2, a: a + a) }
        else { return multAcc0(r: r, n: n / 2, a: a + a) }
    }
    
    func multyply1(times n: Int, a: Int) -> Int {
        print(n)
        if n == 1 { return a }
        var result = multyply1(times: n / 2, a: a + a)
        print("+")
        if EvenOdd().odd(number: n) { 
            result = result + a 
            print("+")
        }
        return result
    }
    
    func multyply(a: Int, times n: Int) -> Int {
        if n == 1 { return a }
        else { return multyply(a: a, times: n - 1) + a } //  multyply(a: a, times: n - 1) огромный индукционный результат(An), (a + An)
    }
    
    func check() {
        let z = multyply1(times: 15, a: 3)
        print(z)
//        recursevlyMinus(n: 10)
 //       recursevlyHalf(n: 100)
    }
    
}
