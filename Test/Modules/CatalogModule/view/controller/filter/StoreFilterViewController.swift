//
//  StoreFilterViewController.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import RxSwift


class StoreFilterViewController : UIViewController
{
    
    @IBOutlet weak var hasSubscriptionSiwtchV: UISwitch!
    
    @IBOutlet weak var highToLowRatingSwitcV: UISwitch!
    
    @IBOutlet weak var minOrderSwicthV: UISwitch!
    
    
    var viewModel:StoreFilterViewModel?
    
    var disposeBag = DisposeBag()
    
    //MARK:- Navigator
    var navigator:CatalogNavigator?
    
  
    
    // MARK:- ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel?.getTitle()
        
        
        binding()
        setupCancelNavBtn()
        setupDoneNavBtn()
        
    }
    
    //MARK: Setup Navigation Bar Items
    
    func setupCancelNavBtn()
    {
        
        
        let editItem = UIBarButtonItem.init(title: "Reset", style: .plain , target: self, action: nil)
        
    
        
        self.navigationItem.leftBarButtonItem = editItem
        
        editItem.rx.tap.bind{ [unowned self] in
            
            self.viewModel?.clearFilter()
            self.dismiss(animated: true, completion: {
                
            })
            
            }.addDisposableTo(disposeBag)
    }
    
    func setupDoneNavBtn()
    {
        
        
        let editItem = UIBarButtonItem.init(title: "Done", style: .plain , target: self, action: nil)
        
    
        
        self.navigationItem.rightBarButtonItem = editItem
        
        editItem.rx.tap.bind { [unowned self] in
            self.viewModel?.applyFilter()
            self.dismiss(animated: true, completion: {
                
            })
            
            }.addDisposableTo(disposeBag)
        
        
        
    }
    
    
    // Then handle the button selection
    func goBack() {
        // Here we just remove the back button, you could also disabled it or better yet show an activityIndicator
        
      //  self.viewModel?.goBackToStoreList()
        
    }
    
    // MARK:- Binding
    
    func binding(){
        
        if let sub = viewModel?.getHasSubscription()
        {
            hasSubscriptionSiwtchV.setOn(sub, animated: false)
        }
        
        if let rate = viewModel?.getHighToLowRating()
        {
        
            highToLowRatingSwitcV.setOn(rate , animated: false)

        }
        
        if let minOrder = viewModel?.getAsscendingMinOrder()
        {
            minOrderSwicthV.setOn(minOrder , animated: false)
        }
        
                

        hasSubscriptionSiwtchV.rx.isOn.bind { [unowned self](x) in
            if(x)
            {
                self.viewModel?.setHasSubscription(value: x)
            }
            else{
                self.viewModel?.setHasSubscription(value: nil)

            }
        }.addDisposableTo(disposeBag)
        
        
        highToLowRatingSwitcV.rx.isOn.bind { [unowned self](x) in
            if(x)
            {
            self.viewModel?.setHighToLowRating(value: x)
            }
            else{
                self.viewModel?.setHighToLowRating(value: nil)
                
            }
        }.addDisposableTo(disposeBag)
        
        minOrderSwicthV.rx.isOn.bind { [unowned self](x) in
            if(x)
            {
                self.viewModel?.setAsscendingMinOrder(value: x)
            }
            else{
                self.viewModel?.setAsscendingMinOrder(value: nil)

            }
        }.addDisposableTo(disposeBag)
        
        
        
        viewModel?.showLoading.subscribe({[unowned self] (e) in
            if(e.element!)
            {
                self.showLoading()
            }
            else
            {
                self.hideLoading()
            }
        }).addDisposableTo(disposeBag)
        
        
        
        viewModel?.errorObservable.asObservable().subscribe(onNext: { [unowned self] error in
            if let err = error
            {
                self.hideLoading()
                AlertHelper.showAlert(title: "Error", subTitle: err, type: .error, callBack: {
                    
                })
            }
            
        }).addDisposableTo(disposeBag)
        
        
        
        viewModel?.confirmObservable.asObservable().subscribe(onNext: { [unowned self] msg in
            if let m = msg
            {
                self.hideLoading()
                AlertHelper.showConfirmAlert(title: "Note", subTitle: m, confirmBtnTitle: "OK", destructiveBtnTitle: "NO", type: .warning, postiveCallBack: {
                    
                    
                }, negativeCallback: {
                    
                },controller:self)
            }
            
        }).addDisposableTo(disposeBag)
        
        
        
        viewModel?.updateViewWithData.subscribe({ [unowned self](e) in
            if(e.element!)
            {

            }
            
        }).addDisposableTo(disposeBag)
        
        
        
        
    }
    
    
    //MARK:- AnimateIn
    func animateIn()
    {
        
    }
    
    
  
    
    
    
}
