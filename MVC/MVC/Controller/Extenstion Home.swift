//
//  Extenstion Home.swift
//  MVC
//
//  Created by Hany Karam on 12/4/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        cell.Name.text = items[indexPath.row].name
        cell.Price.text = "Price: " + " " +  "\(items[indexPath.row].price!)" + " " + "EG"
        cell.configure(Product: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 268
    }
}
