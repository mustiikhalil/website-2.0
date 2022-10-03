import TokamakShim

struct AboutMeView: View {

    let about: About?

    var body: some View {
        HStack {
            VStack {
                Text("\(about?.name ?? "")")
                    .font(.largeTitle)
                Text("\(about?.description ?? "")")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    ._domTextSanitizer(Sanitizers.HTML.insecure)
            }
        }
        .padding(.top, 40)
    }

}
