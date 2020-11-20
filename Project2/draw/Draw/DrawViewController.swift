//
//  DrawViewController.swift
//  Draw
//
//  Created by ykq on 2020/11/15.
//  Copyright © 2020 ykq. All rights reserved.
//
import UIKit

class DrawViewController: UIViewController {

    @IBOutlet var drawView: DrawView!
  
   
    @IBOutlet weak var preview: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      // preview.backgroundColor  = manager.lineColor
        preview.setTitleColor( manager.lineColor, for: .normal)
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.clear()
        case 1:
            manager.undo()
        case 2:
            manager.redo()
        default:
            break
        }
        drawView.setNeedsDisplay()
    }
    
    
    
}


