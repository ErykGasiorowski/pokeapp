//
//  PokeListViewCell.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import UIKit
import Kingfisher
import SnapKit
import RxSwift
import RxCocoa

class PokeListViewCell: UITableViewCell {
    
    var disposeBag = DisposeBag()
    
    let button = UIButton()
    
    private let pokeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 9
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let pokeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let pokeTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.clipsToBounds = true
        //accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    override func prepareForReuse() {
        pokeImage.image = nil
        pokeNameLabel.text = nil
        pokeTypeLabel.text = nil
        disposeBag = DisposeBag()
    }
    
    func configure(model: PokeDetails) {
        pokeImage.kf.setImage(with: URL(string: model.sprites.frontDefault ?? ""))
        pokeNameLabel.text = model.name
        pokeTypeLabel.text = "Pokemon of type \(model.types.first?.type)"
    }

    func setupView() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 6
        contentView.addSubview(pokeImage)
        contentView.addSubview(pokeNameLabel)
        contentView.addSubview(pokeTypeLabel)
        contentView.addSubview(button)

        pokeImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.width.equalTo(pokeImage.snp.height)
            //$0.height.equalTo(50)
            $0.centerY.equalTo(contentView.snp.centerY)
        }

        pokeNameLabel.snp.makeConstraints{
            $0.top.equalTo(pokeImage.snp.top)
            $0.leading.equalTo(pokeImage.snp.trailing).offset(20)
            $0.bottom.equalTo(pokeImage.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailing)
        }

        pokeTypeLabel.snp.makeConstraints{
            $0.leading.equalTo(pokeImage.snp.trailing).offset(20)
            $0.bottom.equalTo(pokeImage.snp.bottom)
        }

        button.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
    }
}

