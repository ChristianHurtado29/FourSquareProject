//
//  AddToCollectionView.swift
//  FourSquareProject
//
//  Created by Amy Alsaydi on 2/28/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class AddToCollectionView: UIView {
    
    public lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Save to"
        label.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        label.layer.borderWidth = 0.8
        label.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    public lazy var collectionList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    public lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        button.layer.borderWidth = 0.8
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button
    }()
    
    public lazy var collectionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 13
        imageView.image = UIImage(systemName: "tortoise.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    public lazy var collectionNameTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.borderStyle = .line
        textField.textAlignment = .center
        textField.placeholder = "name collection"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        constrainTopLabel()
        constrainAddButton()
        constrainCV()
        constrainCollectionImage()
        constrainTextField()
        constrainBottomButton()
    }
    
    private func constrainTopLabel() {
        addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            topLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func constrainAddButton() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalTo: topLabel.heightAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    private func constrainCV() {
        addSubview(collectionList)
        collectionList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionList.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionList.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionList.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            collectionList.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65)
        ])
    }
    
    private func constrainCollectionImage() {
        addSubview(collectionImage)
        collectionImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8),
            collectionImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            collectionImage.widthAnchor.constraint(equalTo: collectionImage.heightAnchor)
        ])
    }
    private func constrainTextField() {
        addSubview(collectionNameTextField)
        collectionNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionNameTextField.topAnchor.constraint(equalTo: collectionImage.bottomAnchor, constant: 10),
            collectionNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func constrainBottomButton() {
        addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        if collectionNameTextField.isHidden {
            NSLayoutConstraint.activate([
                bottomButton.topAnchor.constraint(equalTo: collectionList.bottomAnchor),
                bottomButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                bottomButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                bottomButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                bottomButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        } else {
            NSLayoutConstraint.activate([
                bottomButton.topAnchor.constraint(equalTo: collectionNameTextField.bottomAnchor, constant: 8),
                bottomButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                bottomButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                bottomButton.bottomAnchor.constraint(equalTo: bottomAnchor),
                bottomButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    }
    
    
}
