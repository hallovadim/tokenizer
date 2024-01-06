//
//  ResultPageViewController.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import UIKit

final class ResultPageViewController: UITableViewController {
    var inputText = ""
    private var tokenizedSentences: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenizedSentences = TokenizerService.getTokenizedSentences(fromText: inputText)
        print("ResultPageViewController:viewDidLoad")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tokenizedSentences.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tokenizedSentences[section].count
    }
}
