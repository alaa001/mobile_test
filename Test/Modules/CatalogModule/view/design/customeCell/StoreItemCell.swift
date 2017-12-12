//
//  StoreItemCell.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import UIKit

import RxSwift

class StoreItemCell : UITableViewCell {
    
    @IBOutlet weak var cellImageV: UIImageView!
    
    @IBOutlet weak var cellNameLabel: UILabel!
    
    @IBOutlet weak var service1PriceLabel: UILabel!
    
    @IBOutlet weak var service2PriceLabel: UILabel!
    
    @IBOutlet weak var service3PriceLabel: UILabel!
    
    @IBOutlet weak var servBtn1: UIButton!
    @IBOutlet weak var servBtn2: UIButton!
    
    @IBOutlet weak var servBtn3: UIButton!
    @IBOutlet weak var checkImageV1: UIImageView!
    @IBOutlet weak var checkImageV2: UIImageView!
    @IBOutlet weak var checkImageV3: UIImageView!
    
    private(set) var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    func selectService(serviceType:ServiceType)
    {
        clearSelection()
        
        switch serviceType {
        case .service1:
            checkImageV1.alpha = 1
        case .service2:
            checkImageV2.alpha = 1
        case .service3:
            checkImageV3.alpha = 1
            
        
        }
        
    }
    
    func clearSelection()
    {
        checkImageV1.alpha = 0.2
        checkImageV2.alpha = 0.2
        checkImageV3.alpha = 0.2

    }
}
