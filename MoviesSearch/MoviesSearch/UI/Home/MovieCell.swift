//
//  MovieCell.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var data = Data()

    func configure(data: Movie) {
        title.text = data.Title
        year.text = data.Year
        
        DispatchQueue.global().async {
            do {
                self.data = try Data(contentsOf: URL(string: data.Poster!)!)
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: self.data)
                }
            } catch {
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(systemName: "photo.fill")
                }
            }
          
        }
        
    }
}
