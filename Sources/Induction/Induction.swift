
struct Multiplycation {
        
    func multyply(a: Int, times n: Int) -> Int {
        if n == 1 { return a }
        else { return multyply(a: a, times: n - 1) + a } //  multyply(a: a, times: n - 1) огромный индукционный результат(An), (a + An)
    }
    
    func check() {
        let z = multyply(a: 8, times: 2)
        print(z)
    }
    
}
