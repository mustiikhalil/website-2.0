import TokamakShim

struct ProjectView: View {

    var project: Project?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(project?.name ?? "")")
                Text("\(project?.details ?? "")")
            }
        }
    }
}

extension Project: Identifiable {}
