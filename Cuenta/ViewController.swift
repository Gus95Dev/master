//
//  ViewController.swift
//  Cuenta
//
//  Created by Gustavo Calles on 09/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var porComensal: UILabel!
    @IBOutlet weak var propinaTotal: UILabel!
    @IBOutlet weak var totalSinPropina: UITextField!
    @IBOutlet weak var noDeComensales: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }

    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1792{
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = -150
            }
        }
    }
    
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func limpiar(_ sender: UIButton) {
        totalSinPropina.text = ""
        noDeComensales.text = ""
        total.text = "$0.00"
        propinaTotal.text = "$0.00"
        porComensal.text = "$0.00"
    }
    
    @IBAction func cincoPorciento(_ sender: UIButton) {
        
        guard let totalsinpropina = totalSinPropina.text else {return}
        guard let nodecomensales = noDeComensales.text else {return}
        let totall = (totalsinpropina as NSString).floatValue
        let node = (nodecomensales as NSString).floatValue
        
        let cinco = totall * 0.05
        let mascinco = cinco + totall
        let porco = mascinco / node
        
        total.text = "$\(mascinco)"
        propinaTotal.text = "$\(cinco)"
        porComensal.text = "$\(porco)"
        
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func diezPorciento(_ sender: UIButton) {
        guard let totalsinpropina = totalSinPropina.text else {return}
        guard let nodecomensales = noDeComensales.text else {return}
        let totall = (totalsinpropina as NSString).floatValue
        let node = (nodecomensales as NSString).floatValue
        
        let diez = totall * 0.10
        let masdiez = diez + totall
        let porco = masdiez / node
        
        total.text = "$\(masdiez)"
        propinaTotal.text = "$\(diez)"
        porComensal.text = "$\(porco)"
        
        self.view.endEditing(true)
    }
    
    //quince%
    @IBAction func quincePorciento(_ sender: UIButton) {
        guard let totalsinpropina = totalSinPropina.text else {return}
        guard let nodecomensales = noDeComensales.text else {return}
        let totall = (totalsinpropina as NSString).floatValue
        let node = (nodecomensales as NSString).floatValue
        
        let quince = totall * 0.15
        let masquince = quince + totall
        let porco = masquince / node
        
        total.text = "$\(masquince)"
        propinaTotal.text = "$\(quince)"
        porComensal.text = "$\(porco)"
        
        self.view.endEditing(true)
    }
    
    
}

