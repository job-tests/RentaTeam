//
//  PhotoTableViewCell.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import UIKit
import SDWebImage
import SnapKit

class PhotoTableViewCell: UITableViewCell {

  static let reuseID = "Cell"

  let photoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 154/255, alpha: 100)

    return imageView
  }()

  let userNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Apple SD Gothic Neo", size: 17)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 154/255, alpha: 100)

    return label
  }()

  var photo: FavouritePhoto!{
    didSet {
      guard let photoURL = URL(string: photo.photoUrl) else {return}
      photoImageView.sd_setImage(with: photoURL, completed: nil)
      userNameLabel.text = "Создатель: \(photo.userName)"
    }
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    photoImageView.image = nil
  }

  private func setUpImageView() {
    addSubview(photoImageView)
    photoImageView.snp.makeConstraints { make in
      make.left.equalTo(self.contentView).offset(16)
      make.top.equalTo(self.contentView).offset(5)
      make.bottom.bottom.equalTo(self.contentView).inset(-5)
      make.width.height.equalTo(50)
    }
  }

  private func setUpLabel() {
    addSubview(userNameLabel)
    userNameLabel.snp.makeConstraints { make in
      make.width.equalTo(250)
      make.left.equalTo(photoImageView.snp_rightMargin).offset(20)
      make.top.equalTo(self.contentView)
      make.bottom.equalTo(self.contentView)
    }
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpImageView()
    setUpLabel()
    self.backgroundColor =   UIColor(red: 255/255, green: 245/255, blue: 154/255, alpha: 100)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
