//
//  ViewController.swift
//  Currency_MVVM
//
//  Created by Ghadeer El-Mahdy on 4/28/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
//outlets
    @IBOutlet weak private var searchBar: UISearchBar!
    
    @IBOutlet weak private var tableView: UITableView!
    
//var
    var viewModel : ViewModelType?
    var compositeDisposable : DisposeBag = DisposeBag()
//life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel(viewModel: ViewModel())
        setupSearchbar()
        
        viewModel?.fetchDataFromNetwork()
        setupTableview()
    }

//private functions
    private func setupTableview (){
        viewModel?.dataDriver.drive(
            tableView.rx.items(cellIdentifier: "cell", cellType: CurrencyTableViewCell.self)){
            (row,item,cell) in
            cell.currency = item
        }.disposed(by: compositeDisposable)
    }
    private func setupSearchbar (){
        searchBar.rx.text
            .orEmpty
            .map({ (it) -> String in
               return it.uppercased()
            })
            .distinctUntilChanged()
            .throttle(.microseconds(10), scheduler: MainScheduler.asyncInstance)
            .subscribe( onNext :{ [weak self] (text) in
                guard let self = self else {return}
               // print(text)
                self.viewModel?.filterData(word: text)
            }).disposed(by: compositeDisposable)
        
    }
    private func initViewModel( viewModel : ViewModelType){
        self.viewModel = viewModel
    }
}

