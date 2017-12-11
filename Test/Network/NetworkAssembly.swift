//
//  NetworkAssembly.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import Swinject

class NetworkAssembly :Assembly{
    
    func assemble(container: Container)
    {
        container.register(Networking.self) { r in
            return Network()
        }
        
        container.register(ApiConfiguration.self){ r in
            return ApiConfiguration()
        }
    }
    
    
    
}


