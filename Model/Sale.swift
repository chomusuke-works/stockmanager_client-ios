import Foundation

struct Sale: Encodable {
	let timestamp: Int64
	let productCode: Int64
	let sold: Int32
	let thrown: Int32
}
