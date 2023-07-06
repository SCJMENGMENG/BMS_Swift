//
//  UIImage+Extention.swift
//  BMS_Swift
//
//  Created by MAC on 26.6.23.
//

import UIKit

extension UIImage {
    
    /// Create UIImage from color and size.
    ///
    /// - Parameters:
    ///   - color: image fill color.
    ///   - size: image size.
    convenience init(color: UIColor, size: CGSize) {
       UIGraphicsBeginImageContextWithOptions(size, false, 1)
       
       defer {
           UIGraphicsEndImageContext()
       }
       
       color.setFill()
       UIRectFill(CGRect(origin: .zero, size: size))
       
       guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
           self.init()
           return
       }
       
       self.init(cgImage: aCgImage)
   }
    
    //根据颜色生成图片
    static func image(color: UIColor, rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
