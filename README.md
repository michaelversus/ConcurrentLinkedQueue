# ConcurrentLinkedQueue

A simple ConcurrentLinkedQueue implementation using actors

# Example
```swift
let queue = ConcurrentLinkedQueue<Int>()

await queue.push(1)

let result = await queue.pop()

print(result) // prints 1
```
