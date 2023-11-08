//
//  ReadingViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 27.10.2023.
//

import UIKit

final class ReadingViewController: UIViewController {
    var tableView: UITableView!
    var languageData: [LanguageData] = []
    override func viewDidLoad() {
        style()
        layout()
        readJSONFile()
        navigationItem.title = "Stories"
    }
    func readJSONFile() {
            if let path = Bundle.main.path(forResource: "language", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let decoder = JSONDecoder()
                    languageData = try decoder.decode([LanguageData].self, from: data)
                    tableView.reloadData() // Reload the table view data after parsing the JSON
                } catch {
                    print("JSON verileri okunamadı: \(error)")
                }
            }
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
        return languageData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoriesCell.reuseID, for: indexPath) as! StoriesCell
        
        // Dizi boyutunu kontrol et
        if indexPath.row < languageData.count {
            // languages dizisini kontrol et
            if let languages = languageData[indexPath.row].languages, indexPath.row < languages.count {
                let language = languages[indexPath.row]
                
                // Eğer language ve title özelliği varsa, hücre metnini ayarlayın
                if let title = language.title {
                    cell.storyName.text = title
                }
            } else {
                // Eğer languages dizisi nil veya indeksi aşıyorsa, bir hata işleme yöntemi kullanabilirsiniz
                cell.storyName.text = "Henüz eklenmedi."
            }
        } else {
            // Eğer languageData dizisinin indeksi aşıyorsa, bir hata işleme yöntemi kullanabilirsiniz
            cell.storyName.text = "Geçersiz Veri"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < languageData.count {
            let id = languageData[indexPath.row].id ?? 0
            let storyViewController = StoryViewController()
            storyViewController.readJSONFile(forID: id)
            let navigationController = UINavigationController(rootViewController: storyViewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }

}


