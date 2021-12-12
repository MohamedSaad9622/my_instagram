//
//  ProfileViewController.swift
//  MyInstagram
//
//  Created by MAC on 22/11/2021.
//

import UIKit


class ProfileViewController: UIViewController {

        private var collectionView : UICollectionView?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureNavigationBar()
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView?.delegate = self
            collectionView?.dataSource = self
            guard let collectionView = collectionView else {
                return
            }
        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            collectionView?.frame = view.bounds
        }
        func configureNavigationBar() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingsButton))
        }
        
        @objc func didTapSettingsButton() {
            let vc = SettingViewController()
            vc.title = "Settings"
            navigationController?.pushViewController(vc, animated: true)
        }

    }

    //MARK: - Collection view Delegate & DataSource

    extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    //        collectionView.backgroundColor = UIColor.red
    //        return collection
            return UICollectionViewCell()
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
        }
        
    }
