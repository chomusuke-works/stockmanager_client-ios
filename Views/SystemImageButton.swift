import SwiftUI

struct SystemImageButton: View {
	let color: Color
	let systemImage: String
	let action: () -> Void
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 16, style: .circular)
				.frame(width: 64, height: 64)
				.foregroundStyle(color)
			
			Image(systemName: systemImage)
				.fontWeight(.bold)
				.foregroundStyle(.white)
				.font(.title)
		}
		.onTapGesture(perform: action)
	}
}

#Preview {
	HStack {
		SystemImageButton(color: .green, systemImage: "plus") { }
		SystemImageButton(color: .blue, systemImage: "cart") { }
		SystemImageButton(color: .orange, systemImage: "trash") { }
	}
}
