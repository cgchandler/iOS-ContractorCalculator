//
//  ViewController.swift
//  ContractorCalculator
//
//  Created by Chris Chandler on 11/16/22.
//

import UIKit

class ViewController: UIViewController, TaxRateControllerDelegate {

    @IBOutlet weak var txtLabor: UITextField!
    @IBOutlet weak var txtMaterials: UITextField!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTaxRate: UILabel!
    
    @IBAction func btnCalculate(_ sender: Any) {
        
        // Get the user entered values (nil-coalescing operator ?? returns 0.0 when conversion to double fails)
        let labor = Double(txtLabor.text!) ?? 0.0
        let materials = Double(txtMaterials.text!) ?? 0.0
        let taxRate = (Double(lblTaxRate.text!) ?? 0.0) / 100

        // Perform calculations
        let subTotal = labor + materials
        let tax = subTotal * taxRate
        let total = subTotal + tax
        
        // Display results
        lblSubTotal.text = String(format: "$%.2f", subTotal)
        lblTax.text = String(format: "$%.2f", tax)
        lblTotal.text = String(format: "$%.2f", total)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Code to dimiss the keyboard
        let tap: UITapGestureRecognizer =
                    UITapGestureRecognizer(target: self,
                                           action: #selector(self.dimissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Clear out the temporary text in the labels (there for help with layout in designer)
        lblSubTotal.text = ""
        lblTax.text = ""
        lblTotal.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Get and display the tax rate from the user defaults
        let settings = UserDefaults.standard
        lblTaxRate.text = settings.string(forKey: Constants.taxRate)
    }
    
    // implementation of delegate method to get the current taxrate
    func getCurrentTaxRate() -> String {
        return lblTaxRate.text ?? "0.0"
    }
    
    // implementation of delegate method to return the new taxrate
    func taxRateChanged(taxRate: String) {
        
        // Update the taxrate if a numeric value is passed in
        if (taxRate.isNumeric) {
            
            // set the UserDefaults taxrate setting to the new value
            let settings = UserDefaults.standard
            settings.set(taxRate, forKey: Constants.taxRate)
            settings.synchronize()
            
            // Display the new tax rate
            lblTaxRate.text = taxRate
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueTaxRate") {
            let taxRateController = segue.destination as! TaxRateViewController
            taxRateController.delegate = self
        }
    }
    
    @objc func dimissKeyboard() {
        view.endEditing(true)
    }
    
}
