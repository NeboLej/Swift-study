import Foundation

enum GetResult {
    case success(data: [DataModel])
    case failure(error: Error)
}


class NetworkManager {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    
    func getReqest(complition: @escaping (GetResult)->Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        //Мы используем список захвата для того, чтобы избежать reference-cycle или/и крэшей.
        //[weak self] - создаем слабую ссылку на self, тем самым избежали reference-cycle/crash.
        //Далее создаем strongSelf - сильную ссылку на self внутри блока, благодаря чему гарантируем, что блок выполнится до конца, так как инстанс класса не сможет обнулиться, а так же избегаем проблем с опционалами. Так как мы создали ссылку внутри блока (let strongSelf = self), то эта ссылка обнулится при завершении блока.
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: GetResult
            
            //блок defer сробатывает при любом ретерне
            defer {
                complition(result)
            }
            
            guard let strongSelf = self else {
                result = .success(data: []) //можно тут вернкуть ошибку
                return
            }
            if error == nil, let parsData = data {
                guard let arrayData = try?
                        strongSelf.decoder.decode([DataModel].self, from: parsData) else {
                            result = .failure(error: error!)
                            return
                        }
                result = .success(data: arrayData)
            } else {
                result = .failure(error: error!)
            }
        }.resume()
    }
    
}
