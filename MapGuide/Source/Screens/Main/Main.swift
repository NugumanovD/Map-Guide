//
//  Main.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class Main: UIViewController, UITabBarControllerDelegate {
    
     // MARK: Class variables/constants
    
    let tabBarCnt = UITabBarController()
    
    
    //MARK: UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
        
    }
    
    //MARK: Configurations
    
    func createTabBarController() {
        
        let mapItem = createNavController(Controller.init(storyboard: "Map", identifier: "MapViewController", image: "map", selectedImage: "map", title: "Map"))
        
        let settingsItem = createNavController(Controller.init(storyboard: "Settings", identifier: "Settings", image: "settings", selectedImage: "settings", title: "Settings"))
        
        let controllerArray = [mapItem, settingsItem]
		self.tabBarCnt.viewControllers =
            controllerArray.map{ UINavigationController.init(rootViewController: $0)}
			
        self.view.addSubview(tabBarCnt.view)
    }
    
    func createNavController(_ controller:Controller) -> UIViewController {
        
        var viewController = UIViewController()
        
        let storyboard = UIStoryboard(name: controller.storyboard, bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: controller.identifier)
        viewController.tabBarItem.image = UIImage(named: controller.image)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: controller.selectedImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        viewController.title = controller.title
        return viewController
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Hello")
    }
    
    
}
