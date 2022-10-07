//
//  MainTabBarController.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import UIKit
import RealmSwift

class MainTabBarController: UITabBarController {


  let realm = try! Realm()
  var photos: Results<FavouritePhoto>!

  override func viewDidLoad() {
    super.viewDidLoad()


    let firstViewController = FirstViewController(collectionViewLayout: WaterfallLayout())
    let secondViewConroller = SecondTableViewController()

    viewControllers = [
      setUpNavigationController(title: "Фото",
                                image: UIImage(systemName: "photo.on.rectangle.angled"),
                                rootViewController: firstViewController),
      setUpNavigationController(title: "Нравиться",
                                image: UIImage(systemName: "heart.fill"),
                                rootViewController: secondViewConroller)
    ]
    self.navigationController?.tabBarItem.badgeValue = "\(photos.count)"
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }

  private func setUpNavigationController(title: String, image: UIImage?, rootViewController: UIViewController) -> UIViewController {
    let navigationViewController = UINavigationController(rootViewController: rootViewController)
    navigationViewController.tabBarItem.image = image
    navigationViewController.tabBarItem.title = title
    return navigationViewController
  }
}


