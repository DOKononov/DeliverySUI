//
//  RemoteImage.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 10.01.24.
//

import SwiftUI

fileprivate final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        NerworkService.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


fileprivate struct RemoteImage: View {
    var image: Image?
        
    var body: some View {
        if let image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image("food-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
    }
}

struct ProductRemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(from: urlString)
            }
    }
}

struct ProductRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductRemoteImage(urlString: "")
    }
}
