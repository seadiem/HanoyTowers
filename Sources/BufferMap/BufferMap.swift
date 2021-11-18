import Induction


public struct BufferReplacer<Element> {
    
    let bigbuffer: [[Element]]
    let smallbuffer: [[Element]]
    
    func replace() -> [[Element]] {
        var result = bigbuffer
        for (index, row) in result.enumerated() {
            if smallbuffer.indices.contains(index) {
                let smallrow = smallbuffer[index]
                var replaced = row
                replaced.replaceSubrange(smallrow.indices, with: smallrow)
                result[index] = replaced
            }
        }
        return result
    }
}

struct Buffer<Element> {
    var content: [[Element]]
    func render() {
        for row in content {
            print(row)
        }
    }
}


public struct BufferTets {
    public init() {}
    public func run() {
        
        let row = Array<Cell>(repeating: .empty, count: 40)
        let column = Array(repeating: row, count: 15)
        var buffer = Buffer(content: column)
        buffer.content[5][6] = .hart
        buffer.render()
        
        
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
        
        let rows = h.getRows()
        
        for row in rows {
            print(row)
        }
        
//        let a = buffer.content.first!
//        let b = h.getRows().first!
//        
//        print(a)
//        print(b)
//        
//        var c = a
//        c.replaceSubrange(b.indices, with: b)
//        print(c)
        
        let replacer = BufferReplacer(bigbuffer: buffer.content, smallbuffer: h.getRows())
        let result = replacer.replace()
        
        
        for row in result {
            print(row)
        }
        
    }
}
