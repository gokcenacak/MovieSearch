//
//  DetailViewController.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModel! = DetailViewModel()
    var data = Data()

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var text5: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchMovieDetail()
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func fetchDetailsOnSuccess(movieDetail: MovieDetail) {
        text1.text = movieDetail.Title
        text2.text = movieDetail.Year
        text3.text = movieDetail.Actors
        text4.text = movieDetail.imdbRating
        text5.text = movieDetail.Director
        
        DispatchQueue.global().async {
            do {
                self.data = try Data(contentsOf: URL(string: movieDetail.Poster!)!)
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
    
    func fetchDetailsOnError(error: Error) {
        //
    }
    
}
