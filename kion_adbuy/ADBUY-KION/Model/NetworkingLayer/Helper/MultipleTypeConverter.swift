
import Foundation

enum MyValue: Decodable {
    case stringType(String)
    case intType(Int)
    case doubleType(Double)
    case floatType(Float)
    case boolType(Bool)

    var Value: Any? {
        switch self {
        case .stringType(let s):
            return s
        case .intType(let i):
            return i
        case .doubleType(let d):
            return d
        case .floatType(let f):
            return f
        case .boolType(let b):
            return b
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self = .stringType(string)
            return
        }
        
        if let int = try? container.decode(Int.self) {
            self = .intType(int)
            return
        }
        
        if let double = try? container.decode(Double.self) {
            self = .doubleType(double)
            return
        }
        
        if let float = try? container.decode(Float.self) {
            self = .floatType(float)
            return
        }
        
        if let bool = try? container.decode(Bool.self) {
            self = .boolType(bool)
            return
        }
    
        throw DecodingError.typeMismatch(MyValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
    }
}
