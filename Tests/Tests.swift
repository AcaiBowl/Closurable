//
//  Tests.swift
//  Tests
//
//  Created by Toru Asai on 2017/09/18.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import XCTest
@testable import Closurable

class ClosurableTests: XCTestCase {
    
    var bag: ReleaseBag!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bag = ReleaseBag()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}

// MARK: - NSObject
extension ClosurableTests {
    class Mock: NSObject {
        @objc dynamic var value = "none"
    }
    
    func test_NSObject_subscribe() {
        let mock = Mock()
        
        var count: Int = 0
        mock.subscribe(\.value) { (mock, _) in
            count += 1
            }.released(by: bag)
        
        mock.value = "something"
        // .initial and .new
        XCTAssertEqual(count, 2)
        
        count = 0
        bag = nil
        mock.value = "something2"
        XCTAssertEqual(count, 0)
    }
}

// MARK: - UIControl
extension ClosurableTests {
    func test_UIControl_on() {
        let control = UIControl(frame: .zero)
        
        var count: Int = 0
        control.on(.valueChanged) { _ in
            count += 1
            }.released(by: bag)
        
        control.sendActions(for: .valueChanged)
        XCTAssertEqual(count, 1)
        
        count = 0
        bag = nil
        control.sendActions(for: .allEvents)
        XCTAssertEqual(count, 0)
    }
}

// MARK: - UIButton
extension ClosurableTests {
    func test_UIButton_onTap() {
        let button = UIButton(frame: .zero)
        
        var count: Int = 0
        button.onTap { _ in
            count += 1
            }.released(by: bag)
        
        button.sendActions(for: .touchUpInside)
        XCTAssertEqual(count, 1)
        
        count = 0
        bag = nil
        button.sendActions(for: .touchUpInside)
        XCTAssertEqual(count, 0)
    }
}

extension ClosurableTests {
    func test_UIBarButtonItem_onTap() {
        let item = UIBarButtonItem(title: "TEST", style: .done)
        
        var count: Int = 0
        item.onTap { _ in
            count += 1
            }.released(by: bag)
        
        UIApplication.shared.sendAction(item.action!, to: item.target, from: item, for: nil)
        XCTAssertEqual(count, 1)
        
        count = 0
        bag = nil
        UIApplication.shared.sendAction(item.action!, to: item.target, from: item, for: nil)
        XCTAssertEqual(count, 0)
    }
}

extension ClosurableTests {
    func test_UIGestureRecognizer_on() {
        let recognizer = UITapGestureRecognizer()
        
        var count: Int = 0
        recognizer.on { _ in
            count += 1
            }.released(by: bag)
        
        // TODO: Get action/target from UIGestureRecognizer
    }
}

extension ClosurableTests {
    func test_NotificationCenter_on() {
        let name = Notification.Name("com.AcaiBowl.Closurable.notification.test")
        
        var count: Int = 0
        NotificationCenter.default.on(name, object: nil) { _ in
            count += 1
            }.released(by: bag)
        
        NotificationCenter.default.post(name: name, object: nil)
        XCTAssertEqual(count, 1)
        
        count = 0
        bag = nil
        NotificationCenter.default.post(name: name, object: nil)
        XCTAssertEqual(count, 0)
    }
}
