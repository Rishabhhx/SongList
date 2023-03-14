//
//  ViewController.swift
//  likeMinds
//
//  Created by Rishabh Sharma on 14/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties
    let viewModel = ViewModel()
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
    }
    
    // MARK: Private Functions
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongsListCell", bundle: nil), forCellReuseIdentifier: "SongsListCell")
        tableView.estimatedRowHeight = 600
        tableView.layer.cornerRadius = 20
        viewModel.getArtistData()
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songsListObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongsListCell", for: indexPath) as? SongsListCell else {return UITableViewCell()}
        cell.configure(name: viewModel.songsListObj[indexPath.row].artistName ?? "Unknown Artist", desc: viewModel.songsListObj[indexPath.row].description ?? "Unknown Description", price: viewModel.songsListObj[indexPath.row].trackPrice ?? 0.0, trackName: viewModel.songsListObj[indexPath.row].trackName ?? "Unknown Track", urlImage: viewModel.songsListObj[indexPath.row].artworkUrl100 ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController : SongsListDelegate {
    func dataRecived() {
        DispatchQueue.main.async {
            self.backgroundImage.downloadImageFrom(link: self.viewModel.songsListObj[10].artworkUrl100 ?? "", contentMode: .scaleAspectFill)
            self.tableView.reloadData()
        }
    }
}
