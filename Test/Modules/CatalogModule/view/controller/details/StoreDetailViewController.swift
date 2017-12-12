//
//  StoreDetailViewController.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import RxSwift


class StoreDetailViewController : UIViewController
{
    
    @IBOutlet weak var tableV: UITableView!
    
    
    var viewModel:StoreDetailsViewModel?
    
    var disposeBag = DisposeBag()
    
    //MARK:- Navigator
    var navigator:CatalogNavigator?
    
   
    var backButton : UIBarButtonItem!
    var cartButton : UIBarButtonItem!

    
    
    // MARK:- ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel?.getTitle()
        
        setupBackButton()
        binding()
        prepareCell()
        
        perpareCartNav()
        
    }
    
    
    
    func perpareCartNav(){
        
        self.cartButton = UIBarButtonItem(title: "0", style: .plain, target: self,action:nil)
        self.navigationItem.rightBarButtonItem = cartButton

        self.viewModel?.cartCount.asObservable().subscribe{[unowned self] x in
            
            if let  cartValue = x.element
            {
                self.cartButton.title = "\(cartValue)"
            }
            
        }.addDisposableTo(disposeBag)
        

        
    }
    
    
    
    
    func setupBackButton()
    {
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.backButton = UIBarButtonItem(title: "Back", style: .plain, target: self,action:#selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    
    // Then handle the button selection
    func goBack() {
        // Here we just remove the back button, you could also disabled it or better yet show an activityIndicator

        self.viewModel?.goBackToStoreList()
        
    }
    
    // MARK:- Binding
    
    func binding(){
        
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
                    
                    self.viewModel?.clearCart()
                    
                }, negativeCallback: {
                    
                },controller:self)
            }
            
        }).addDisposableTo(disposeBag)
        
        
        
        viewModel?.updateViewWithData.subscribe({ [unowned self](e) in
            if(e.element!)
            {
                self.tableV.reloadData()
            }
            
        }).addDisposableTo(disposeBag)
        
        
        
        
    }
    
    
    //MARK : - Prepare Cell
    func prepareCell()
    {
        
        self.tableV.register(UINib.init(nibName: "StoreItemCell", bundle: nil), forCellReuseIdentifier: "StoreItemCell")
        
        
    }
    
    //MARK:- AnimateIn
    func animateIn()
    {
        
    }
    
    
    func selectUnSelectCell(storItemViewModel:ItemViewModel,cell:StoreItemCell,serviceType:ServiceType)
    {
        if(storItemViewModel.serviceSelected != serviceType)
        {
            if(storItemViewModel.serviceSelected == nil)
            {
                viewModel!.cartCount.value += 1
            }
            
            cell.selectService(serviceType: serviceType)
            storItemViewModel.setServiceSelected(serviceType: serviceType)
            
        }
        else
        {
            cell.clearSelection()
            storItemViewModel.setServiceSelected(serviceType: nil)
            viewModel!.cartCount.value -= 1
            
        }
    }
   
    
    
}

extension StoreDetailViewController :UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.getStoreCount()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreItemCell") as! StoreItemCell
        
        let storItemViewModel  = viewModel?.getItemViewModel(index: indexPath.row)
        
        cell.cellNameLabel.text = storItemViewModel?.getName()
        cell.service1PriceLabel.text = storItemViewModel?.getService1Price().formatPrice()
        cell.service2PriceLabel.text = storItemViewModel?.getService2Price().formatPrice()
        cell.service3PriceLabel.text = storItemViewModel?.getService3Price().formatPrice()
        
        
        
        if let imageUrl = storItemViewModel?.getImageUrl()
        {
            cell.cellImageV.setImage(url:  URL.init(string: imageUrl)!, placeHolder: UIImage.init(imageLiteralResourceName: "default-placeholder"))
        }
        
        
        if let serviceChooseen = storItemViewModel?.serviceSelected
        {
            cell.selectService(serviceType: serviceChooseen)
        }
        else{
            cell.clearSelection()
        }
        
        
        cell.servBtn1.rx.tap.bind{() in
            self.selectUnSelectCell( storItemViewModel: storItemViewModel!, cell: cell, serviceType: .service1)
        }.addDisposableTo(cell.disposeBag)
        
        
        cell.servBtn2.rx.tap.bind{() in
            
            self.selectUnSelectCell( storItemViewModel: storItemViewModel!, cell: cell, serviceType: .service2)
            
            }.addDisposableTo(cell.disposeBag)
        
        
        cell.servBtn3.rx.tap.bind{() in
            
            self.selectUnSelectCell( storItemViewModel: storItemViewModel!, cell: cell, serviceType: .service3)
            
            }.addDisposableTo(cell.disposeBag)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.viewModel?.selectItem(index: indexPath.row)
    }
    
}


