import SwiftUI

struct login: View {
    @State var userName: String = "";
    @State var color: Color = randomColor();
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Color Quiz!")
                    .padding()
                    .font(.largeTitle.bold())
                    .foregroundColor(color)
                Spacer()
                Text("Pick a username")
                    .frame(width: UIScreen.screenSize.width * 0.8 + 20,
                           height: 20,
                           alignment: .leading)
                TextField("username", text: $userName )
                    .frame(width: (UIScreen.screenSize.width * 0.8),
                           height: 40,
                           alignment: .center)
                    .padding(10)
                Spacer()
                
                if(userName != ""){
                    NavigationLink(destination: ContentView(userName: self.userName, color: .green)) {
                        Text("START").foregroundColor(color)
                    }
                }
                
            }
        }
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
