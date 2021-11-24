import SwiftUI



struct ContentView: View {
    @State var userName: String;
    @State var color: Color;
    @State var guess: String = "";
    @State var showingAlert = false;
    @State var answer: String = "";
    var body: some View {
        VStack{
            Spacer()
                .alert(answer, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
            
            RoundedRectangle(cornerRadius: 30)
                .fill(color)
                .frame(width: UIScreen.screenSize.width * 0.8 + 20,
                       height: UIScreen.screenSize.height * 0.2,
                       alignment: .leading)
            
            
            Text("What color do you see?")
                .frame(width: UIScreen.screenSize.width * 0.8 + 20,
                       height: 20,
                       alignment: .leading)
            TextField("color", text: $guess )
                .frame(width: (UIScreen.screenSize.width * 0.8),
                       height: 40,
                       alignment: .center)
                .padding(10)
            
            Spacer()
            if(guess != ""){
                Button(action: {
                    if (validateColor(username: userName, color: color, guess: guess)){
                        answer = "Correct"
                    } else {
                        answer = "Wrong"
                    }
                    showingAlert = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showingAlert = false
                        guess = ""
                        color = randomColor();
                    }
                }) {
                    Text("Try it!")
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userName: "teste", color: .blue)
    }
}
