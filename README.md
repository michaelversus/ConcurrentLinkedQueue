# ConcurrentLinkedQueue

A simple ConcurrentLinkedQueue implementation using actors

# Example
```swift
let queue = ConcurrentLinkedQueue<Int>()

queue.push(1)

let result = queue.pop()

print(result) // prints 1
```
