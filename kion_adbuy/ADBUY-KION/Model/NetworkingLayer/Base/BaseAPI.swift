import Foundation
import Alamofire

class BaseApi<T:TargetType> {
    // router take any func conform to target type (sign in , sign up etc.. ) and return result with a instance from global error or instance conform to codable
    
    func Router <M: Decodable>(target:T, decoded:M.Type , completion: @escaping (Result<M,GlobalError>) -> Void) {
        // build parameter or headers depends on which task cam from target type for ex sign in it's need req with parameter only
        
        let para_Headers = buildParametersAndHeaders(task: target.task)
        
        let parameter = para_Headers.0
        let encoding = para_Headers.1
        let headers = para_Headers.2
        let url = "\(target.baseURL)\(target.path)"
        let method = target.method
        
        // alamofire request :)
        AF.request(url, method: method, parameters: parameter, encoding: encoding, headers: headers).response { (JsonRes) in
                        
            guard let response = JsonRes.response else {
                let error = GlobalError(domain: target.baseURL, code: 100,
                                        userInfo: [NSLocalizedDescriptionKey: NetworkError.networkError ])
                completion(.failure(error))
                return
            }
            // here we get a network status code
            let responseStatusCode = self.handleNetworkResponse(response.statusCode)
            // her we loop in status code
            switch responseStatusCode {
            case .success:
                // case success decode
                self.checkValidDecode(decoded: decoded.self, jsonData: JsonRes) { (result) in
                    switch result {
                    case .success(let decoded):
                        completion(.success(decoded))
                        print(decoded)
                    case .failure(let error ):
                        completion(.failure(error))
                        return
                    }
                }
            case .failure(let error):
                // case faliure send the reason releated to status code
                completion(.failure(GlobalError.createInstance(code: 1002,userInfo: error)))
            }
        }
    }
    // there are many of cases in task here (we create parameter and headers)
    func buildParametersAndHeaders(task:Task) -> (Parameters?, ParameterEncoding,HTTPHeaders?) {
        switch task {
        case .requestWithParameter(let para, let enocding):
            return (para,enocding,nil)
            
        case .requestWithParameterAndHeaders(let para, let enocding, let headers):
            return (para,enocding,headers)
            
        case .request:
            return (nil,URLEncoding.default,nil)
            
        case .reauthenticate(let header):
            return (nil,URLEncoding.default,header)
        }
    }
    // every thing depend on this func the status response from http request not from api result handled here return completion which have every case in network
    fileprivate func handleNetworkResponse(_ response: Int) -> StatusResult<String> {
        switch response {
        case 200...299: return .success
        case 401...500: return .failure(NetworkError.auth)
        case 501...599: return .failure(NetworkError.badRequest)
        case 600 : return .failure(NetworkError.badRequest)
        default: return .failure(NetworkError.networkError)
        }
    }
    
    // check valid decode take a type will decode to and take json format  we need to decrypt  and return completion with 3 (success , 1002 mean no data receive from api , 1003 mean can't decode)
    
    fileprivate func checkValidDecode<M:Decodable> (decoded: M.Type, jsonData: AFDataResponse<Data?> ,compeltion: (Result<M, GlobalError>)->()) {
            switch jsonData.result {
            case .success(let data):
                
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let crypted = try decoder.decode(decoded.self, from: data)
                    
                    compeltion(.success(crypted))
                }catch {
                    compeltion(.failure(GlobalError.createInstance(code: 1003,userInfo: error.localizedDescription)))
                    return
                }
                
            case .failure(let error):
                compeltion(.failure(GlobalError.createInstance(code: 1002,userInfo: error.localizedDescription)))
        }
    }
}
