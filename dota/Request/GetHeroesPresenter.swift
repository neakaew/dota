
import Foundation.NSURLSession
import ObjectMapper
import Alamofire

protocol GetHeroesPresenterProtocol: class {
    func getHeroes(didFinishedWithSuccess heroes: [Hero])
    func getHeroes(didFinishedWithError error: Error)
}

class GetHeroesPresenter {
    weak var delegate: GetHeroesPresenterProtocol?
    let url =  URL(string: "https://api.opendota.com/api/heroes")!
    
    func getHeros() {
        Alamofire.request(url).response(completionHandler:self.completionHandler).resume()
    }
    
    private func completionHandler(response: DefaultDataResponse) {
        if let error = response.error {
            self.delegate?.getHeroes(didFinishedWithError: error)
            return
        }
        if let data = response.data {
            let heroes = try! JSONDecoder().decode([Hero].self, from: data)
            self.delegate?.getHeroes(didFinishedWithSuccess: heroes)
            return
        }
    }
}

