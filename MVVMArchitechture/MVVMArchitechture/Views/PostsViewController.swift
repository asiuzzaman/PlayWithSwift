// Views/PostsViewController.swift
import UIKit

class PostsViewController: UIViewController {
   // private var collectionView: UICollectionView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    private var viewModel = PostsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModel()
        viewModel.fetchPosts()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize // Enable self-sizing cells
        postCollectionView.collectionViewLayout = layout
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
    }

    private func bindViewModel() {
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.postCollectionView.reloadData()
            }
        }
    }
}

extension PostsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        let post = viewModel.posts[indexPath.row]
        cell.configure(with: post)
        cell.setRandomColor()
        return cell
    }
}
