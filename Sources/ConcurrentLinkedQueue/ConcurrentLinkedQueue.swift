public actor ConcurrentLinkedQueue<T> {
    private class Node {
        let value: T
        var next: Node?
        
        init(_ value: T) {
            self.value = value
        }
    }
    
    public init() {}
    
    private var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public func push(_ value: T) {
        let newNode = Node(value)
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            tail!.next = newNode
            tail = newNode
        }
    }
    
    public func pop() -> T? {
        guard let oldHead = head else {
            return nil
        }
        
        head = oldHead.next
        
        if head == nil {
            tail = nil
        }
        
        return oldHead.value
    }
    
    public func addFirst(_ value: T) {
        let newNode = Node(value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
}
