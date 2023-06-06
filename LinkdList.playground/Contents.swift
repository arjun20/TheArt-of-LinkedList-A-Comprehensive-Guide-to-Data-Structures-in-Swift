import UIKit

// Node which is hold the value
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkdList<T> {
    private var head: Node<T>?
    
// Append Operation
    
    //frist position
    func appendFirst(_ data: T) {
        let newNode = Node(value: data)
        newNode.next = head
        head = newNode
    }
    
    //last position
    func appendLast(_ data: T) {
        let newNode = Node(value: data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = newNode
    }
    
    //At index
    func appenValue(_ index: Int, _ data: T){
        if index == 0 {
            appendFirst(data)
            return
        }
        
        let newNode = Node(value: data)
        var currentNode = head
        
        for _ in 0...index-1 {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
//    Delete operation
    
    //First
    func deletFirst() {
        head = head?.next
    }
    
    //Last
    func deleteLast() {
        if head?.next == nil {
            head = nil
            return
        }
        
        var nextNode = head
        var perviousNode: Node<T>?
        
        while nextNode?.next != nil {
            perviousNode = nextNode
            nextNode = nextNode?.next
        }
        perviousNode?.next = nil
    }
    
    //Index
    func deleteIndex(_ index: Int) {
        if head?.next == nil {
            head = nil
            return
        }
        
        var nextNode = head
        var perviousNode: Node<T>?
        
        for _ in 0...index-1 {
            perviousNode = nextNode
            nextNode = nextNode?.next
        }
        perviousNode?.next = nextNode?.next
    }
    
//    Get Value
    
    //First
    func getFirst() -> T? {
        return head?.value
    }
    
    //Last
    func getLast() -> T? {
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node?.value
    }
    
    //All
    func getAll() -> [T]? {
        if head == nil {
            return nil
        }
        
        var result = [T]()
        var node = head
        result.append(node!.value)
        
        while node?.next != nil {
            result.append(node!.next!.value)
            node = node?.next
        }
        return result
    }
}

let linkedList = LinkdList<Int>()
linkedList.appendFirst(1)
linkedList.appendLast(2)
linkedList.appendLast(3)
linkedList.appendFirst(0)
linkedList.appenValue(3, 5)
linkedList.appenValue(3, 4)
linkedList.appenValue(3, 10)
linkedList.getAll()

linkedList.deleteIndex(4)
linkedList.getAll()
