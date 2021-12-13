//
//  KingFisherHandler.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

//import Kingfisher
//
//class KingFisherHelper {
//    static let shared = KingFisherHelper()
//
//    private init() {}
//
//    func downloadImage(with urlString : String , imageCompletionHandler: @escaping (UIImage?) -> Void){
//        guard let url = URL.init(string: urlString) else {
//            return  imageCompletionHandler(nil)
//        }
//        let resource = ImageResource(downloadURL: url)
//
//        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
//            switch result {
//            case .success(let value):
//                imageCompletionHandler(value.image)
//            case .failure:
//                imageCompletionHandler(nil)
//            }
//        }
//    }
//}
