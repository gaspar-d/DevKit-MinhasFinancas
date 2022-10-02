import UIKit

final class DefaultProgressBar: UIProgressView {
	
	init(withProgress progress: Float = 0.5) {
		super.init(frame: .zero)
		createProgressBar(progress: progress)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createProgressBar(progress: Float) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.progressTintColor = .ColorAssets.customBlueLine
		self.progress = progress
	}
}
