import Foundation

fileprivate enum Level {
    case trace, debug,  information, notice, warning, error, critical
    
    var prefix: String {
        
        switch self {
        case .trace: return "🔵 [Trace] 🔵"
        case .debug: return "🟤 [Debug] 🟤"
        case .information: return "🟢 [Information] 🟢"
        case .notice: return "🟡 [Notice] 🟡"
        case .warning: return "🟠 [Warning] 🟠"
        case .error: return "🔴 [Error] 🔴"
        case .critical: return "🟣 [Critical] 🟣"
            
        }
    }
}

fileprivate struct Context {
    let file: String
    let function: String
    let line: Int
    
    var description: String {
        return "\((file as NSString).lastPathComponent) \(function) : \(line)"
    }
}

struct Printlog {
    
    fileprivate static func handle(level: Level, string: String, context: Context){
        let component = ["\(level.prefix) : \(string)"].joined(separator: "")
        var message = component
        message += " -> \(context.description)"

        #if DEBUG
        print(message)
        #endif
    }
    
    static func trace(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .trace, string: string.description, context: context)
    }
    
    static func debug(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .debug, string: string.description, context: context)
    }
    
    static func information(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .information, string: string.description, context: context)
    }
    
    static func notice(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .notice, string: string.description, context: context)
    }
    
    static func warning(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .warning, string: string.description, context: context)
    }
    
    static func error(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .error, string: string.description, context: context)
    }
    
    static func critical(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .critical, string: string.description, context: context)
    }
}
