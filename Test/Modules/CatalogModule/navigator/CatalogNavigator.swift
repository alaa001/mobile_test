//
//  CatalogNavigator.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard


class CatalogNavigator {
    weak var controller:UIViewController?
    
    
    func showStoreDetails (storeId:Int) -> UIViewController  {
        
//        let destinationController = SwinjectStoryboard.create(name: "Catalog", bundle: nil).instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
//
//        destinationController.viewModel = viewModel
//        destinationController.viewModel?.navigator = self
//
//        destinationController.viewModel?.setFilter(filter: ProductListViewModel.InputParams(branchId: branchId, typeId: typeId))
//
//
        //return destinationController
        
        return UIViewController()
        
    }

}
