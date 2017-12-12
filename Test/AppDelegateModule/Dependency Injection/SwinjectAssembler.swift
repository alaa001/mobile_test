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
          CatalogAssembly(),
          NetworkAssembly(),

        ], container: SwinjectStoryboard.defaultContainer)
    
    
}

extension SwinjectAssembler {
    

    func storListViewController() -> UINavigationController? {
        let mainVC = SwinjectStoryboard.create(name: "Catalog", bundle: nil).instantiateViewController(withIdentifier: "MainNav") as! UINavigationController
        
        return mainVC


    }

    
    
    
}

extension UIViewController {
    var assembler: SwinjectAssembler { return SwinjectAssembler.sharedInstance }
}
