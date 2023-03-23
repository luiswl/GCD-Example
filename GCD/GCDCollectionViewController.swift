//
//  GCDCollectionViewController.swift
//  GCD
//
//  Created by Luis Enrique Vazquez Escobar on 23/03/23.
//

import UIKit

class GCDCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let imageUrls = [
    "https://dummyimage.com/4400x4400/4f4f4f/ffffff.png",
    "https://dummyimage.com/4400x4400/4f4f4f/ffffff.png",
    "https://dummyimage.com/4400x4400/4f4f4f/ffffff.png",
    "https://dummyimage.com/4400x4400/4f4f4f/ffffff.png",
    "https://dummyimage.com/4400x4400/4f4f4f/ffffff.png",
    ]

    var images: [UIImage?] = []

    let reuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "GCDCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        images = [UIImage?](repeating: nil, count: imageUrls.count)
        downloadImages()
    }

    // Descargar las imágenes de forma asíncrona
    func downloadImages() {
        for (index, url) in imageUrls.enumerated() {
            DispatchQueue.global(qos: .background).async {
                if let imageUrl = URL(string: url), let imageData = try? Data(contentsOf: imageUrl) {
                    self.images[index] = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        let index = [IndexPath(item: index, section: 0)]
                        self.collectionView.reloadItems(at: index)
                    }
                }
            }
        }
    }

    // Update de celda
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell: GCDCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GCDCollectionViewCell

        if let image = images[indexPath.row] {
            cell.image?.image = image
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = .red
        }
        return cell
    }

    // Configuración del Collection View
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    //Tamaño de celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

}

