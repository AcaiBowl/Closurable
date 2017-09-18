//
//  ViewModel.swift
//  Demo
//
//  Created by Toru Asai on 2017/09/18.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

final class ViewModel: NSObject {
    
    @objc dynamic private(set) var barButtonItemCount: Int = 0
    @objc dynamic private(set) var buttonCount: Int = 0
    @objc dynamic private(set) var sliderValue: Float = 0.0
    @objc dynamic private(set) var textFieldText: String = ""
    @objc dynamic private(set) var tappableViewCount: Int = 0
    @objc dynamic private(set) var notificationButtonCount: Int = 0
    
    func updateBarButtonItemCount() {
        barButtonItemCount += 1
    }
    
    func updateButtonCount() {
        buttonCount += 1
    }
    
    func updateSliderValue(_ value: Float) {
        sliderValue = value
    }
    
    func updateTextFieldText(_ text: String?) {
        textFieldText = text ?? ""
    }
    
    func updateTappableViewCount() {
        tappableViewCount += 1
    }
    
    func updateNotificationButtonCount() {
        notificationButtonCount += 1
    }
}
