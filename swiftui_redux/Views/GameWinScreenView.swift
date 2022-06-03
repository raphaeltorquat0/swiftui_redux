import SwiftUI

struct GameWinScreenView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Spacer()
            Text("Well Done!")
                .font(.title)
                .foregroundColor(.white)
            
            Image("duckes")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button("Go Again") {
                
            }
            .font(.headline)
            .foregroundColor(.purple)
            .padding()
            .background(.white)
            .cornerRadius(40)
            
            Spacer()
        }
        .background(.purple)
    }
}

struct GameWinScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GameWinScreenView()
    }
}
