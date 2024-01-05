//
//  MainPageViewController.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import UIKit

final class MainPageViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainPageViewController:viewDidLoad")
        textView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           if(text == "\n") {
               // main return keyboard button is pressed here (GO / DONE / etc)
               textView.resignFirstResponder()
               tokenize()
               return false
           } else {
               fatalError("Unhandled keyboard button pressed")
           }
           //return true
    }
    
    func tokenize() {
        //
    }
}
