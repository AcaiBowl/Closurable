//
//  DisposeBag.swift
//  Reactable
//
//  Created by Toru Asai on 2017/09/07.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

extension Disposable {
    public func disposed(by bag: DisposeBag) {
        bag.insert(self)
    }
}

public final class DisposeBag {
    
    private let lock = NSRecursiveLock(name: "com.AcaiBowl.Closurable.lock")
    private var disposables = [Disposable]()
    
    public init() {
    }
    
    public func insert(_ disposable: Disposable) {
        lock.lock(); defer { lock.unlock() }
        disposables.append(disposable)
    }
    
    public func dispose() {
        lock.lock(); defer { lock.unlock() }
        
        disposables.forEach { $0.dispose() }
        disposables.removeAll()
    }
    
    deinit {
        dispose()
    }
}

extension NSRecursiveLock {
    public convenience init(name: String) {
        self.init()
        self.name = name
    }
}
