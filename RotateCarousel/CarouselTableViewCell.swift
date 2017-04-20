//
//  CarouselTableViewCell.swift
//  RotateCarousel
//
//  Created by Ryosei Kawamura on 2017/04/19.
//  Copyright © 2017年 Ryosei Kawamura. All rights reserved.
//

import Foundation
import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    var distance: CGFloat = 0.0
    
    func rateOfDistance() -> Float {
        return (Float)(self.distance * 2.0 / self.frame.size.width);
    }
    
//    func compare:(CFCoverFlowCell *)cell {
//        if (fabs(self.distance) > fabs(cell.distance)) {
//            return NSOrderedAscending;
//        } else if (fabs(self.distance) < fabs(cell.distance)) {
//            return NSOrderedDescending;
//        } else {
//            return NSOrderedSame;
//        }
//    }
    
    func transformCell() {
        let zDistance: CGFloat = 800.0;
    
        self.layer.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2);
        
        let rate = self.rateOfDistance()
    
        var t: CATransform3D = CATransform3DIdentity;
    //視点の距離
    t.m34 = 1.0 / -zDistance;
    //右に90度回転
    t = CATransform3DRotate(t,
                            CGFloat(Double.pi / 2.0),
                            0.0,
                            0.0,
                            1.0)
    //角度
    t = CATransform3DRotate(t,
                            CGFloat(10 * rate),
                            0.0,
                            1.0,
                            0.0)
    //スケール
    t = CATransform3DScale(t,
    0.8,
    0.8,
    0.8)

        self.layer.transform = t
    }
}
