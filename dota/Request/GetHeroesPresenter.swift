import Foundation.NSURLSession
import ObjectMapper

protocol GetHeroesPresenterProtocol: class {
    func getHeroes(didFinishedWithSuccess heroes: [Hero])
    func getHeroes(didFinishedWithError error: Error)
}

class GetHeroesPresenter {
    weak var delegate: GetHeroesPresenterProtocol?
    
    func getHeros() {
        let url = URL(string: "https://api.opendota.com/api/heroes")!
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler ).resume()
        
    }
    
    private func completionHandler(_ data: Data?, _ response: URLResponse?, error: Error?) {
            if let UnwrappedError = error {
                self.delegate?.getHeroes(didFinishedWithError: UnwrappedError)
                return
            }
            if let unwrappedData = data {
                let heroes = try! JSONDecoder().decode([Hero].self, from: unwrappedData)
                
                //let text = String(data: unwrappedData, encoding: String.Encoding.utf8)!
                self.delegate?.getHeroes(didFinishedWithSuccess: heroes)
                return
            }
        }
    }

