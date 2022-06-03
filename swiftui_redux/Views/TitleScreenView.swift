import SwiftUI

struct TitleScreenView: View {
    @EnvironmentObject var store: ThreeDucksStore
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Spacer()
            
            Image("title").resizable().aspectRatio(contentMode: .fit)
            Button("New Game") {
                withAnimation {
                    store.dispatch(.startGame)
                }
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(.purple)
            .cornerRadius(40)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 16) {
                ForEach(DifficultyLevel.allCases) { level in
                    Button {
                        
                    } label: {
                        Label(level.rawValue, systemImage: "rectangle.portrait")
                    }
                    .foregroundColor(level.color)
                    .padding()
                }
            }
        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
