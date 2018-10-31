import XCTest

private class Greeting {
    var messages = ["Hello %@!",
                    "Nice to meet you!",
                    "Echo tells your name %@, %@, %@...",
                    "Im not going to say your name",
                    "-_-",
                    "%@ is a beautiful name"]
    
    @discardableResult func name(_ name:String) -> String {
        let message = messages.removeFirst()
        messages.append(message)
        return String(format:message,
                      arguments:Array(repeating:name, count:message.components(separatedBy:"%@").count - 1))
    }
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
