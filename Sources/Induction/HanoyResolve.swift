struct RecursionResolve {
    
    func move(from a: StackPosition, 
              to b: StackPosition, 
              howMuchBlocks: Int, 
              stack: HorisontalStck<Block<[Cell]>>) -> HorisontalStck<Block<[Cell]>> {
        if howMuchBlocks == 1 {
            var h = stack
            let block = h.popBlock(from: a)!
            h.push(block: block, to: b)
            print("")
            h.render()
            return h
        } else {
            let k = StackPosition.getReminder(a: a, b: b)
            var h1 = move(from: a, to: k, howMuchBlocks: howMuchBlocks - 1, stack: stack)
            let block = h1.popBlock(from: a)!
            h1.push(block: block, to: b)
            print("")
            h1.render()
            h1 = move(from: k, to: b, howMuchBlocks: howMuchBlocks - 1, stack: h1)
            return h1
        }
    }
    
    func run() {
        print("\nbegin")
        var h = HorisontalStck<Block<[Cell]>>()
        let v = VerticalStack<Block<[Cell]>>()
        
        
        
        
        h.push(column: v)
        h.push(column: v)
        h.push(column: v)
        
        let statement = Block(box: [Cell.full, .full, .full, .full, .full, .full, .full, .full, .full]) 
        h.push(block: statement, to: .leftStack)
        h.push(block: statement, to: .middleStack)
        h.push(block: statement, to: .rightStack)
        
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus, .rhombus, .rhombus, .rhombus,.rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus, .rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus]), to: .leftStack)
        
        h.render()
        print("")
        h = move(from: .leftStack, to: .middleStack, howMuchBlocks: 8, stack: h)
        print("")
        h.render()
    }
    
}

struct ThreeCaseResolve {
    func resolve() {
        
        print("\nbegin")
        var h = HorisontalStck<Block<[Cell]>>()
        let v = VerticalStack<Block<[Cell]>>()
        
        
        var block: Block<[Cell]>
        
        
        h.push(column: v)
        h.push(column: v)
        h.push(column: v)
        
        let statement = Block(box: [Cell.full, .full, .full, .full]) 
        h.push(block: statement, to: .leftStack)
        h.push(block: statement, to: .middleStack)
        h.push(block: statement, to: .rightStack)
        

        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus]), to: .leftStack)
        
        h.render()
        

        
        print("\nstep: 1")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
        print("\nstep: 2")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .middleStack)
        h.render()
        
        print("\nstep: 3")
        block = h.popBlock(from: .rightStack)!
        h.push(block: block, to: .middleStack)
        h.render()
        
        print("\nstep: 4")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
        print("\nstep: 5")
        block = h.popBlock(from: .middleStack)!
        h.push(block: block, to: .leftStack)
        h.render()
        
        print("\nstep: 6")
        block = h.popBlock(from: .middleStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
        print("\nstep: 7")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
    }
}


struct TwoCaseResolve {
    
    func resolve() {
        
        print("\nbegin")
        var h = HorisontalStck<Block<[Cell]>>()
        let v = VerticalStack<Block<[Cell]>>()

        
        var block: Block<[Cell]>
        
        
        h.push(column: v)
        h.push(column: v)
        h.push(column: v)
        
        let statement = Block(box: [Cell.full, .full, .full, .full]) 
        h.push(block: statement, to: .leftStack)
        h.push(block: statement, to: .middleStack)
        h.push(block: statement, to: .rightStack)
        
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus]), to: .leftStack)
        
        h.render()
        

        
        print("\nstep: 1")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .middleStack)
        h.render()
        
        print("\nstep: 2")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
        print("\nstep: 3")
        block = h.popBlock(from: .middleStack)!
        h.push(block: block, to: .rightStack)
        h.render()
    
        
    }
    
}


struct CrashRuleCase {
    func crash() {
        print("\nbegin")
        var h = HorisontalStck<Block<[Cell]>>()
        let v = VerticalStack<Block<[Cell]>>()
        
        
        var block: Block<[Cell]>
        
        
        h.push(column: v)
        h.push(column: v)
        h.push(column: v)
        
        let statement = Block(box: [Cell.full, .full, .full, .full, .full]) 
        h.push(block: statement, to: .leftStack)
        h.push(block: statement, to: .middleStack)
        h.push(block: statement, to: .rightStack)
        
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus, .rhombus]), to: .leftStack)
        h.push(block: Block(box: [.rhombus, .rhombus]), to: .leftStack)
        
        h.render()
        
        
        
        print("\nstep: 1")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .rightStack)
        h.render()
        
        print("\nstep: 2")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .middleStack)
        h.render()
        
        print("\nstep: 3")
        block = h.popBlock(from: .leftStack)!
        h.push(block: block, to: .middleStack)
        h.render()
    }
}

public struct HanoyApp {
    public init() {}
    public func run() {
        RecursionResolve().run()
//        Positions().testPosition()
//        CrashRuleCase().crash()
//        ThreeCaseResolve().resolve()
//        TwoCaseResolve().resolve()
    }
}

