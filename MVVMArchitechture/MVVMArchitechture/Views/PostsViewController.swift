// Views/PostsViewController.swift
import UIKit

class PostsViewController: UIViewController {
    private var collectionView: UICollectionView!
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
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 100)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }

    private func bindViewModel() {
        viewModel.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
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
        return cell
    }
}
