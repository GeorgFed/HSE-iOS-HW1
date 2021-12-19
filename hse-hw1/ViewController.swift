//
//  ViewController.swift
//  hse-hw1
//
//  Created by Egor Fedyaev on 18.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onChangeColorTap(_ sender: Any) {
        var colors = Set<UIColor>()
        while (colors.count < views.count) {
            colors.insert(UIColor(red: .random(in: 0...1),
                                  green: .random(in: 0...1),
                                  blue: .random(in: 0...1),
                                  alpha: 1))
        }
        
        self.button.isEnabled = false
        UIView.animate(withDuration: 1, animations: {
            self.views.forEach { view in
                view.layer.cornerRadius = .random(in: 0...(view.bounds.height / 2))
                view.backgroundColor = colors.popFirst()
                
            }
        }) { _ in
            self.button.isEnabled = true
        }
    }
    
}

