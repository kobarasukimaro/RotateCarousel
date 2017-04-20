//
//  ViewController.swift
//  RotateCarousel
//
//  Created by Ryosei Kawamura on 2017/04/18.
//  Copyright © 2017年 Ryosei Kawamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let carouselView1_1 = UIView()
    let carouselView1_2 = UIView()
    let carouselView1_3 = UIView()
    let carouselTable = CarouselTableView()
    let carouselScroll = CarouselScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カルーセルテスト
        carouselView1_1.translatesAutoresizingMaskIntoConstraints = false
        carouselView1_1.isHidden = false
        carouselView1_1.tag = 1000
        carouselView1_1.backgroundColor = UIColor.green
        carouselView1_1.layer.cornerRadius = 15.0
        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
        self.view.addSubview(carouselView1_1)
        carouselView1_1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        carouselView1_1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        carouselView1_1.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.2).isActive = true
        carouselView1_1.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1).isActive = true
        
        carouselView1_2.translatesAutoresizingMaskIntoConstraints = false
        carouselView1_2.isHidden = false
        carouselView1_2.tag = 1001
        carouselView1_2.backgroundColor = UIColor.brown
        carouselView1_2.layer.cornerRadius = 15.0
        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
        self.view.addSubview(carouselView1_2)
        carouselView1_2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        carouselView1_2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        carouselView1_2.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.2).isActive = true
        carouselView1_2.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1).isActive = true
        
        carouselView1_3.translatesAutoresizingMaskIntoConstraints = false
        carouselView1_3.isHidden = false
        carouselView1_3.tag = 1002
        carouselView1_3.backgroundColor = UIColor.gray
        carouselView1_3.layer.cornerRadius = 15.0
        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
        self.view.addSubview(carouselView1_3)
        carouselView1_3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        carouselView1_3.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        carouselView1_3.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.2).isActive = true
        carouselView1_3.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1).isActive = true

        carouselTable.delegate = self
        carouselTable.dataSource = self
        // carouselTable.translatesAutoresizingMaskIntoConstraints = false
        carouselTable.tag = 2001
        carouselTable.register(CarouselTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(CarouselTableViewCell.self))
        carouselTable.frame = CGRect(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2, width: self.view.frame.width * 0.1, height: self.view.frame.height * 0.3)
        // carouselTable.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI / 2.0))
        carouselTable.transform = transform
        self.view.addSubview(carouselTable)
//        carouselTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        carouselTable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        carouselTable.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.1).isActive = true
//        carouselTable.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.3).isActive = true
        
        carouselScroll.delegate = self
        // carouselTable.translatesAutoresizingMaskIntoConstraints = false
        carouselScroll.tag = 3001
        carouselScroll.frame = CGRect(x: self.view.frame.maxX / 2 - 125, y: self.view.frame.maxY / 1.5, width: 250, height: self.view.frame.height * 0.1)
        carouselScroll.backgroundColor = UIColor.black
        // carouselScroll.isPagingEnabled = true
        self.view.addSubview(carouselScroll)
        //        carouselTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //        carouselTable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //        carouselTable.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.1).isActive = true
        //        carouselTable.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.3).isActive = true
        
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 * 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // セルの上部のスペース
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20 // セルの下部のスペース
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear // 透明にすることでスペースとする
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear // 透明にすることでスペースとする
    }
    
    // セル追加
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = carouselTable.dequeueReusableCell(withIdentifier: NSStringFromClass(CarouselTableViewCell.self))!
        // let cell = CarouselTableViewCell.self(style: .subtitle, reuseIdentifier: NSStringFromClass(CarouselTableViewCell.self))
        cell.layer.cornerRadius = 15.0
        cell.backgroundColor = UIColor.gray
        cell.textLabel?.text = String(describing: indexPath.section)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 10)
        cell.tag = indexPath.section
        
        let uiview = UIView()
        uiview.isHidden = false
        uiview.tag = 1001
        uiview.backgroundColor = UIColor.brown
        uiview.layer.cornerRadius = 15.0
        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
        
        print("add cell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width * 0.1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.tag {
        case 2001:
            moveCenterOfContent(scrollView: carouselTable)
            carouselTable.transformView()
            carouselTable.layoutIfNeeded()
        case 3001:
            moveCenterOfContent2(scrollView: scrollView)
            print("scroll")
            print("content offset = " + String(describing: scrollView.contentOffset))
            for view in scrollView.subviews {
                var show = false
                var rate = 0.0
                let minX = view.frame.minX
                let maxX = view.frame.maxX
                if(scrollView.contentOffset.x < minX && minX < (scrollView.contentOffset.x + scrollView.frame.width)){
                    show = true
                }else if(scrollView.contentOffset.x < maxX && maxX < (scrollView.contentOffset.x + scrollView.frame.width)){
                    show = true
                }
                
                if(show){
                    rate = Double(view.center.x - scrollView.contentOffset.x - (scrollView.frame.width / 2)) / Double(scrollView.frame.width / 2)

                    var t: CATransform3D = CATransform3DIdentity
                    t.m34 = 1.0 / -800
                    var tilt = (rate * rate) * 90.0
                    if(rate < 0){
                        tilt = tilt * -1
                    }
                    
                    t = CATransform3DRotate(t,
                                            CGFloat(tilt * Double.pi / 180.0),
                                            0,
                                            1,
                                            0)
                    
                    let scale = (rate * rate) * 0.3
                    
                    t = CATransform3DScale(t,
                        CGFloat(1.0 - scale),
                        CGFloat(1.0 - scale),
                        CGFloat(1.0 - scale))
                    
                    view.layer.transform = t
                    print("tag " + String(view.tag) + ", x = " + String(describing: view.frame.origin.x) + ", show = " + String(show) + ", rate = " + String(rate) + ", tilt = " + String(tilt))
                }else{
                                   print("tag " + String(view.tag) + ", x = " + String(describing: view.frame.origin.x) + ", show = " + String(show) + ", rate = " + String(rate))
                }
                

            }
        default:
            break
        }

    }
    
    func moveCenterOfContent(scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x;
        let currentOffSetY = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height;
    
        if (currentOffSetY < contentHeight / 8) {
            scrollView.contentOffset = CGPoint(x: currentOffsetX, y: currentOffSetY + contentHeight/2);
        }
        if (currentOffSetY > contentHeight * 6 / 8) {
            scrollView.contentOffset = CGPoint(x: currentOffsetX, y: currentOffSetY - contentHeight/2);
        }
    }
    
    
    
    func moveCenterOfContent2(scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x;
        let contentWidth = scrollView.contentSize.width;
        
        if (currentOffsetX < 175) {
            scrollView.contentOffset = CGPoint(x: 775, y: 0)
        }
        if (currentOffsetX > 775) {
            
            scrollView.contentOffset = CGPoint(x: 175, y: 0)
        }
    }
    
    let maxMove = 200.0
    let minSize = 0.5
    
    override func viewDidLayoutSubviews() {

        
        var move = 0.0
        let tileMod = carouselTilt2.truncatingRemainder(dividingBy: 90.0)
        let moveRect = (carouselTilt2 / 90) + (tileMod > 0 ? 1 : 0)
        // 奇数の場合はmaxに向かって増える
        if(moveRect.truncatingRemainder(dividingBy: 2) >= 1){
            let tiltRatio = tileMod == 0 ? 90.0 : tileMod
            move = maxMove * (tiltRatio / 90.0)
        }else{
            let tiltRatio = tileMod == 0 ? 90.0 : tileMod
            move = maxMove - (maxMove * (tiltRatio / 90.0))
        }
        
        if(carouselTilt2 >= 180){
            move = move * -1
        }
        
        
        var size = 0.0
        let shrinkMod = carouselTilt2.truncatingRemainder(dividingBy: 180.0)
        let shrinkRect = (carouselTilt2 / 180) + (shrinkMod > 0 ? 1 : 0)
        // 奇数の場合はmaxに向かって増える
        if(shrinkRect.truncatingRemainder(dividingBy: 2) >= 1){
            let shrinkRatio = shrinkMod == 0 ? 180.0 : shrinkMod
            size = minSize * (shrinkRatio / 180.0)
        }else{
            let shrinkRatio = shrinkMod == 0 ? 180.0 : shrinkMod
            size = minSize - (minSize * (shrinkRatio / 180.0))
        }
        
        print("size = " + String(size))
        
        var transform: CATransform3D = CATransform3DMakeScale(CGFloat(Double(1.0 - size)), CGFloat(Double(1.0 - size)), CGFloat(Double(1.0 - size)))
        transform.m34 = 1.0 / -500;
        transform = CATransform3DRotate(transform, CGFloat(carouselTilt2 * Double.pi / 180.0), 0, 1, 0.0)
        carouselView1_2.layer.transform = transform
        carouselView1_2.center.x = self.view.center.x + CGFloat(move)
        
        var move3 = 0.0
        let tileMod3 = carouselTilt3.truncatingRemainder(dividingBy: 90.0)
        let moveRect3 = (carouselTilt3 / 90) + (tileMod3 > 0 ? 1 : 0)
        // 奇数の場合はmaxに向かって増える
        if(moveRect3.truncatingRemainder(dividingBy: 2) >= 1){
            let tiltRatio = tileMod3 == 0 ? 90.0 : tileMod3
            move3 = maxMove * (tiltRatio / 90.0)
        }else{
            let tiltRatio = tileMod3 == 0 ? 90.0 : tileMod3
            move3 = maxMove - (maxMove * (tiltRatio / 90.0))
        }
        
        if(carouselTilt3 >= 180){
            move3 = move3 * -1
        }
        
        var size3 = 0.0
        let shrinkMod3 = carouselTilt3.truncatingRemainder(dividingBy: 180.0)
        let shrinkRect3 = (carouselTilt3 / 180) + (shrinkMod3 > 0 ? 1 : 0)
        // 奇数の場合はmaxに向かって増える
        if(shrinkRect3.truncatingRemainder(dividingBy: 2) >= 1){
            let shrinkRatio = shrinkMod3 == 0 ? 180.0 : shrinkMod3
            size3 = minSize * (shrinkRatio / 180.0)
        }else{
            let shrinkRatio = shrinkMod3 == 0 ? 180.0 : shrinkMod3
            size3 = minSize - (minSize * (shrinkRatio / 180.0))
        }
        
        var transform3: CATransform3D = CATransform3DMakeScale(CGFloat(Double(1.0 - size3)), CGFloat(Double(1.0 - size3)), CGFloat(Double(1.0 - size3)))
        transform3.m34 = 1.0 / -500;
        transform3 = CATransform3DRotate(transform3, CGFloat(carouselTilt3 * Double.pi / 180.0), 0, 1, 0.0)
        carouselView1_3.layer.transform = transform3
        carouselView1_3.center.x = self.view.center.x + CGFloat(move3)
        
        
        carouselTable.contentOffset = carouselTable.defaultContentOffset()
        
        
        var baseTag = 5000
        for i in 0..<12 {
            baseTag = baseTag + 1
            
            let uiview = UILabel()
            // 1 = 100 - 75
            // 2 = 200 - 175
            // 3 = 300 - 275
            // 4 = 400 - 375
            // 5 = 500 - 475
            uiview.frame = CGRect(x: (i + 1) * 100 - (50 / 2), y: 0, width: 50, height: 50)
            uiview.text = String(i + 1)
            uiview.isHidden = false
            uiview.tag = baseTag
            if(i == 0 || i == 3 || i == 6 || i == 9){
                uiview.backgroundColor = UIColor.green
            }else if(i == 1 || i == 4 || i == 7 || i == 10){
                uiview.backgroundColor = UIColor.yellow
            }else{
                uiview.backgroundColor = UIColor.cyan
            }
            uiview.layer.cornerRadius = 15.0
            uiview.clipsToBounds = true
            // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
            carouselScroll.addSubview(uiview)
        }
        
//        let uiview1 = UIView()
//        uiview1.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        uiview1.isHidden = false
//        uiview1.tag = 5001
//        uiview1.backgroundColor = UIColor.green
//        uiview1.layer.cornerRadius = 15.0
//        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
//        carouselScroll.addSubview(uiview1)
//        
//        let uiview2 = UIView()
//        uiview2.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
//        uiview2.isHidden = false
//        uiview2.tag = 5002
//        uiview2.backgroundColor = UIColor.yellow
//        uiview2.layer.cornerRadius = 15.0
//        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
//        carouselScroll.addSubview(uiview2)
//        
//        let uiview3 = UIView()
//        uiview3.frame = CGRect(x: 100, y: 0, width: 50, height: 50)
//        uiview3.isHidden = false
//        uiview3.tag = 5003
//        uiview3.backgroundColor = UIColor.cyan
//        uiview3.layer.cornerRadius = 15.0
//        // carouselView1_1.layer.anchorPoint = CGPoint(x: 1.5, y: 0.5)
//        carouselScroll.addSubview(uiview3)
        
        carouselScroll.contentSize = CGSize(width: 1200, height: carouselScroll.frame.height)
        carouselScroll.contentOffset = CGPoint(x: 600 - 125, y: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var carouselTilt = 0.0
    var carouselTilt2 = 45.0
    var carouselTilt3 = 315.0
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        // sliderDetectionWorkItem?.cancel()
        
        for touch: UITouch in touches {
            let tag : Int = (touch.view?.tag)!
            switch tag {
            case 1000:
                
                // 移動した先の座標を取得
                let location = touch.location(in: self.view)
                let previousLocation = touch.previousLocation(in: self.view)
                
                if(location.x > previousLocation.x){
                    carouselTilt = carouselTilt + 6.0
                    if(carouselTilt >= 360){
                        carouselTilt = 0.0
                    }
 
                    var move = 0.0
                    let tileMod = carouselTilt.truncatingRemainder(dividingBy: 90.0)
                    let moveRect = (carouselTilt / 90) + (tileMod > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(moveRect.truncatingRemainder(dividingBy: 2) >= 1){
                        let tiltRatio = tileMod == 0 ? 90.0 : tileMod
                        move = maxMove * (tiltRatio / 90.0)
                    }else{
                        let tiltRatio = tileMod == 0 ? 90.0 : tileMod
                        move = maxMove - (maxMove * (tiltRatio / 90.0))
                    }
                    
                    if(carouselTilt >= 180){
                        move = move * -1
                    }
                    
                    var size = 0.0
                    let shrinkMod = carouselTilt.truncatingRemainder(dividingBy: 180.0)
                    let shrinkRect = (carouselTilt / 180) + (shrinkMod > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(shrinkRect.truncatingRemainder(dividingBy: 2) >= 1){
                        let shrinkRatio = shrinkMod == 0 ? 180.0 : shrinkMod
                        size = minSize * (shrinkRatio / 180.0)
                    }else{
                        let shrinkRatio = shrinkMod == 0 ? 180.0 : shrinkMod
                        size = minSize - (minSize * (shrinkRatio / 180.0))
                    }
                    
                    print("size = " + String(size))
                    
                    var transform: CATransform3D = CATransform3DMakeScale(CGFloat(Double(1.0 - size)), CGFloat(Double(1.0 - size)), CGFloat(Double(1.0 - size)))
                    transform.m34 = 1.0 / -500;
                    print("tilt = " + String(describing: CGFloat(carouselTilt * Double.pi / 180.0)))
                    transform = CATransform3DRotate(transform, CGFloat(carouselTilt * Double.pi / 180.0), 0, 1, 0.0)
                    carouselView1_1.layer.transform = transform
                    carouselView1_1.center.x = self.view.center.x + CGFloat(move)
                    
                    carouselTilt2 = carouselTilt2 + 6.0
                    if(carouselTilt2 >= 360){
                        carouselTilt2 = 0.0
                    }
                
                    var move2 = 0.0
                    let tileMod2 = carouselTilt2.truncatingRemainder(dividingBy: 90.0)
                    let moveRect2 = (carouselTilt2 / 90) + (tileMod2 > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(moveRect2.truncatingRemainder(dividingBy: 2) >= 1){
                        let tiltRatio = tileMod2 == 0 ? 90.0 : tileMod2
                        move2 = maxMove * (tiltRatio / 90.0)
                    }else{
                        let tiltRatio = tileMod2 == 0 ? 90.0 : tileMod2
                        move2 = maxMove - (maxMove * (tiltRatio / 90.0))
                    }
                    
                    if(carouselTilt2 >= 180){
                        move2 = move2 * -1
                    }
                    
                    var size2 = 0.0
                    let shrinkMod2 = carouselTilt2.truncatingRemainder(dividingBy: 180.0)
                    let shrinkRect2 = (carouselTilt2 / 180) + (shrinkMod2 > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(shrinkRect2.truncatingRemainder(dividingBy: 2) >= 1){
                        let shrinkRatio = shrinkMod2 == 0 ? 180.0 : shrinkMod2
                        size2 = minSize * (shrinkRatio / 180.0)
                    }else{
                        let shrinkRatio = shrinkMod2 == 0 ? 180.0 : shrinkMod2
                        size2 = minSize - (minSize * (shrinkRatio / 180.0))
                    }
                    
                    print("size2 = " + String(size2))
                    
                    var transform2: CATransform3D = CATransform3DMakeScale(CGFloat(Double(1.0 - size2)), CGFloat(Double(1.0 - size2)), CGFloat(Double(1.0 - size2)))
                    transform2.m34 = 1.0 / -500;
                    transform2 = CATransform3DRotate(transform2, CGFloat(carouselTilt2 * Double.pi / 180.0), 0, 1, 0.0)
                    carouselView1_2.layer.transform = transform2
                    carouselView1_2.center.x = self.view.center.x + CGFloat(move2)
                    
                    carouselTilt3 = carouselTilt3 + 6.0
                    if(carouselTilt3 >= 360){
                        carouselTilt3 = 0.0
                    }
                    
                    var move3 = 0.0
                    let tileMod3 = carouselTilt3.truncatingRemainder(dividingBy: 90.0)
                    let moveRect3 = (carouselTilt3 / 90) + (tileMod3 > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(moveRect3.truncatingRemainder(dividingBy: 2) >= 1){
                        let tiltRatio = tileMod3 == 0 ? 90.0 : tileMod3
                        move3 = maxMove * (tiltRatio / 90.0)
                    }else{
                        let tiltRatio = tileMod3 == 0 ? 90.0 : tileMod3
                        move3 = maxMove - (maxMove * (tiltRatio / 90.0))
                    }
                    
                    if(carouselTilt3 >= 180){
                        move3 = move3 * -1
                    }
                    
                    var size3 = 0.0
                    let shrinkMod3 = carouselTilt3.truncatingRemainder(dividingBy: 180.0)
                    let shrinkRect3 = (carouselTilt3 / 180) + (shrinkMod3 > 0 ? 1 : 0)
                    // 奇数の場合はmaxに向かって増える
                    if(shrinkRect3.truncatingRemainder(dividingBy: 2) >= 1){
                        let shrinkRatio = shrinkMod3 == 0 ? 180.0 : shrinkMod3
                        size3 = minSize * (shrinkRatio / 180.0)
                    }else{
                        let shrinkRatio = shrinkMod3 == 0 ? 180.0 : shrinkMod3
                        size3 = minSize - (minSize * (shrinkRatio / 180.0))
                    }
                    
                    print("size3 = " + String(size3))
                    
                    var transform3: CATransform3D = CATransform3DMakeScale(CGFloat(Double(1.0 - size3)), CGFloat(Double(1.0 - size3)), CGFloat(Double(1.0 - size3)))
                    transform3.m34 = 1.0 / -500;
                    transform3 = CATransform3DRotate(transform3, CGFloat(carouselTilt3 * Double.pi / 180.0), 0, 1, 0.0)
                    carouselView1_3.layer.transform = transform3
                    carouselView1_3.center.x = self.view.center.x + CGFloat(move3)
                }

                
            default:
                break
            }
        }
    }
}

