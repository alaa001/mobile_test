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
    
    
    func showStoreDetails (storeId:Int)  {
        
        let destinationController = SwinjectStoryboard.create(name: "Catalog", bundle: nil).instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController

        destinationController.viewModel?.setFilter(filter: StoreDetailsViewModel.InputParams(storeId:storeId))
        

        controller?.navigationController?.pushViewController(destinationController, animated: true)

        
    }

    
    func popToStoreList(){
        controller?.navigationController?.popViewController(animated: true)
    }
}
