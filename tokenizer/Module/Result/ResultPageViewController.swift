//
//  ResultPageViewController.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import UIKit

final class ResultPageViewController: UITableViewController {
    var tokenizedSentences: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ResultPageViewController:viewDidLoad")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tokenizedSentences.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tokenizedSentences[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // to avoid the section #0 header cutoff by topbar.
        return section == 0 ? 30 : 18
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TokenCell", for: indexPath)
        
        let token = tokenizedSentences[indexPath.section][indexPath.row]
        cell.textLabel?.text = token
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = "Sentence \(section+1)"
        return sectionName
    }
}
