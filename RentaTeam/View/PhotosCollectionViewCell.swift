//
//  PhotosCollectionViewCell.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import SDWebImage
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {


  static let reuseID = "PhotoItem"

  var photo: PhotoData! {
    didSet {
      let photoUrl = photo.urls["regular"]
      guard let imageURL = photoUrl, let url = URL(string: imageURL) else { return }
      imageView.sd_setImage(with: url, completed: nil)
    }
  }

  let imageView: UIImageView = {
    let photo = UIImageView()
    photo.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 154/255, alpha: 100)
    photo.translatesAutoresizingMaskIntoConstraints = false
    photo.backgroundColor = UIColor(red: 255 / 255, green: 249 / 255, blue: 249 / 255, alpha: 1.0)
    photo.contentMode = .scaleToFill
    return photo
  }()
  
  private func setUpImageView() {
    addSubview(imageView)
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpImageView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
