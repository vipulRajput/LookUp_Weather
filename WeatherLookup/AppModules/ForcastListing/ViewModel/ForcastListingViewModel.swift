//
//  ForcastListingViewModel.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import Foundation
import UIKit

class ForcastListingViewModel {
    
    var forcastDataArr: [ForcastData]?
    var dataSourceUpdated: (()-> Void)?
    
    init(data: [ForcastData]?) {
        self.forcastDataArr = data
        
        self.dataSourceUpdated?()
    }
    
    func numberOfRowsInSections() -> Int {
        return self.forcastDataArr?.count ?? 0
    }
    
    func cellForRow(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ForcastTableCell = tableView.dequeueReusableCell(withIdentifier: "ForcastTableCell", for: indexPath) as! ForcastTableCell
        if let data = forcastDataArr {
            cell.configure(data[indexPath.row])
        }
        return cell
    }
}
