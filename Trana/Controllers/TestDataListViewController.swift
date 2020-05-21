//
//  TestDataListViewController.swift
//  Trana
//
//  Created by Matt M Smith on 5/6/20.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class TestDataListViewController: UIViewController {
    @IBOutlet weak var testDataTableView: UITableView!
    
    let testDataManager = TestDataManager()
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testDataTableView.dataSource = self
        testDataTableView.delegate = self
    }
    
    @IBAction func pressedAddData(_ sender: UIBarButtonItem) {
        testDataManager.createNewTestDataSet()
        let testDataVC = mainStoryBoard.instantiateViewController(identifier: Constants.Storyboard.id)
        present(testDataVC, animated: true, completion: nil)
    }
}

extension TestDataListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.cellID, for: indexPath)
        cell.textLabel?.text = testDataManager.getTitle(from: indexPath.row)
        return cell
    }
}

extension TestDataListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
