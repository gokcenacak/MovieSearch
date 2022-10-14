//
//  ViewController.swift
//  MoviesSearch
//
//  Created by Gökçe Nur Erer on 14.10.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: HomeViewModel!
    var selectedMovieId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(delegate: self)
        movieTableView.dataSource = self
        movieTableView.delegate = self
        searchBar.delegate = self
        setSearchBarColor(color: UIColor.gray)
        viewModel.fetchMovies(searchString: "")

       
    }
    
    func setSearchBarColor(color: UIColor) {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            textfield.backgroundColor = color
            textfield.textColor = .white
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])

            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }

        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            print(searchText)
            viewModel.fetchMovies(searchString: searchText)
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func fetchMoviesOnSuccess(movieList: [Movie]) {
        movieTableView.reloadData()
    }
    
    func fetchMoviesOnError(error: Error) {
      
    }
    
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = viewModel.movieList?[indexPath.row]
        cell.configure(data: movie!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovieId = viewModel.movieList?[indexPath.row].imdbID ?? ""
        performSegue(withIdentifier: "showDetailVC", sender: nil)
    }
    
    
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailVC" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.viewModel.selectedMovieId = selectedMovieId
        }
    }
}
