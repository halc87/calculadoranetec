//
//  ViewController.swift
//  Calculadora
//
//  Created by Macbook on 21/05/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var txfOriginAmount: UITextField!
    @IBOutlet weak var txfPorcentage: UITextField!
    @IBOutlet weak var txfTip: UITextField!
    @IBOutlet weak var txfTipAmount: UITextField!
    

    let pickerTip = UIPickerView()
    let myPickerData: [Int] = [0, 5, 10, 15]
    var porcentageSelected:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfPorcentage.inputView = pickerTip
        pickerTip.delegate = self
        //txfPorcentage.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
 
    
    @IBAction func changeEdit(_ sender: UITextField) {
        if sender == txfOriginAmount{
            self.calculateTip()
        }
    }
    
    // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(myPickerData[row]) %"
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txfPorcentage.text = "\(myPickerData[row]) %"
        porcentageSelected = Float(myPickerData[row])
        self.calculateTip()
        
    }
    
    func calculateTip(){
        
        if porcentageSelected != nil && txfOriginAmount.text != ""{
            let amount = Float(self.txfOriginAmount.text!)
            let tipOnly = (amount! * porcentageSelected!) / 100
            let tipAmount = amount! + tipOnly
            
            self.txfTip.text = "\(tipOnly)"
            self.txfTipAmount.text = "\(tipAmount)"
        }
    }
    
}


