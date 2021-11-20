
import Foundation
import SwiftUI

let colorPool: [String: Color] = [
    "green": Color.green,
    "blue": Color.blue,
    "yellow": Color.yellow,
    "orange": Color.orange,
    "red": Color.red
]

extension UIScreen{
    static let screenSize = UIScreen.main.bounds.size
}

func validateColor(username: String, color:Color, guess:String) -> Bool {
    if (colorPool[guess] == color){
        score(username: username)
        return true
    }
    return false
}

func randomColor() -> Color{
    return colorPool.randomElement()!.value
}

func score(username: String) {
    guard let url = URL(string: "https://7c2bad50.us-south.apigw.appdomain.cloud/api/placar") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String:String] = ["usuario": username]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        }
        catch {
            print("ERROR: \(error)")
        }
    }
    task.resume()
}
