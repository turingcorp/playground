import XCTest

class Fibo {

    func get(_ num: Int) -> Int {
        switch num {
        case 0 : return 0
        case 1, 2 : return 1
        default :return get(num-1) + get(num-2)
        }
    }
}

class FiboTest: XCTestCase {
    private var fibo: Fibo!
    
    override func setUp() {
        fibo = Fibo()
    }
    
    func testNumberOneReturnsOne() {
        let numberOne: Int = 1
        
        let result = fibo.get(numberOne)
        
        XCTAssertEqual(result, 1)
    }
    
    func testNumberTwoReturnsOne() {
        let numberTwo: Int = 2
        
        let result = fibo.get(numberTwo)
        
        XCTAssertEqual(result, 1)
    }
    
    func testNumberThreeReturnsTwo() {
        let numberThree: Int = 3
        
        let result = fibo.get(numberThree)
        
        XCTAssertEqual(result, 2)
    }
    
    func testNumberFourReturnsThree() {
        let numberFour: Int = 4
        
        let result = fibo.get(numberFour)
        
        XCTAssertEqual(result, 3)
    }
    
    func testNumberZeroReturnsZero() {
        let numberZero: Int = 0
        
        let result = fibo.get(numberZero)
        
        XCTAssertEqual(result, 0)
    }
}
