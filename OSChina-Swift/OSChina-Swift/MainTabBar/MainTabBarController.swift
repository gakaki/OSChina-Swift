//
//  MainTabBarController.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/5.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController,UITabBarControllerDelegate {
    var centerButton:UIButton?
    var _viewControllers:[UIViewController]?
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
        println("123123")
    }

    
    
    //MARK:SystemDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        println("tabbar被点击")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
