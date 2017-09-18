//
//  ViewModel.swift
//  Demo
//
//  Created by Toru Asai on 2017/09/18.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import Foundation

final class ViewModel: NSObject {
    
    @objc dynamic private(set) var barButtonItemTapCount: Int = 0
    @objc dynamic private(set) var buttonTapCount: Int = 0
    @objc dynamic private(set) var sliderValue: Float = 0.0
    @objc dynamic private(set) var textFieldText: String = ""
    @objc dynamic private(set) var tappableViewTapCount: Int = 0
    @objc dynamic private(set) var notificationButtonTapCount: Int = 0
    
    func updateBarButtonItemTapCount() {
        barButtonItemTapCount += 1
    }
    
    func updateButtonTapCount() {
        buttonTapCount += 1
    }
    
    func updateSliderValue(_ value: Float) {
        sliderValue = value
    }
    
    func updateTextFieldText(_ text: String?) {
        textFieldText = text ?? ""
    }
    
    func updateTappableViewTapCount() {
        tappableViewTapCount += 1
    }
    
    func updateNotificationButtonTapCount() {
        notificationButtonTapCount += 1
    }
}
