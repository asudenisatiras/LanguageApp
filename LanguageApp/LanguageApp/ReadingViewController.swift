//
//  ReadingViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 27.10.2023.
//

import UIKit

final class ReadingViewController: UIViewController {
    var tableView: UITableView!

    override func viewDidLoad() {
        style()
        layout()
        navigationItem.title = "Stories"
    }
}
extension ReadingViewController {
    private func style() {

        view.backgroundColor = .white
        tableView = UITableView()
        tableView.rowHeight = 70
        
        tableView.separatorStyle = .none
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}
extension ReadingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.reuseID, for: indexPath) as! StoriesCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyViewController = StoryViewController()
           let navigationController = UINavigationController(rootViewController: storyViewController)
        navigationController.modalPresentationStyle = .fullScreen
           present(navigationController, animated: true, completion: nil)

    }
}


