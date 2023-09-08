//
//  ViewController.swift
//  Generic API Layer
//
//  Created by AKASH on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    let netWorkService: NetworkService = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ImagePickerManager.shared.pickImage(on: self, withOption: [.photos]) { image in
            self.upload(data: image.jpegData(compressionQuality: 0.5) ?? Data())
        }
    }
    
    @MainActor
    func upload(data: Data) {
        Task {
            do {
                let model = try await netWorkService.uploadMedia(model: PostMediaModel(source: data))
                print(model)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

