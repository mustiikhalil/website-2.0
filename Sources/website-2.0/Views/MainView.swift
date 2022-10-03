import Foundation
import FlatBuffers
import TokamakShim
import WebFoundation

struct MainView: View {

    @State var about: About?
    @State var projects: Projects?

    var body: some View {
        var objects: [Project] = []
        for index in 0 ..< (projects?.dataCount ?? 0) {
            if let project = projects?.data(at: index) {
                objects.append(project)
            }
        }
        return VStack {
            HeaderView()
            AboutMeView(about: about)
            List(objects.lazy.reversed()) { project in
                ProjectView(project: project)
            }
        }
        .onAppear {
            getAbout()
            getProjects()
        }
    }

    private func getAbout() {
        Task {
            let session = URLSession.shared
            let (data, response) = try await session.data(
                for: URLRequest(
                    url: URL(
                        string: "https://infinite-cove.herokuapp.com/api/v1/about")!))
            if let response = response as? HTTPURLResponse, response.statusCode >= 400 {
                return
            }
            do {
                var byteBuffer = ByteBuffer(
                    bytes: data.map { $0 })
                self.about = try getCheckedRoot(byteBuffer: &byteBuffer)
            } catch {
                print(error)
            }
        }
    }

    private func getProjects() {
        Task {
            let session = URLSession.shared
            let (data, response) = try await session.data(
                for: URLRequest(
                    url: URL(
                        string: "https://infinite-cove.herokuapp.com/api/v1/projects")!))
            if let response = response as? HTTPURLResponse, response.statusCode >= 400 {
                return
            }
            do {
                var byteBuffer = ByteBuffer(
                    bytes: data.map { $0 })
                self.projects = try getCheckedRoot(byteBuffer: &byteBuffer)
            } catch {
                print(error)
            }
        }
    }
}
