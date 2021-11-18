public struct App {
    
    public init() {}
    public func run() {
        HanoyApp().run()
    }
    
    func checkStack() {
        let h = HorisontalStck<Block<[Cell]>>()
        h.render()
    }
    
}
