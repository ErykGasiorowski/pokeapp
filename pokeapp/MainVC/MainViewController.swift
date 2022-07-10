//
//  ViewController.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var viewModel: MainVCViewModel!
    let disposeBag = DisposeBag()
    let searchResultsTableView: UITableView = UITableView()
    
    let searchController: UISearchController = {
        let vc = UISearchController()
        vc.searchBar.placeholder = "Search for your favorite pokemon"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        
        vc.searchBar.tintColor = .systemGray
        
        return vc
    }()

    
    let pokemonsTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "My Pokemons"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always
        
        setupBehavior()
        viewModel.fetchData()
        viewModel.getDataForTableViewCell()
        setupLayout()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        //viewModel.query = searchBar.text!
    }
    
    func setupBehavior() {
        
        viewModel.reloadData.bind { [weak self] in
            guard let self = self else { return }
            self.searchResultsTableView.reloadData()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    func setupLayout() {
        
        view.addSubview(pokemonsTitleLabel)
        view.addSubview(searchResultsTableView)
        searchResultsTableView.register(PokeListViewCell.self, forCellReuseIdentifier: String(describing: PokeListViewCell.self))
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultsTableView.delegate = viewModel
        searchResultsTableView.dataSource = viewModel
        searchResultsTableView.backgroundColor = .white
        searchResultsTableView.rowHeight = 75
        
        var frame = CGRect.zero
        
        searchResultsTableView.frame.size.height = .leastNormalMagnitude
        searchResultsTableView.tableHeaderView = UIView(frame: frame)
        searchResultsTableView.tableFooterView = UIView(frame: frame)
        searchResultsTableView.separatorStyle = .none
        
        pokemonsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(140)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.centerX.equalToSuperview()
        }
        
        searchResultsTableView.snp.makeConstraints {
            $0.top.equalTo(pokemonsTitleLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}


