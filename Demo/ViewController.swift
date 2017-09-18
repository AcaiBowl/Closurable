//
//  ViewController.swift
//  Demo
//
//  Created by Toru Asai on 2017/09/18.
//  Copyright © 2017年 AcaiBowl. All rights reserved.
//

import UIKit
import Closurable

final class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet fileprivate weak var rightBarButtonItemLabel: UILabel!
    
    @IBOutlet fileprivate weak var button: UIButton!
    @IBOutlet fileprivate weak var buttonLabel: UILabel!
    
    @IBOutlet fileprivate weak var slider: UISlider!
    @IBOutlet fileprivate weak var sliderLabel: UILabel!
    
    @IBOutlet fileprivate weak var textField: UITextField!
    @IBOutlet fileprivate weak var textFieldLabel: UILabel!
    
    @IBOutlet fileprivate weak var tappableView: UIView!
    @IBOutlet fileprivate weak var tappableViewLabel: UILabel!
    
    @IBOutlet fileprivate weak var notificationButton: UIButton!
    @IBOutlet fileprivate weak var notificationButtonLabel: UILabel!
    
    @IBOutlet fileprivate weak var releaseButton: UIButton!
    
    fileprivate let viewModel = ViewModel()
    fileprivate let bag = ReleaseBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        linking()
        binding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

fileprivate extension ViewController {
    func linking() {
        rightBarButtonItem.onTap { [unowned self] _ in
            self.viewModel.updateBarButtonItemCount()
        }.released(by: bag)
        
        button.onTap { [unowned self] _ in
            self.viewModel.updateButtonCount()
        }.released(by: bag)
        
        slider.on(.valueChanged) { [unowned self] _ in
            self.viewModel.updateSliderValue(self.slider.value)
        }.released(by: bag)
        
        textField.on(.editingChanged) { [unowned self] _ in
            self.viewModel.updateTextFieldText(self.textField.text)
        }.released(by: bag)
        
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.on { [unowned self] _ in
            self.viewModel.updateTappableViewCount()
        }.released(by: bag)
        tappableView.addGestureRecognizer(tapGestureRecognizer)
        
        notificationButton.onTap { [unowned self] _ in
            self.viewModel.updateNotificationButtonCount()
            NotificationCenter.default.post(name: .demo, object: nil)
        }.released(by: bag)
        
        releaseButton.onTap { [unowned self] _ in
            self.bag.release()
        }.released(by: bag)
    }
    
    func binding() {
        viewModel.subscribe(\.barButtonItemCount) { [unowned self] (viewModel, _) in
            self.rightBarButtonItemLabel.text = "\(viewModel.barButtonItemCount)"
        }.released(by: bag)
        
        viewModel.subscribe(\.buttonCount) { [unowned self] (viewModel, _) in
            self.buttonLabel.text = "\(viewModel.buttonCount)"
        }.released(by: bag)
        
        viewModel.subscribe(\.sliderValue) { [unowned self] (viewModel, _) in
            self.sliderLabel.text = "\(viewModel.sliderValue)"
        }.released(by: bag)
        
        viewModel.subscribe(\.textFieldText) { [unowned self] (viewModel, _) in
            self.textFieldLabel.text = viewModel.textFieldText
        }.released(by: bag)
        
        viewModel.subscribe(\.tappableViewCount) { [unowned self] (viewModel, _) in
            self.tappableViewLabel.text = "\(viewModel.tappableViewCount)"
        }.released(by: bag)
        
        NotificationCenter.default.on(.demo) { [unowned self] _ in
            self.notificationButtonLabel.text = "\(self.viewModel.notificationButtonCount)"
        }.released(by: bag)
    }
}

extension Notification.Name {
    static let demo = Notification.Name("Demo")
}
