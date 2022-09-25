import FlatBuffers
import TokamakShim

struct MainView: View {
  var body: some View {
    Text("position is, is mouse button down?")
  }
}

@main
struct CounterApp: App {
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

extension Color {
  static let background = Color(hex: 0x131415)

  init(hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xff) / 255,
      green: Double((hex >> 08) & 0xff) / 255,
      blue: Double((hex >> 00) & 0xff) / 255,
      opacity: alpha)
  }
}
