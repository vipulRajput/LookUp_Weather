//
//  ForcastListingVC.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import UIKit

class ForcastListingVC: UIViewController {

    @IBOutlet weak var forcastTableView: UITableView!
    
    var viewModel: ForcastListingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialSetup()
    }
}

extension ForcastListingVC {
    
    private func initialSetup() {
        
        self.title = self.viewModel.forcastDataArr?.first?.name ?? ""
        self.forcastTableView.register(UINib(nibName: "ForcastTableCell", bundle: nil), forCellReuseIdentifier: "ForcastTableCell")
        self.forcastTableView.dataSource = self
        self.forcastTableView.delegate = self
        
        self.setupVM()
    }
    
    private func setupVM() {
        
        viewModel.dataSourceUpdated = { [weak self] in
            self?.forcastTableView.reloadData()
        }
    }
}

extension ForcastListingVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.cellForRow(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForcastDetailsVC") as? ForcastDetailsVC else { return }
        vc.forcastData = self.viewModel.forcastDataArr?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

