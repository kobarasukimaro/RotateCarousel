//
//  CarouselTableView.swift
//  RotateCarousel
//
//  Created by Ryosei Kawamura on 2017/04/19.
//  Copyright © 2017年 Ryosei Kawamura. All rights reserved.
//

import Foundation
import UIKit

class CarouselTableView: UITableView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.transformView()
    }
    
    func defaultContentOffset() -> CGPoint {
        return CGPoint(x: self.contentOffset.x, y: (self.contentSize.height - self.superview!.frame.size.width + self.rowHeight + self.sectionFooterHeight + self.sectionHeaderHeight) / 2);
    }
    
    func transformView() {
        let sortedCells = sortedVisibleCellsByDistance()
    
        for cell in sortedCells {
            //順番に背面から最前面に配置
            // self.bringSubview(toFront: cell as! CarouselTableViewCell)
            //Cellの変形処理
            (cell as! CarouselTableViewCell).transformCell()
        }
    }
    
    func sortedVisibleCellsByDistance() -> NSArray {
        let sortedCells = NSMutableArray();
    
        let indexPaths = self.indexPathsForVisibleRows;
        for indexPath in indexPaths! {
            // let cell: CarouselTableViewCell = self.cellForRow(at: indexPath) as! CarouselTableViewCell
            let cell = self.dequeueReusableCell(withIdentifier: NSStringFromClass(CarouselTableViewCell.self), for: indexPath) as! CarouselTableViewCell
            cell.distance = self.distanceFromCenter(indexPath: indexPath)
            cell.indexPaht = indexPath.section
            print("indexPath = " + String(describing: indexPath) + ", distance = " + String(describing: cell.distance) + ", distanceRate = " + String(describing: cell.rateOfDistance()))
            sortedCells.add(cell)
        }
        return sortedCells
    }
    
    func distanceFromCenter(indexPath: IndexPath) -> CGFloat {
        let rect = self.rectForRow(at: indexPath)
        let centerCellOffset = rect.origin.y + rect.size.height / 2;
        let offset = self.contentOffset.y;
        let centerOffset = (self.bounds.size.height / 2) + offset - (self.sectionFooterHeight + self.sectionHeaderHeight);
        return (centerCellOffset - centerOffset)
    }
}
