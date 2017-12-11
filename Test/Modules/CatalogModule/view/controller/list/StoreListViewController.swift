//
//  StoreListViewController.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift


class StoreListViewController : UIViewController
{
    
    @IBOutlet weak var tableV: UITableView!
    
    @IBOutlet weak var customSearchV: CustomSearchView!
    
    var viewModel:StoreListViewModel?
    
    var disposeBag = DisposeBag()
    
    //MARK:- Navigator
    var navigator:CatalogNavigator?
    
    
    //MARK:- PassedVarialble
    var typeId:Int?
    
    
    // MARK:- ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel?.getTitle()
        
        setupCustomSearchBar()
        binding()
        prepareCell()
        
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
        
        
        
        
        self.customSearchV.searchTxtField.rx.text.bind {[unowned self] text in
            
            self.viewModel?.searchList(keyword: text!)
            
            }.addDisposableTo(disposeBag)
        
        
        self.customSearchV.cancelBtn.rx.tap.bind{ [unowned self] in
            self.viewModel?.searchList(keyword: "")
            
            }.addDisposableTo(disposeBag)
        
        
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
        
        self.tableV.register(UINib.init(nibName: "StoreCell", bundle: nil), forCellReuseIdentifier: "StoreCell")
        
        
    }
    
    //MARK:- AnimateIn
    func animateIn()
    {
        
    }
    
    
    func setupCustomSearchBar()
    {
        self.customSearchV.searchTxtField.attributedPlaceholder =
            NSAttributedString(string:"Search" , attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        
    }
    
    
}

extension StoreListViewController :UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.getStoreCount()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! StoreCell
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.viewModel?.selectStore(index: indexPath.row)
    }
    
}


