enum JSONError: Error {
	case invalidData
}

enum HTTPError: Error {
	case serverError
	case badInput
	case notFound
	case unknown
}
