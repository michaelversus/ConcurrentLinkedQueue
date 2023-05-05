import XCTest
import ConcurrentLinkedQueue

final class ConcurrentLinkedQueueTests: XCTestCase {
    
    func test_isEmpty_givenEmptyQueue() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        
        // When
        let isEmpty = await sut.isEmpty
        
        // Then
        XCTAssertTrue(isEmpty)
    }
    
    func test_isEmpty_givenNonEmptyQueue() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        await sut.push(1)
        
        // When
        let isEmpty = await sut.isEmpty
        
        // Then
        XCTAssertFalse(isEmpty)
    }
    
    func test_pop_givenEmptyConcurrentLinkedQueue() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        
        // When
        let result = await sut.pop()
        
        // Then
        XCTAssertNil(result)
    }
    
    func test_pop_given1Element() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        await sut.push(1)
        
        // When
        let result = await sut.pop()
        
        // Then
        let isEmpty = await sut.isEmpty
        XCTAssertEqual(result, 1)
        XCTAssertTrue(isEmpty)
    }
    
    func test_pop_given2Elements() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        await sut.push(1)
        await sut.push(2)
        
        // When
        let result1 = await sut.pop()
        let result2 = await sut.pop()
        
        // Then
        let sutIsEmpty = await sut.isEmpty
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertTrue(sutIsEmpty)
    }
    
    func test_copyQueueAndDelete() async {
        // Given
        let sut = ConcurrentLinkedQueue<Int>()
        await sut.push(1)
        await sut.push(2)
        
        // because queue is an actor it behaves like a class on copy
        let copySut = sut
        
        // When
        let result1 = await sut.pop()
        let result2 = await sut.pop()
        
        // Then
        let sutIsEmpty = await sut.isEmpty
        let copySutIsEmpty = await copySut.isEmpty
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertTrue(sutIsEmpty)
        XCTAssertTrue(copySutIsEmpty)
    }
}
