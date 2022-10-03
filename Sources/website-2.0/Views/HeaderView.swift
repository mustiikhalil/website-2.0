import TokamakShim

struct HeaderView: View {
    var body: some View {
        DynamicHTML(
            "div",
            ["style": "width: 100%; max-height: 10rem; background-color: #9A56A2; text-align: center; position: fixed;"])
        {
            Text("Build with Flatbuffers & SwiftWasm <3")
        }
    }
}

