//
//  SwinjectAssembler.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard


class SwinjectAssembler{
    
    
    
    static let sharedInstance = SwinjectAssembler()
    
    
    // Can't init is singleton
    private init() { }
    
    fileprivate let assembler = Assembler([
//        AppAssembly(),
        NetworkAssembly(),
//        MainServiceAssembly(),
//        LanguageAssembly(),
//        IntroAssembly(),
//        LocationAssembly(),
//        GoogleAssembly(),
//        UserAssembly(),
//        AreaAssembly(),
//        CuisinesAssembly(),
//        RestaurantAssembly(),
//        ProductAssembly(),
//        CartAssembly(),
//        AddressAssembly(),
//        FormAssembly(),
//        CheckoutAssembly(),
//        OrderAssembly(),
//        StaticPageAssembly(),
//        SettingsAssembly(),
//        OfferAssembly(),
//        ZitaatRewardsAssembly(),
//        TrackingAssembly(),
//        PromotionAssembly()
        ], container: SwinjectStoryboard.defaultContainer)
    
    
}

extension SwinjectAssembler {
    
//    func appDelegateNavigator()->AppDelegateNavigator?{ // singletone
//        SwinjectStoryboard.defaultContainer.register(AppDelegateNavigator.self) { r in
//            let appnavigation = AppDelegateNavigator()
//            appnavigation.isDebug = Constants.App.isDebug
//            return appnavigation
//        }
//
//        return SwinjectStoryboard.defaultContainer.resolve(AppDelegateNavigator.self)
//    }
//
//
//    func menuViewController() -> UIViewController? {
//        let mainVC = SwinjectStoryboard.create(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu")
//        
//        return mainVC
//
//
//    }
//
    
    
    
}

extension UIViewController {
    var assembler: SwinjectAssembler { return SwinjectAssembler.sharedInstance }
}
