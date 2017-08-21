//
//  WaveView.swift
//  WaveViewTest
//
//  Created by 杨洁茂 on 2017/8/21.
//  Copyright © 2017年 杨洁茂. All rights reserved.
//

import UIKit

class WaveView: UIView {

    lazy private var shapeLayer_0 = CAShapeLayer()
    lazy private var shapeLayer_1 = CAShapeLayer()
    lazy private var waveDisplayLink = CADisplayLink()
    
    //速度
    var speed_w : CGFloat = 0
    //振幅
    var amplitude_w : CGFloat = 0
    //高度
    var height_w : CGFloat = 0
    //颜色
    var color_w : UIColor?{
        didSet {
            shapeLayer_0.fillColor = color_w?.cgColor
            shapeLayer_1.fillColor = color_w?.cgColor
        }
    }
    
    private var width_w : CGFloat = 0
    private var offset_x : CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        self.speed_w = 0.1
        self.amplitude_w = 8
        self.width_w = 2.5 * CGFloat.pi / self.bounds.size.width
        self.height_w = self.frame.size.height / 2.0
        
        shapeLayer_0.fillColor = UIColor.init(colorLiteralRed: 50 / 255.0, green: 60 / 255.0, blue: 255 / 255.0, alpha: 0.5).cgColor
        shapeLayer_1.fillColor = UIColor.init(colorLiteralRed: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.5).cgColor
        layer.addSublayer(shapeLayer_0)
        layer.addSublayer(shapeLayer_1)
        
        waveDisplayLink = CADisplayLink(target: self, selector: #selector(getWave))
        waveDisplayLink.add(to: RunLoop.current, forMode: .commonModes)
    }
    
    @objc private func getWave(){
        offset_x += speed_w
        
        let firstPath = CGMutablePath()
        var firstY = bounds.size.width / 2.0
        firstPath.move(to: CGPoint(x: 0, y: firstY))
        for i in 0...Int(bounds.size.width) {
            firstY = amplitude_w * sin(width_w * CGFloat(i) + offset_x) + height_w
            firstPath.addLine(to: CGPoint(x: CGFloat(i), y: firstY))
        }
        
        firstPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        firstPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        firstPath.closeSubpath()
        shapeLayer_0.path = firstPath
        
        let secondPath = CGMutablePath()
        var secondY = bounds.size.width / 2.0
        secondPath.move(to: CGPoint(x: 0, y: secondY))
        
        for i in 0...Int(bounds.size.width) {
            secondY = amplitude_w * sin(width_w * CGFloat(i) + offset_x - bounds.size.width / 2.0) + height_w
            secondPath.addLine(to: CGPoint(x: CGFloat(i), y: secondY))
        }
        secondPath.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
        secondPath.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        secondPath.closeSubpath()
        shapeLayer_1.path = secondPath
    }
    
    public func destroyView(){
        waveDisplayLink.invalidate()
    }
    deinit {
        print("SXMWaterWaveView_deinit")
    }
    
    
    
    

}
