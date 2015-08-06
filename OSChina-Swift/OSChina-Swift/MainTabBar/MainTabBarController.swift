//
//  MainTabBarController.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/5.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

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

        var multi = MultipleViewController()
        multi.title = "综合"
        var nav1 = UINavigationController(rootViewController: multi)
        nav1.tabBarItem.image = UIImage(named:"tabbar-news")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav1.tabBarItem.selectedImage = UIImage(named:"tabbar-news-selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        var viewControllers = Array(arrayLiteral: nav1)
        
        
        var tweet = TweetsViewController()
        tweet.title = "动弹"
        var nav2 = UINavigationController(rootViewController: tweet)
        nav2.tabBarItem.image = UIImage(named: "tabbar-tweet")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav2.tabBarItem.selectedImage = UIImage(named:"tabbar-tweet-selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        viewControllers.append(nav2)
        
        var explor = ExploreViewController()
        explor.title = "发现"
    
        var view = UIView(frame: CGRectMake(0, 0, 50, 50))
        view.backgroundColor = UIColor.greenColor()
        var bar = UITabBarItem()
        Tools.setCorner(view)
        viewControllers.append(view)
        self.viewControllers = viewControllers;
        
        
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
