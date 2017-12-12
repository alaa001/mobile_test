//
//  CatalogAssembly.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class CatalogAssembly: Assembly{
    
    func assemble(container: Container)
    {
        
        //MARK:- ViewModel
        
        
        container.register(StoreDetailsViewModel.self) { r  in
            return StoreDetailsViewModel(service: r.resolve(CatalogService.self)!)
        }
        
        container.register(StoreListViewModel.self) { r  in
            return StoreListViewModel(service: r.resolve(CatalogService.self)!)
        }
        
        
        // MARK: - Service
        container.register(CatalogService.self) { r  in
            return CatalogService(apiService:r.resolve(CatalogRestApi.self)!,databaseService:r.resolve(CatalogRealmService.self)!)
        }
        
        //MARK : - API
        container.register(CatalogRestApi.self) { r  in
            return CatalogRestApi(network: r.resolve(Networking.self)!,
                               apiConfiguration: r.resolve(ApiConfiguration.self)!)
        }
        
        //MARK : - DB
        container.register(CatalogRealmService.self) { r  in
            return CatalogRealmService()
        }
        
        
        
        
        
        // MARK - Naviagtor
        container.register(CatalogNavigator.self) { r  in
            
            return   CatalogNavigator()
            
        }
        
        //MARK - Controllers
        container.storyboardInitCompleted(StoreListViewController.self) {r, c in
            c.viewModel = r.resolve(StoreListViewModel.self)
            c.navigator = r.resolve(CatalogNavigator.self)
            
            c.navigator?.controller = c
            c.viewModel?.navigator = c.navigator
        
            
        }
        
        
        container.storyboardInitCompleted(StoreDetailViewController.self) {r, c in
            c.viewModel = r.resolve(StoreDetailsViewModel.self)
            c.navigator = r.resolve(CatalogNavigator.self)
            
            c.navigator?.controller = c
            c.viewModel?.navigator = c.navigator
            
            
        }
        
        
        container.storyboardInitCompleted(UINavigationController.self) {r, c in
            
            
        }
        
        
        
        
    }
    
    
    
}
