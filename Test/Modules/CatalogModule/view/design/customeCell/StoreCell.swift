//
//  StoreCell.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import UIKit
import SwiftyStarRatingView

class StoreCell : UITableViewCell {
    
    @IBOutlet weak var cellImageV: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
  
        
    @IBOutlet weak var trackingImageV: UIImageView!
    
    @IBOutlet weak var ratingV: SwiftyStarRatingView!
    
    @IBOutlet weak var normalServiceValue: UILabel!
    @IBOutlet weak var specialServiceValue: UILabel!
    
    @IBOutlet weak var minOrderValue: UILabel!
    
}
