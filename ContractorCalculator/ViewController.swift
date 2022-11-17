//
//  ViewController.swift
//  ContractorCalculator
//
//  Created by Chris Chandler on 11/16/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtLabor: UITextField!
    @IBOutlet weak var txtMaterials: UITextField!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBAction func btnCalculate(_ sender: Any) {
        
        let labor = Double(txtLabor.text!)
        let materials = Double(txtMaterials.text!)
        let subTotal = labor! + materials!
        let taxRate = 0.05
        let tax = subTotal * taxRate
        let total = subTotal + tax
        
        lblSubTotal.text = "\(subTotal)"
        lblTax.text = "\(tax)"
        lblTotal.text = "\(total)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

