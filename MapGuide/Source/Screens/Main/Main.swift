//
//  Main.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
     // MARK: Class variables/constants
    
    let tabBarCnt = UITabBarController()
    
    
    //MARK: UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
        
    }
    
    //MARK: Configurations
    
    func createTabBarController() {
        
        let product = createNavController(controller: Controller.init(storyboard: "Map", identifier: "MapViewController", image: "map", selectedImage: "map"))
        
        let manager = createNavController(controller: Controller.init(storyboard: "Settings", identifier: "Settings", image: "Map", selectedImage: "Map"))
        

			
			
					let controllerArray = [product, manager]
					self.tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
			
        
        self.view.addSubview(tabBarCnt.view)
    }
    
    func createNavController(controller:Controller) -> UIViewController {
        
        var viewController = UIViewController()
        let storyboard = UIStoryboard(name: controller.storyboard, bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: controller.identifier)
        viewController.tabBarItem.image = UIImage(named: controller.image)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: controller.selectedImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        return viewController
    }
    
}
