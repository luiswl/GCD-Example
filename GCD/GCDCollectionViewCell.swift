//
//  GCDCollectionViewCell.swift
//  GCD
//
//  Created by Luis Enrique Vazquez Escobar on 23/03/23.
//

import Foundation
import UIKit

class GCDCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
