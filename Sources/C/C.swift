public struct X {
    public init() {}
}
public protocol P {
    var id: String { get }
}
extension P {
    public var identity: String { id }
}
