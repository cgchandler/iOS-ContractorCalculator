//
//  TaxRateViewController.swift
//  ContractorCalculator
//
//  Created by Chris Chandler on 11/24/22.
//

import UIKit

protocol TaxRateControllerDelegate: AnyObject {
    func getCurrentTaxRate() -> String
    func taxRateChanged(taxRate: String)
}

class TaxRateViewController: UIViewController {

    weak var delegate: TaxRateControllerDelegate?
    
    @IBOutlet weak var lblTaxRate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Programmatically add a "Save" button to the right-side of navigation bar
        let saveButton: UIBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                            target: self,
                            action: #selector(saveTaxRate))
        self.navigationItem.rightBarButtonItem = saveButton
        self.title = "Enter Tax Rate"
        
        // Get and display the current tax rate using the delegate function getCurrentTaxRate
        lblTaxRate.text = self.delegate?.getCurrentTaxRate()
        lblTaxRate.becomeFirstResponder()   // Set the focus to the taxrate
        
    }
    
    @objc func saveTaxRate() {
        // Update the tax rate on the main view using the delegate function taxRateChanged
        self.delegate?.taxRateChanged(taxRate: lblTaxRate.text ?? "0.0")
        // Return to the main view
        self.navigationController?.popViewController(animated: true)
    }

}
