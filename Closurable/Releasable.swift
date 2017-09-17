//
//  Releasable.swift
//  Closurable
//
//  Created by Toru Asai on 2017/09/07.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

public protocol Releasable {
    func release()
}

public final class ActionReleasable: Releasable {
    private var _observer: Any?
    private var _action: (() -> Void)?
    
    public init(with observer: Any, action: @escaping () -> Void) {
        _observer = observer
        _action = action
    }
    
    public func release() {
        _action?()
        _observer = nil
    }
}

public final class NoOptionalReleasable: Releasable {
    private var _observer: Any?
    
    public init(with observer: Any) {
        _observer = observer
    }
    
    public func release() {
        _observer = nil
    }
}
