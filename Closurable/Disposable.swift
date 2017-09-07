//
//  Disposable.swift
//  Reactable
//
//  Created by Toru Asai on 2017/09/07.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

public protocol Disposable {
    func dispose()
}

public final class ActionDisposable: Disposable {
    private var _observer: Any?
    private var _action: (() -> Void)?
    
    public init(with observer: Any, action: @escaping () -> Void) {
        _observer = observer
        _action = action
    }
    
    public func dispose() {
        _action?()
        _observer = nil
    }
}

public final class NoOptionalDisposable: Disposable {
    private var _observer: Any?
    
    public init(with observer: Any) {
        _observer = observer
    }
    
    public func dispose() {
        _observer = nil
    }
}
