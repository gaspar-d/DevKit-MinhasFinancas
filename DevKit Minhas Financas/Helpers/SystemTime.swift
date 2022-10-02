import Foundation

class SystemTime {
	
	private let date = Date()
	private let calendar = Calendar.current
	private lazy var hours = calendar.component(.hour, from: date)
	private lazy var minutes = calendar.component(.minute, from: date)
	
	public var hour: String? {
		"\(hours):\(minutes)"
	}
}
