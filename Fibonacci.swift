import XCTest

class Fibonacci {
    func number(_ num:Int) -> Int {
        if num > 2 {
            return number(num - 1) + number(num - 2)
        } else if num > 0 {
            return 1
        }
        return 0
    }
}

class TestFibonacci:XCTestCase {
    private var fibonacci:Fibonacci!
    
    override func setUp() {
        fibonacci = Fibonacci()
    }
    
    func testFirst() {
        XCTAssertEqual(1, fibonacci.number(1))
    }
    
    func testSecond() {
        XCTAssertEqual(1, fibonacci.number(2))
    }
    
    func testThird() {
        XCTAssertEqual(2, fibonacci.number(3))
    }
    
    func testFourth() {
        XCTAssertEqual(3, fibonacci.number(4))
    }
    
    func testFifth() {
        XCTAssertEqual(5, fibonacci.number(5))
    }
    
    func testSixth() {
        XCTAssertEqual(8, fibonacci.number(6))
    }
    
    func testZero() {
        XCTAssertEqual(0, fibonacci.number(0))
    }
}
