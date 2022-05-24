import Foundation

public enum SeriesMarkerPosition: String, Codable {
    case aboveBar
    case belowBar
    case inBar
    case top
    case bottom
}

// MARK: -
public enum SeriesMarkerShape: String, Codable {
    case circle
    case square
    case roundedSquare
    case arrowUp
    case arrowDown
}

// MARK: -
public enum SeriesMarkerTextPosition: String, Codable {
    case auto
    case insideMarker
}

// MARK: -
public struct SeriesMarker: Codable {
    
    public var time: Time
    public var position: SeriesMarkerPosition
    public var shape: SeriesMarkerShape
    public var color: ChartColor
    public var id: String?
    public var size: Double?
    public var text: String?
    public var textColor: ChartColor?
    public var textPosition: SeriesMarkerTextPosition?
    public var borderVisible: Bool?
    public var borderColor: ChartColor?
    public var borderWidth: Float?
    
    public init(time: Time,
                position: SeriesMarkerPosition,
                shape: SeriesMarkerShape,
                color: ChartColor,
                id: String? = nil,
                text: String? = nil,
                size: Double? = nil,
                textColor: ChartColor? = nil,
                textPosition: SeriesMarkerTextPosition? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                borderWidth: Float? = nil) {
        self.time = time
        self.position = position
        self.shape = shape
        self.color = color
        self.id = id
        self.text = text
        self.size = size
        self.textColor = textColor
        self.textPosition = textPosition
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
}
