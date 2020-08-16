import Foundation
import UIKit
import SwiftUI

struct Label: UIViewRepresentable {
    typealias UIViewType = UILabel

    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = text
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}

