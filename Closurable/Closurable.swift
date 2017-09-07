//
//  Reactable.swift
//  Reactable
//
//  Created by Toru Asai on 2017/09/07.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import UIKit

public protocol Closurable: class {}
extension NSObject: Closurable {}

extension Closurable where Self: NSObject {    
    public func subscribe<Value>(_ keyPath: KeyPath<Self, Value>,
                                 closure: @escaping (Self, NSKeyValueObservedChange<Value>) -> Void) -> Disposable {
        let observation = observe(keyPath, options: [.new, .initial], changeHandler: closure)
        return NoOptionalDisposable(with: observation)
    }
}

extension Closurable where Self: UIControl {
    public func on(_ events: UIControlEvents, closure: @escaping (Any) -> Void) -> Disposable {
        let container = Container(closure: closure)
        addTarget(container, action: container.selector, for: events)
        return NoOptionalDisposable(with: container)
    }
}

extension Closurable where Self: UIButton {
    public func onTap(_ closure: @escaping (Any) -> Void) -> Disposable {
        let container = Container(closure: closure)
        addTarget(container, action: container.selector, for: .touchUpInside)
        return NoOptionalDisposable(with: container)
    }
}

extension Closurable where Self: UIBarButtonItem {
    public init(title: String, style: UIBarButtonItemStyle) {
        self.init()
        self.title = title
        self.style = style
    }
    
    public init(image: UIImage?, style: UIBarButtonItemStyle) {
        self.init()
        self.image = image
        self.style = style
    }
    
    public func onTap(_ closure: @escaping (Any) -> Void) -> Disposable {
        let container = Container(closure: closure)
        self.target = container
        self.action = container.selector
        return NoOptionalDisposable(with: container)
    }
}

extension Closurable where Self: UIGestureRecognizer {
    public func on(_ closure: @escaping (Any) -> Void) -> Disposable {
        let container = Container(closure: closure)
        addTarget(container, action: container.selector)
        return NoOptionalDisposable(with: container)
    }
}

extension Closurable where Self: NotificationCenter {
    public func on(name: NSNotification.Name?, object: Any? = nil, closure: @escaping (Any) -> Void) -> Disposable {
        let container = Container(closure: closure)
        addObserver(container, selector: container.selector, name: name, object: object)
        return ActionDisposable(with: container, action: { [weak self] in
            self?.removeObserver(container)
        })
    }
}

private final class Container {
    var closure: (Any) -> Void
    var selector: Selector {
        return #selector(selector(_:))
    }
    
    init(closure: @escaping (Any) -> Void) {
        self.closure = closure
    }
    
    @objc func selector(_ sender: Any) {
        closure(sender)
    }
}
