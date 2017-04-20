//
//  CarouselScrollView.swift
//  RotateCarousel
//
//  Created by 川村亮清 on 2017/04/20.
//  Copyright © 2017年 Ryosei Kawamura. All rights reserved.
//

import Foundation
import UIKit

class CarouselScrollView: UIScrollView {
    
    var startPoint: CGPoint!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Initialize(){
        self.delegate = self;
        self.showsVerticalScrollIndicator = false;
    }
}

extension CarouselScrollView : UIScrollViewDelegate{
    
    // ドラッグ開始時のスクロール位置記憶
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.startPoint = scrollView.contentOffset;
    }
    
    // ドラッグ(スクロール)しても y 座標は開始時から動かないようにする(固定)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = self.startPoint.y;
    }
}
