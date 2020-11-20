//
//  main.swift
//  josn
//
//  Created by Apple27 on 2020/9/21.
//  Copyright © 2020 JASON. All rights reserved.
//
import Foundation
var nestFlag = "No-Nest"//有无嵌套
var classNum = 1//嵌套的结构体
let path0 = "/Users/Apple27/Desktop/josn/Log.json"
let path1 = "/Users/Apple27/Desktop/josn/MyLog.swift"//文件读写路径
let jsonData = try!Data(contentsOf: URL(fileURLWithPath: path0))
var text = ""//输出的结果字符串
func transform(type:String,key:String) -> String{
    if(type=="__NSArrayM") {
        classNum+=1
        nestFlag = key
        return "[Class\(classNum)]"
    }
    if(type=="__NSCFNumber"){
        return "Int"
    }
    return "String"
}//解码函数
do{
    let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! NSDictionary//转化为字典 用key来递归
    text.append("struct Log {\n")
    for str in jsonObj.allKeys{
        let str1 = "\(type(of: jsonObj[str]!))"//
        let str2 = "\(transform(type:str1,key: "\(str)"))"//获取类型  int，string……
        text.append("\tvar \(str): \(str2)\n")
    }
    text.append("}\n")
    while(nestFlag != "No-Nest"){
        let data = jsonObj[nestFlag] as! [[String:Any]]
        nestFlag = "No-Nest"
        text.append("struct Class\(classNum){\n")
        for str in data[0].keys{
            let str1 = "\(type(of:data[0][str]!))"
            let str2 = "\(transform(type:str1,key: "\(str)"))"//获取类型 int，string……
            text.append("\tvar \(str): \(str2)\n")
        }
        text.append("}\n")//结束
        //print(text)//命令行输出文本
    }//对嵌套结构体递归解码
    try text.write(toFile: path1, atomically: true, encoding: .utf8)
} catch{
    print("fail to decoder")//解码失败捕获异常
}
