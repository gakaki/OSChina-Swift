//
//  MainTabBarController.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/5.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import UIKit
import DynamicBlurView
class MainTabBarController: UITabBarController,UITabBarControllerDelegate {
    var centerButton:UIButton?
    var buttonArr:[UIButton]?
    var blurView:DynamicBlurView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: SetterUI
    func setUI() {
        var viewControllers = [UIViewController]()
        buttonArr = [UIButton]()
        //1
        var multi = MultipleViewController()
        multi.title = "综合"
        var nav1 = UINavigationController(rootViewController: multi)
        nav1.tabBarItem.image = UIImage(named:"tabbar-news")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav1.tabBarItem.selectedImage = UIImage(named:"tabbar-news-selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav1.navigationBar.translucent = false;
        viewControllers.append(nav1)
        //2
        var tweet = TweetsViewController()
        tweet.title = "动弹"
        var nav2 = UINavigationController(rootViewController: tweet)
        nav2.tabBarItem.image = UIImage(named: "tabbar-tweet")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav2.tabBarItem.selectedImage = UIImage(named:"tabbar-tweet-selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav2.navigationBar.translucent = false;
        viewControllers.append(nav2)
        //3
        var moreVc = UIViewController.new()
        viewControllers.append(moreVc)
        self.addCenterButton(imageName:"tabbar-more")
        //4
        var explore = ExploreViewController()
        var nav3 = UINavigationController(rootViewController: explore)
        explore.title = "发现"
        nav3.navigationBar.translucent = false;
        nav3.tabBarItem.image = UIImage(named: "tabbar-discover")
        nav3.tabBarItem.selectedImage = UIImage(named:"tabbar-discover" + "-selected")
        viewControllers.append(nav3)
        
        //5
        var me = UserViewController()
        var nav4 = UINavigationController(rootViewController: me)
        me.title = "我的"
        nav4.navigationBar.translucent = false
        nav4.tabBarItem.image = UIImage(named:"tabbar-me")
        nav4.tabBarItem.selectedImage = UIImage(named: "tabbar-me-selected")
        viewControllers.append(nav4)
        self.viewControllers = viewControllers;
        self.tabBar.tintColor = UIColor.selectTitleColor()
        self.tabBar.translucent = false
        self.delegate = self
        
        //滤镜
        blurView = DynamicBlurView(frame: CGRectMake(0, kScreenHeight, kScreenWidth, 270))
        self.view.addSubview(blurView!)
        blurView?.blurRadius = 10
        blurView?.userInteractionEnabled = true
        var tap = UITapGestureRecognizer(target: self, action:"blurViewClick")
        blurView?.addGestureRecognizer(tap)
        blurView?.blendColor = UIColor(white: 0.85, alpha: 1)
        
        //下方6个button
        var titles:[String] = ["文字","相册","拍照","语音","扫一扫","找人"]
        var imageNames:[String] = ["tweetEditing", "picture", "shooting", "sound", "scan", "search"]
        var verSpace = 20
        var shortHorSpace = 35
        var longHorSpace = 45
        var btnWidth = (Int(kScreenWidth) - (shortHorSpace + longHorSpace)*2)/3
        for(var i = 0; i<3; i++){
            for (var j = 0; j < 2; j++){
                var index = 2 * j + i
                var x:Int = shortHorSpace + (btnWidth + longHorSpace) * i
                var y:Int = verSpace + (btnWidth + 40)*j
                var btn = MenuButton(frame:CGRectMake(CGFloat(x),kScreenHeight, CGFloat(btnWidth), CGFloat(btnWidth)))
                btn.fromFrame = CGRectMake(CGFloat(x),kScreenHeight, CGFloat(btnWidth), CGFloat(btnWidth))
                btn.setImage(UIImage(named: imageNames[index]), forState: UIControlState.Normal)
                btn.addTarget(self, action: "menuBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
                var label = UILabel(frame: CGRectMake(0,btn.height()+10, btn.width(),20))
                label.backgroundColor = UIColor.clearColor()
                label.text = titles[index]
                label.textColor = UIColor.whiteColor()
                label.font = UIFont.systemFontOfSize(15)
                label.textAlignment = NSTextAlignment.Center
                btn.addSubview(label)
                blurView?.addSubview(btn)
                btn.toFrame = CGRectMake(CGFloat(x),CGFloat(y), CGFloat(btnWidth), CGFloat(btnWidth))
                buttonArr?.append(btn)
                }
            }
    }
    
    
    func addCenterButton(#imageName:String) {
        centerButton = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        //var orign = self.view.convertPoint(self.tabBar.center, toView: self.tabBar)
        var orign = self.tabBar.center
        var buttonSize = CGSizeMake(self.tabBar.frame.size.height-4, self.tabBar.frame.size.height-4)
        centerButton?.frame = CGRectMake(orign.x - buttonSize.width/2, orign.y - buttonSize.height/2, buttonSize.width, buttonSize.height)
        centerButton?.addTarget(self, action:"centerButtonClick" ,forControlEvents: UIControlEvents.TouchUpInside)
        centerButton?.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        centerButton?.backgroundColor = UIColor.selectTitleColor()
        centerButton?.setCorner(cornerRadius: buttonSize.height/2)
        self.view.addSubview(centerButton!)
        self.view.bringSubviewToFront(centerButton!)
    }
    
    func centerButtonClick() {
        UIView.animateWithDuration(1, delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: .AllowUserInteraction,
            animations: {
               self.blurView?.frame = CGRectMake(0, kScreenHeight-270, kScreenWidth, 350)
            }, completion: nil)
        for item in self.buttonArr!{
            var btn:MenuButton = item as! MenuButton
            UIView.animateKeyframesWithDuration(0.2, delay:0, options: .AllowUserInteraction, animations: { () -> Void in
                btn.frame = btn.toFrame!
                }, completion:nil)
        }
    }
    

    //MARK:菜单按钮点击事件
    func menuBtnClick(btn:UIButton) {
       self.disappearButtn()
    }
    
    //MARK:SystemDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        println("tabbar被点击")
    }
  
    func blurViewClick() {
        self.disappearButtn()
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       self.disappearButtn()
    }
    
    func disappearButtn() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            blurView?.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 270)
        })
        for item in self.buttonArr!{
            var btn:MenuButton = item as! MenuButton
            UIView .animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .AllowUserInteraction, animations: {
                btn.frame = btn.fromFrame!
                }, completion:nil)
        }
    }
}
