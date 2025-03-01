import Foundation

func sendSale(sale: Sale) async throws {
	let endpoint: String = "http://localhost/api/sales"
	guard let url = URL(string: endpoint) else {
		throw URLError(.badURL)
	}
	
	var saleRequest = URLRequest(url: url);
	saleRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
	saleRequest.httpMethod = "POST"
	
	do {
		saleRequest.httpBody = try JSONEncoder().encode(sale)
	} catch {
		throw JSONError.invalidData
	}
	
	let task = URLSession.shared.dataTask(with: saleRequest) { data, response, error in
		guard let response = response as? HTTPURLResponse else {
			print("bad response")
			
			return
		}
		
		let codeOK: Int = 201
		
		guard response.statusCode == codeOK else {
			print("expected code \(codeOK) but got \(response.statusCode)")
			
			return
		}
	}
	
	task.resume()
}
