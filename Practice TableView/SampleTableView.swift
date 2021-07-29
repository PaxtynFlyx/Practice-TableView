//
//  SampleTableView.swift
//  Practice TableView
//
//  Created by Nuri Chun on 7/28/21.
//

import UIKit

class SampleTableView: UIViewController {
    
    let tableView = UITableView()
    var dataString = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 1...20 {
            dataString.append("Data \(x)")
        }
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
}

extension SampleTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataString[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped \(indexPath.row + 1)")
    }
}

