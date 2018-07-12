
import Foundation.NSURLSession

func fetchHero(completion: @escaping (_ :String) -> Void) {
    let url = URL(string: "https://api.opendota.com/api/heroes")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            completion(error.debugDescription)
            return
        }
        if let unwrappedData = data {
            let text = String(data: unwrappedData, encoding: String.Encoding.utf8)!
            completion(text)
            return
            
        }
        }.resume() // เหมือนให้ URLSession run
    
    
}
