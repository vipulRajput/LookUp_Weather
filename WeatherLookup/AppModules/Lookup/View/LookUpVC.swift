//
//  LookUpVC.swift
//  WeatherLookup
//
//  Created by Vipul on 23/02/22.
//

import UIKit

class LookUpVC: UIViewController {

    @IBOutlet weak var enterCityTextField: UITextField!
    @IBOutlet weak var lookupBtn: LoadingButton!
    
    private let viewModel = LookUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    
    @IBAction func lookupBtnTapped(_ sender: LoadingButton) {
        
        guard let city = self.enterCityTextField.text else {
            return
        }
        
        self.lookupBtn.loadIndicator(true)
        self.viewModel.getWeatherData(for: city)
    }
}

extension LookUpVC {
    
    private func initialSetup() {
        
        self.title = "Lookup Weather"
        self.lookupBtn.layer.cornerRadius = self.lookupBtn.frame.height / 2
        self.lookupBtn.clipsToBounds = true
        
        self.setupVM()
    }
    
    private func setupVM() {
        
        viewModel.listWeatherData = { [weak self] weatherForcastData in
            
            self?.lookupBtn.loadIndicator(false)
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForcastListingVC") as? ForcastListingVC else { return }
            vc.viewModel = ForcastListingViewModel.init(data: weatherForcastData.list)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        viewModel.showErrorMesssage = { [weak self] errorMsg in
            
            self?.lookupBtn.loadIndicator(false)
            let alert = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
