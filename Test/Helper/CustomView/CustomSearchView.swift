//
//  CustomSearchView.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa


class CustomSearchView:UIView {
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var searchBgImageV: UIImageView!
    @IBOutlet weak var searchTxtField: UITextField!
    
    var contentView : UIView!
    
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    override func layoutSubviews() {
        
        let searchBg = UIImage(imageLiteralResourceName: "searchBg")
        
        self.searchBgImageV.image = searchBg.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 40, 0, 40))
        
        
        
        binding()
        
        
    }
    
    func binding()
    {
        self.searchTxtField.rx.text.asDriver().map({ (txt) -> Bool in
            return (txt?.characters.count)! > 0
        })
            .drive(self.cancelBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        
        self.cancelBtn.rx.tap.asDriver().map({
            return ""
        }).drive(self.searchTxtField.rx.text)
            .addDisposableTo(disposeBag)
        
        self.cancelBtn.rx.tap.bind{
            [unowned self] in
            
            self.searchTxtField.resignFirstResponder()
            
            }.addDisposableTo(disposeBag)
        
    }
    
}

