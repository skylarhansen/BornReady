//
//  RoomCollectionViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomImageView: UIImageView!
    
    func updateWith(image: UIImage) {
        roomImageView.image = image
    }
}
