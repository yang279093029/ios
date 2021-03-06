//
//  PathManager.swift
//  Draw
//
//  Created by ykq on 2020/11/15.
//  Copyright © 2020 ykq. All rights reserved.
//

import UIKit

typealias Line = (path: UIBezierPath, color: UIColor)
let manager = PathManager.shared

class PathManager{
    static let shared = PathManager()
    private init(){}
  //  var wide = [Int]()
    var lines = [Line]()
    var trash = [Line]()
    var lineColor = UIColor.black
    
    func addLine(){
        manager.lines.append((UIBezierPath(), lineColor))
    }
    
    var current : (line: Line?, path: UIBezierPath?, pathColor: UIColor?){
        get{
            return (lines.last, lines.last?.path, lines.last?.color)
        }
    }
    
    func clear(){
        lines.removeAll()
        trash.removeAll()
        //wide.removeAll()
    }
    
    func undo(){
        if !lines.isEmpty{
            trash.append(lines.removeLast())
        }
    }
    
    func redo(){
        if !trash.isEmpty{
            lines.append(trash.removeLast())
        }
    }
}
