import Algorithms

public protocol EmptyInit {
    init()
    var isEmpty: Bool { get }
}

public struct Block<Sandbox: Collection>: Collection, Comparable {
    let sandbox: Sandbox
    public init(box: Sandbox) { sandbox = box }
    public var startIndex: Sandbox.Index { sandbox.startIndex }
    public var endIndex: Sandbox.Index { sandbox.endIndex }
    public subscript(position: Sandbox.Index) -> Sandbox.Element { sandbox[position] }
    public func index(after i: Sandbox.Index) -> Sandbox.Index { sandbox.index(after: i) }
    public static func < (lhs: Block<Sandbox>, rhs: Block<Sandbox>) -> Bool { lhs.sandbox.count < rhs.sandbox.count }
    public static func == (lhs: Block<Sandbox>, rhs: Block<Sandbox>) -> Bool { lhs.sandbox.count == rhs.sandbox.count }
}

enum StackError: Error { case bigerThanLast, undefined }

public struct VerticalStack<Row: Collection> where Row.Element: EmptyInit, Row: Comparable {
    
    
    var rows: [Row]
    public init() {
        rows = []
    }
    public var width: Int {
        let counts = rows.reduce([Int]()) { array, row in
            var a = array
            a.append(row.count)
            return a
        }
        return counts.max() ?? 0
    }
    public var height: Int {
        return rows.count
    }
    public var emptyRow: [Row.Element] {
        return Array(repeating: Row.Element(), count: width)
    }
    public subscript (index: Int) -> Chain2<Row, [Row.Element]>? {
        guard rows.indices.contains(index) else { return nil }
        let row = rows[index]
        let dif = Array(repeating: Row.Element(), count: width - row.count)
        let z = chain(row, dif)
        return z
    } 
    public mutating func push(element: Row) throws {
        if rows.isEmpty {
            rows.append(element)            
        } else {
            guard rows.last! > element else { throw StackError.bigerThanLast }
            rows.append(element)  
        }
    }
    public mutating func pop() -> Row? {
        rows.popLast()
    }
}

public enum StackPosition: Int, CaseIterable { 
    
    case rightStack = 0, middleStack, leftStack
    public static func getReminder(a: StackPosition, b: StackPosition) -> StackPosition {
        let reduce = StackPosition.allCases.reduce(0) { $0 + $1.rawValue }
        return StackPosition(rawValue: reduce - (a.rawValue + b.rawValue))!
    }
    
}

public struct HorisontalStck<Element> where Element: Collection, Element.Element: EmptyInit, Element: Comparable {
    
    var columns: [VerticalStack<Element>]
    
    public init() {
        columns = []
    }
    
    public var higherColumnCount: Int {
        let counts = columns.reduce([Int]()) { array, stack in
            var a = array
            a.append(stack.height)
            return a
        }
        return counts.max() ?? 0
    }
    
    
    public mutating func push(column: VerticalStack<Element>) {
        columns.append(column)
    }
    
    public mutating func popBlock(from position: StackPosition) -> Element? {
        columns[position.rawValue].pop()
    }
    public mutating func push(block: Element, to position: StackPosition) {
        do {
            try columns[position.rawValue].push(element: block) 
        } catch StackError.bigerThanLast {
            print("Alert!")
            render()
            fatalError("Error push stack. The element bigger than last")
        } catch {
            print("push error")
        }
    }
    
    public func getRows() -> [[Element.Element]] {
        var r = columns.reduce(0) { $0 + ($1.width + 1) }
        if columns.count > 2 { r -= 1 }
       
        
        let empty = Array(repeating: Element.Element(), count: r)
        var rows = Array(repeating: empty, count: higherColumnCount)
        for (i, row) in rows.enumerated() {
            
            var row = row
            var current = row.startIndex
            
            for column in columns {
    
                if let columnrow = column[i] {
                    let z = chain(columnrow, [Element.Element()])
                    current = MoveBlocks().push(bigrow: &row, smallrow: z, currentindex: current)
                } else {
                    let z = chain(column.emptyRow, [Element.Element()])
                    current = MoveBlocks().push(bigrow: &row, smallrow: z, currentindex: current)
                }
                
            }
            
            rows[i] = row
        }
        
        
        return rows
    }
    
    func getText() -> String {
        var out = ""
        for row in getRows().reversed() {
            let z = row.reduce("") { $0 + "\($1)" } + "\n"
            out += z
        }
        out.removeLast()
        return out
    }
    
    func render()  {
        print(getText())
    }
    
    func cleanrender() {
        
    }
}
