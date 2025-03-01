import SwiftUI

struct ContentView: View {
	private let maxItemCount: Int32 = 99
	private let minItemCount: Int32 = 0
	
	@State private var itemCount: Int32 = 0
	@State private var isThrown: Bool = false
	
    var body: some View {
		VStack {
			Spacer()
			
			Toggle(isOn: $isThrown) {
				Text("Déchets")
			}
			
			HStack {
				Text("\(itemCount)")
					.font(.title)
				
				Spacer()
				
				SystemImageButton(color: .gray, systemImage: "minus") {
					addToItemCount(-1)
				}
				SystemImageButton(color: .gray, systemImage: "plus") {
					addToItemCount(+1)
				}
				
				if (isThrown) {
					SystemImageButton(color: .orange, systemImage: "trash") {
						addSampleTransaction(quantity: itemCount, .thrown)
					}
				} else {
					SystemImageButton(color: .blue, systemImage: "cart") {
						addSampleTransaction(quantity: itemCount, .sold)
					}
				}
			}
		}
        .padding()
    }
	
	private func addToItemCount(_ value: Int32) {
		guard minItemCount...maxItemCount ~= itemCount + value else {
			return
		}
		
		itemCount += value;
	}
}

enum TransactionType {
	case sold
	case thrown
}

func addSampleTransaction(quantity: Int32, _ transactionType: TransactionType) {
	let now = Int64(Date.now.timeIntervalSince1970 * 1_000)
	let productCode: Int64 = 3415900030427
	
	var sold: Int32 = 0
	var thrown: Int32 = 0
	switch (transactionType) {
		case .sold: sold = quantity
		case .thrown: thrown = quantity
	}
	
	Task {
		do {
			try await sendSale(sale: Sale(timestamp: now, productCode: productCode, sold: sold, thrown: thrown))
		} catch {
			print("An error occured when trying to sell the product")
		}
	}
}

#Preview {
    ContentView()
}
