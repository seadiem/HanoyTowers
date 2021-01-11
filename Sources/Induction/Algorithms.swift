import Algorithms

struct MoveBlocks {
    
    
    func push<Bigrow, Smallrow>(bigrow: inout Bigrow, smallrow: Smallrow, currentindex: Bigrow.Index) -> Bigrow.Index
    where Bigrow: RangeReplaceableCollection, Bigrow: MutableCollection, 
          Smallrow: Collection, 
          Bigrow.Element == Smallrow.Element, 
          Bigrow.Index == Int {
        
        let range = 0..<smallrow.count
        let b = bigrow.count
        let s = smallrow.count
        let t = b - s
        let index = t
        bigrow.rotate(toStartAt: index)
        bigrow.replaceSubrange(range, with: smallrow)
        let r = currentindex + range.count
        return r
    }
    
    
  
    
    func testPush() {
        var array: [Cell] = [.full, .full, .full, .full]
        var empty = Array(repeating: Cell.empty, count: 10)
        print(array)
        print(empty)
        var i = empty.startIndex
        i = push(bigrow: &empty, smallrow: array, currentindex: i)
        print(array)
        print(empty)
        array = [.rhombus, .rhombus]
        print(array)
        print(empty)
        i = push(bigrow: &empty, smallrow: array, currentindex: i)
        print(array)
        print(empty)
    }
    
    func rotate() {
        var array: [Cell] = [.full, .full, .full, .full, .empty, .empty, .empty, .empty, .empty, .empty]
        print(array)
        array.rotate(toStartAt: 6)
        print(array)
    }
    
    func exploreRanges() {
        var array: [Cell] = [.full, .full, .full, .full]
        var empty = Array(repeating: Cell.empty, count: 10)
        print(array)
        print(empty)
        var range = 0..<array.count
        empty.replaceSubrange(range, with: array)
        print(empty)
        array = [.rhombus, .rhombus]
        range = 0..<array.count
        empty.rotate(toStartAt: empty.count - range.count)
        print(array)
        print(empty)
        empty.replaceSubrange(range, with: array)
        print(empty)
    }
    
    func work() {
        testPush()
    }
}

struct Positions {
    func testPosition() {
        let a = StackPosition.leftStack
        let b = StackPosition.middleStack
        let c = StackPosition.rightStack
        
        let d = StackPosition.getReminder(a: a, b: b)
        let e = StackPosition.getReminder(a: a, b: c)
        let f = StackPosition.getReminder(a: c, b: b)
        
        assert(d == c)
        assert(e == b)
        assert(f == a)
        print("compleet")
    }
}
