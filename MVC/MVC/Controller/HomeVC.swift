//
//  HomeVC.swift
//  MVC
//
//  Created by Hany Karam on 12/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {
    var items = [ProductModelDatum]()
    
    @IBOutlet weak var HomeTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        HomeTV.register(nib, forCellReuseIdentifier: "ProductCell")
        LoadProduct()
        HomeTV.dataSource = self
        HomeTV.delegate = self
    }
    
    func LoadProduct() {
        showLoading()
        NetWorkManager.instance.API(method: .get, url: proudct) { (err, status, response:ProductModel?) in
            self.HideLoading()
            if err == nil {
                print(response!)
                guard let data = response?.data?.data else {return}
                self.items = data
                self.HomeTV.reloadData()
            }
        }
    }
}
 
