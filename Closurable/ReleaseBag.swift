//
//  ReleaseBag.swift
//  Closurable
//
//  Created by Toru Asai on 2017/09/07.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

extension Releasable {
    public func released(by bag: ReleaseBag) {
        bag.insert(self)
    }
}

public final class ReleaseBag {
    
    private var releasables = [Releasable]()
    
    public init() {
    }
    
    public func insert(_ releasable: Releasable) {
        releasables.append(releasable)
    }
    
    public func release() {
        releasables.forEach { $0.release() }
        releasables.removeAll()
    }
    
    deinit {
        release()
    }
}
