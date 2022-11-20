//
//  ViewController.swift
//  ContractorCalculator
//
//  Created by Chris Chandler on 11/16/22.
//

import UIKit

class ViewController: UIViewController {

    let taxRate = 0.05  // Tax Rate Constant
    
    @IBOutlet weak var txtLabor: UITextField!
    @IBOutlet weak var txtMaterials: UITextField!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBAction func btnCalculate(_ sender: Any) {
        
        // Get the user entered values (nil-coalescing operator ?? returns 0.0 when conversion to double fails)
        let labor = Double(txtLabor.text!) ?? 0.0
        let materials = Double(txtMaterials.text!) ?? 0.0
        
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
    
    @objc func dimissKeyboard() {
        view.endEditing(true)
    }
    
}

