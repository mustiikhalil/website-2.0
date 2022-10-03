import Foundation
import TokamakShim

@main
struct Website: App {
    var body: some Scene {
        WindowGroup("MustiiKhalil's Resume") {
            DynamicHTML(
                "div",
                ["style": "width: 100%; height: 100%; background-color: #131415; text-align: center;"])
            {
                MainView()
            }
            .scaledToFill()
        }
    }
}
