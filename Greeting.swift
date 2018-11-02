import XCTest

private class Greeting {
    var messages:[[Language]] = [[Constant("Hello "), Name(), Constant("!")],
        [Constant("Nice to meet you!")],
        [Constant("Echo tells your name "), Name(), Constant(", "), Name(), Constant(", "), Name(), Constant("...")],
        [Constant("Im not going to say your name")],
        [Constant("-_-")],
        [Name(), Constant(" is a beautiful name")]]
    
    @discardableResult func name(_ name:String) -> String {
        let message = messages.removeFirst()
        messages.append(message)
        return message.reduce(String()) { return $0 + $1.messageFor(name) }
    }
}

private protocol Language {
    func messageFor(_ name:String) -> String
}

private class Constant:Language {
    let message:String
    
    init(_ message:String) {
        self.message = message
    }
    
    func messageFor(_ name:String) -> String { return message }
}

private class Name:Language {
    func messageFor(_ name:String) -> String { return name }
}

class TestGreeting:XCTestCase {
    private var greeting:Greeting!
    
    override func setUp() {
        greeting = Greeting()
    }
    
    func testHelloDifferentName() {
        XCTAssertEqual("Hello John!", greeting.name("John"))
        greeting = Greeting()
        XCTAssertEqual("Hello Mary!", greeting.name("Mary"))
    }
    
    func testMessages() {
        XCTAssertEqual("Hello John!", greeting.name("John"))
        XCTAssertEqual("Nice to meet you!", greeting.name("Jane"))
        XCTAssertEqual("Echo tells your name Sissy, Sissy, Sissy...", greeting.name("Sissy"))
        XCTAssertEqual("Im not going to say your name", greeting.name("Peter"))
        XCTAssertEqual("-_-", greeting.name("Den"))
        XCTAssertEqual("Robin is a beautiful name", greeting.name("Robin"))
    }
    
    func testRestarting() {
        XCTAssertEqual("Hello John!", greeting.name("John"))
        for _ in 0 ..< greeting.messages.count - 1 { greeting.name("") }
        XCTAssertEqual("Hello John!", greeting.name("John"))
    }
}
