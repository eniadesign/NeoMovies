//
//  LoginInteractor.swift
//  NeoMovies
//
//  Created by ALFONSO on 17/06/22.
//

import Foundation

class LoginInteractor {
    var presenter: LoginPresenterProtocol?
    var endP = Path()
}

extension LoginInteractor: LoginInteractorProtocol {
 
    
    func nextScreen() {
      
    }
    
    func logueo(u: String, p: String) {
        let usuario = u.base64Encoded()
        let passcode = p.base64Encoded()
        let url = URL(string: "\(endP.login)?username=\(usuario ?? "")&password=\(passcode ?? "")")
            let session = URLSession.shared

        let request = NSMutableURLRequest(url: url! as URL)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request as URLRequest) {
                (
                data, response, error) in

                guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                    print("error")
                    return
                }

                if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                {
                    print(dataString)
                    if dataString == "\"0\""{
                        DispatchQueue.main.async {
                            self.presenter?.showError()
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.presenter?.nextScreen()
                        }
                    }
                }
            }
        task.resume()
        
           
        
        
    }
    
   

}

extension String {

    func base64Encoded() -> String? {
        data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

