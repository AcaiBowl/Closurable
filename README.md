# Closurable
Simple, easy and lightweight library for MVVM.

[![release](https://img.shields.io/github/release/AcaiBowl/Closurable/all.svg)](https://github.com/AcaiBowl/Closurable/releases)
[![Language](http://img.shields.io/badge/language-swift4-orange.svg?style=flat
)](https://developer.apple.com/swift)
[![carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Usage
<img src="https://raw.githubusercontent.com/AcaiBowl/Closurable/master/usage.gif" width="200">

```swift
import Closurable

final class ViewController: UIViewController {
    @IBOutlet fileprivate weak var button: UIButton!
    @IBOutlet fileprivate weak var buttonLabel: UILabel!
    
    fileprivate let bag = ReleaseBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // linking
        button.onTap { [unowned self] _ in
            self.viewModel.updateButtonCount()
        }.released(by: bag)
        
        // binding
        viewModel.subscribe(\.buttonCount) { [unowned self (viewModel, _) in
            self.buttonLabel.text = "\(viewModel.buttonCount)"
        }.released(by: bag)
    }
}

final class ViewModel: NSObject {
    @objc dynamic private(set) var buttonCount: Int = 0
    
    func updateButtonCount() {
        buttonCount += 1
    }
}
```
and more...

## Requirements
* Xcode9.0+
* Swift4+

## Installation
### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```ruby
github "AcaiBowl/Closurable"
```

```bash
$ carthage update
```

## References
[ReactiveX/RxSwift](https://github.com/ReactiveX/RxSwift) [[Lisense](https://github.com/ReactiveX/RxSwift/blob/master/LICENSE.md)] <br>
[ReactiveKit/ReactiveKit](https://github.com/ReactiveKit/ReactiveKit) [[License](https://github.com/ReactiveKit/ReactiveKit/blob/master/LICENSE)]

**Thank you.**

## License
Closurable is available under the MIT license. See the LICENSE file for more info.
