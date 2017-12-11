//
//  ImageCache.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView
{
    
    
    func setImage(url:URL,placeHolder:UIImage?)
    {
        
        self.af_setImage(withURL: url, placeholderImage: placeHolder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: true, completion: nil)
        
        
    }
    
    
    
}
