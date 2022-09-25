import FlatBuffers
import Foundation
import TokamakShim
import WebFoundation

struct Project: Identifiable {
  let id: Int
}

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

struct AboutMeView: View {

  var body: some View {
    HStack {
      VStack {
        Text("Name Surname")
          .font(.largeTitle)
        Text("Project description and how the project worked and explanation")
          .font(.title)
      }
    }
    .padding(.top, 40)
  }

}

struct ProjectView: View {

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Project name")
        Text("Project description and how the project worked and explanation")
      }
    }
  }

}

struct Store {

  func get() {
    Task {
        let session = URLSession.shared
        let (data, response) = try await session.data(
          for: URLRequest(
            url: URL(
              string: "https://infinite-cove.herokuapp.com/api/v1/about")!))
      print("data: ", data)
      let array: [UInt8] = data.map { $0 }
      print("array: \(array)")
    }
  }
}

struct MainView: View {
  let store = Store()

  var data: [Project] = [
    Project(id: 1),
    Project(id: 2),
    Project(id: 3),
    Project(id: 4),
    Project(id: 5)
  ]
  var body: some View {
    VStack {
      HeaderView()
      AboutMeView()
      List(data) { _ in
        ProjectView()
      }
    }
    .onAppear {
      store.get()
    }
  }
}

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
