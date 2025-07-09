import Foundation

class PindeepClient {
    let apiKey: String
    let baseUrl: String

    init(apiKey: String, baseUrl: String = "https://pindeep.link/api") {
        self.apiKey = apiKey
        self.baseUrl = baseUrl.hasSuffix("/") ? baseUrl : baseUrl + "/"
    }

    func createLink(data: [String: Any], completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: baseUrl + "create.php") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(apiKey, forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: data)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error { completion(.failure(error)); return }
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let shortLink = json["short_link"] as? String
            else {
                completion(.failure(NSError(domain: "InvalidResponse", code: 0)))
                return
            }
            completion(.success(shortLink))
        }.resume()
    }

    func getStats(code: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: baseUrl + "stats.php?code=" + code) else { return }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-API-KEY")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error { completion(.failure(error)); return }
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            else {
                completion(.failure(NSError(domain: "InvalidResponse", code: 0)))
                return
            }
            completion(.success(json))
        }.resume()
    }
}