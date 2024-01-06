//
//  MainPageViewController.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import UIKit

final class MainPageViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainPageViewController:viewDidLoad")
        textView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           if(text == "\n") {
               // main return keyboard button is pressed here (GO / DONE / etc)
               textView.resignFirstResponder()
               goToResultPage()
               return false
           } else {
               fatalError("Unhandled keyboard button pressed")
           }
           //return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare segue has been called")
        if segue.identifier == "resultSegue" {
            guard let vc = segue.destination as? ResultPageViewController else { return }
            // pass data later here to vc
            vc.inputText = textView.text
            print(vc.inputText)
        } else {
            fatalError("unknown segue was called for prepare")
        }
    }
    
    func goToResultPage() {
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
}
