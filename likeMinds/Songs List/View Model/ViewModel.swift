//
//  viewModel.swift
//  likeMinds
//
//  Created by Rishabh Sharma on 14/03/23.
//
import Foundation

protocol SongsListDelegate: AnyObject {
    func dataRecived()
}

class ViewModel {
    
    // MARK: Properties
    var artistName : String = ""
    var songsListObj : [Result] = []
    weak var delegate : SongsListDelegate?
    
    // MARK: Methods
    func getArtistData() {
        let url = URL(string: "https://itunes.apple.com/search?term=adele")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                         let res = try JSONDecoder().decode(Welcome.self, from: data)
                self.songsListObj = res.results
                self.delegate?.dataRecived()
                      } catch let error {
                         print(error)
                      }
        }

        task.resume()
    }
}

