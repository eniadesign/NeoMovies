//
//  ExtensionImage.swift
//  NeoMovies
//
//  Created by ALFONSO on 18/06/22.
//

import UIKit

extension UIImageView {
        func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }


extension UIImage
{
   func resizedImage(Size sizeImage: CGSize) -> UIImage?
   {
       let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
       UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
       self.draw(in: frame)
       let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       self.withRenderingMode(.alwaysOriginal)
       return resizedImage
   }
}
