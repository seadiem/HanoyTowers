public struct App {
    
    public init() {}
    public func run() {
        checkStack()
    }
    
    func checkStack() {
        var h = HorisontalStck<Block<[Cell]>>()
        h.render()
    }
    
}
