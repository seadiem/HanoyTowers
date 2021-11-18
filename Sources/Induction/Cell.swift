public enum Cell: String, EmptyInit, CustomStringConvertible {
    
    case empty = "◻︎"
    case full = "◼︎"
    case rhombus = "◆"
    case hart = "❤︎"
    case snow = "❆"
    public init() { self = .empty }
    public var isEmpty: Bool { self == .empty }
    public var description: String { rawValue }
}




