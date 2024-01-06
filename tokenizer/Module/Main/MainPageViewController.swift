//
//  MainPageViewController.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import UIKit

final class MainPageViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainPageViewController:viewDidLoad")
        textView.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(Language.getSelectedLanguageIndex(), inComponent: 0, animated: false)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           if(text == "\n") {
               // main return keyboard button is pressed here (GO / DONE / etc)
               textView.resignFirstResponder()
               goToResultPage()
               return false
           }
           
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare segue has been called")
        if segue.identifier == "resultSegue" {
            guard let vc = segue.destination as? ResultPageViewController else { return }
            // pass data later here to vc
            vc.tokenizedSentences =  TokenizerService.getTokenizedSentences(fromText: textView.text, languageUsed: Language.getSelectedLanguage())
        } else {
            fatalError("unknown segue was called for prepare")
        }
    }
    
    func goToResultPage() {
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
}

extension MainPageViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Language.allCasesArray.count
    }
}

extension MainPageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Language.allCasesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Language.setSelectedLanguageIndex(index: row)
    }
}
