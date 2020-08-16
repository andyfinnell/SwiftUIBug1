import SwiftUI

private let blobOfText = """
# My Document

**Hello**, _World_!

This is the _beginning_ of the document. It's
a paragraph, because reasons. It's not yet the
**end** of the document, but maybe only of the
paragraph.

## Subheading 1

The heading above this is smaller for the following reasons:

1. Because
1. I
1. Want
1. To

Those reasons should not be confused with these other reasons:

* What

* Huh

* Come again

### Headings get smaller with time

And now for something completely different.

 ---

> This is the place for the best quotes I can think of.
> Which is apparently nothing.
>
> \\- me, just now

Let's write some `code` since that's what's next on the list.

```Swift
let shouldI = shouldDoTheThing()

if shouldI {
    doTheThing()
}
```

#### Out of ideas

Here's a tiny kitten: ![Tiny kitten](https://placekitten.com/g/20/20). It can be
found at [placekitten.com](https://placekitten.com/).\\
This is a hard break.
"""

struct ContentView: View {
    var body: some View {
        ScrollView {
            Label(blobOfText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
