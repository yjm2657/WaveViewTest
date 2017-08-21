//
//  ViewController.swift
//  WaveViewTest
//
//  Created by 杨洁茂 on 2017/8/21.
//  Copyright © 2017年 杨洁茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var waveView : WaveView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.waveView = WaveView(frame: self.view.bounds)
        self.waveView?.color_w = UIColor(colorLiteralRed: 0.8, green:0.69, blue: 0.86, alpha: 0.5)
//        waveView.destroyView()
        self.view.addSubview(self.waveView!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.waveView?.destroyView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

