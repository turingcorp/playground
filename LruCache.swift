import XCTest

class LruCache {
    private let size:Int
    private var cache:[(String, Int)] = []
    
    init(size:Int) {
        self.size = size
    }
    
    func get(key:String) -> Int {
        guard let index = cache.firstIndex(where: { (item, value) -> Bool in return item == key } ) else { return -1 }
        let item = cache.remove(at:index)
        cache.insert(item, at:0)
        return item.1
    }
    
    func set(key:String, value:Int) {
        cache.removeAll { (item, _) -> Bool in return item == key }
        cache.insert((key, value), at:0)
        if cache.count > size {
            let _ = cache.popLast()
        }
    }
}

class TestLruCache:XCTestCase {
    func testNonExistingKey() {
        XCTAssertEqual(-1, LruCache(size:0).get(key:"a"))
    }
    
    func testReleaseCapacity() {
        let cache = LruCache(size:1)
        cache.set(key:"a", value:3)
        cache.set(key:"b", value:4)
        XCTAssertEqual(-1, cache.get(key:"a"))
        XCTAssertEqual(4, cache.get(key:"b"))
    }
    
    func testReleaseOnlyLastUsed() {
        let cache = LruCache(size:2)
        cache.set(key:"a", value:4)
        cache.set(key:"b", value:5)
        let _ = cache.get(key:"a")
        cache.set(key:"c", value:6)
        XCTAssertEqual(6, cache.get(key:"c"))
        XCTAssertEqual(-1, cache.get(key:"b"))
        XCTAssertEqual(4, cache.get(key:"a"))
    }
    
    func testUpdateValue() {
        let cache = LruCache(size:2)
        cache.set(key:"b", value:5)
        cache.set(key:"a", value:3)
        cache.set(key:"a", value:4)
        XCTAssertEqual(5, cache.get(key:"b"))
        XCTAssertEqual(4, cache.get(key:"a"))
    }
}
