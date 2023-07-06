//
//  BaseTabBarController.swift
//  BMS_Swift
//
//  Created by MAC on 26.6.23.
//

import UIKit

struct BaseTabBarConfig {
    var vcName: String?
    var vcClass: UIViewController?
    var title: String = ""
    var image: String = ""
    var selectImage: String = ""
}

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.delegate = self
        
        createSubControllers()
        
        themeConfig()
    }
    
    func createSubControllers() {
        let items = [
            BaseTabBarConfig(vcName: "HomeViewController", title: "首页", image: "home", selectImage: "home_s"),
            BaseTabBarConfig(vcName: "MineViewController", title: "我的", image: "mine", selectImage: "mine_s")
        ]
        
        for (_, item) in items.enumerated() {
            var navc: UINavigationController?
            if let _vc = item.vcClass {
                if _vc.isKind(of: UINavigationController.self) {
                    navc = _vc as? UINavigationController
                    navc?.viewControllers.first?.title = item.title
                }
                else {
                    _vc.title = item.title
//                    _vc.hidesBottomBarWhenPushed = true
                    navc = BaseNavigationController.init(rootViewController: _vc)
                }
            }
            else {
                let vc = ClassForString(item.vcName!).init() as! UIViewController
                vc.title = item.title
//                vc.hidesBottomBarWhenPushed = true
                navc = BaseNavigationController.init(rootViewController: vc)
            }

            navc?.tabBarItem.title = item.title
            navc?.tabBarItem.image = UIImage.init(named: item.image)?.withRenderingMode(.alwaysOriginal)
            navc?.tabBarItem.selectedImage = UIImage.init(named: item.selectImage)?.withRenderingMode(.alwaysOriginal)

            addChild(navc!)
        }
        
        tabBar.tintColor = UIColor.hexString("#6985FB")
        tabBar.unselectedItemTintColor = UIColor.hexString("#8C96AA")
    }
    
    @objc func themeConfig(_ backgroundColor: UIColor = .white) {
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            appearance.shadowColor = UIColor.hexString("#ECEFF5", alpha: 0.8)
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
            tabBar.standardAppearance = appearance
        }
        else {
            tabBar.barTintColor = backgroundColor
            tabBar.shadowImage = UIImage.image(color: UIColor.hexString("#ECEFF5", alpha: 0.8), rect: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 0.5))
            tabBar.backgroundImage = UIImage.image(color: UIColor.white)
        }
    }
}

extension BaseTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
