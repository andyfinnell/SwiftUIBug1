# UIViewRepresentable doesn't respect intrinsicContentSize invalidation

I have a custom UIView that displays multiple lines of text and I'm attempting to wrap in a UIViewRepresentable for SwiftUI. The problem occurs if I let the width of the custom UIView conform to it's parent width (e.g. a scroll view). If the width is smaller than a line of text, the UIView will perform line breaks and make the UIView taller. It invalidates its intrinsicContentSize when it does. However, SwiftUI ignores this, and clips the UIView to the width of its parent and the non-line-breaked height.

I've been able to reproduce the issue using a stock UILabel wrapped by a UIViewRepresentable:

```Swift
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
```

Then my SwiftUI view:

```Swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            Label(blobOfText)
        }
    }
}
```

`blobOfText` is a multiline string with lines long enough they will wrap even on wide screen phones. 

In debugging this, I can see SwiftUI polling the `intrinsicContentSize` of my `UIView` multiple times before setting the `frame`. However, if the `didSet` on the `frame` property invalidates the intrinsicContentSize, it's never re-checked.

Is this a bug, or am I missing something?
