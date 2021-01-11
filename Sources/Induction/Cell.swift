enum Cell: String, EmptyInit, CustomStringConvertible {
    
    case empty = "◻︎"
    case full = "◼︎"
    case rhombus = "◆"
    case hart = "❤︎"
    case snow = "❆"
    init() { self = .empty }
    var isEmpty: Bool { self == .empty }
    var description: String { rawValue }
}




