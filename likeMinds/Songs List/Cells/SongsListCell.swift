//
//  SongsListCell.swift
//  likeMinds
//
//  Created by Rishabh Sharma on 14/03/23.
//

import UIKit

class SongsListCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var artWorkImage: UIImageView!
    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discriptionLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var cellView: UIView!
    
    @IBOutlet weak var backgroungImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        artWorkImage.layer.cornerRadius = 10
        backgroungImage
            .layer.opacity = 0.8
    }
    
    func configure(name: String, desc: String, price: Double, trackName: String, urlImage: String) {
        artistNameLabel.text = name
        priceLabel.text = "\(String(price)) $"
        discriptionLabel.text = desc
        trackNameLabel.text = trackName
        artWorkImage.downloadImageFrom(link: urlImage, contentMode: .scaleAspectFill)
        backgroungImage.downloadImageFrom(link: urlImage, contentMode: .scaleAspectFill)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        guard let resourceURL = URL(string: link) else {
            return
        }
        let request = URLRequest(url: resourceURL)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data {
                DispatchQueue.main.sync {
                    self.contentMode =  contentMode
                    self.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}
