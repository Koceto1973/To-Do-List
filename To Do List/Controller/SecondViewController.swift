//
//  SecondViewController.swift
//  To Do List
//
//  Created by К.К. on 19.09.18.
//  Copyright © 2018 TeamK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.delegate = self
        textField.text = ""

    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField.text = ""
    }

    
    @IBAction func AddItem(_ sender: UIButton) {
        let itemsArray = UserDefaults.standard.object(forKey: "items") as? Array<String>
        let text = textField.text ?? textField.placeholder!
        if var items = itemsArray {
            items.append(text)
            UserDefaults.standard.set(items, forKey: "items")
        }
        else {
            let items = [text]
            UserDefaults.standard.set(items, forKey: "items")
        }
        // UserDefaults.standard.removeObject(forKey: "keyToArray")
        
        textField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}





