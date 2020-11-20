//
//  DrawView.swift
//  Draw
//
//  Created by ykq on 2020/11/15.
//  Copyright © 2020 ykq. All rights reserved.
//
import UIKit

class DrawView: UIView {
    @IBOutlet weak var ss: UIStepper!
  


    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        for line in manager.lines {
            line.color.setStroke()
            line.path.lineWidth = 2
            line.path.lineCapStyle = .round
            line.path.lineJoinStyle = .round
            line.path.stroke()
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self){
            manager.addLine()
            manager.current.path?.move(to: location)
        }
    }
    
    private func update(for touches: Set<UITouch>){
        if let location = touches.first?.location(in: self){
            manager.current.path?.addLine(to: location)
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        update(for: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        update(for: touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        update(for: touches)
    }
    
}
