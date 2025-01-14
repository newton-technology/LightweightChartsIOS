import UIKit
import LightweightCharts

class TrackingTooltipViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private let tooltipView = TooltipView(accentColor: UIColor(red: 1, green: 82/255.0, blue: 82/255.0, alpha: 1))
    private let legend = "Apple Inc."
    
    private var leadingConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        setupSubscription()
    }
    
    private func setupUI() {
        let options = ChartOptions(
            layout: LayoutOptions(backgroundColor: "#ffffff", textColor: "#333"),
            rightPriceScale: VisiblePriceScaleOptions(
                scaleMargins: PriceScaleMargins(top: 0.2, bottom: 0.2),
                borderVisible: false
            ),
            timeScale: TimeScaleOptions(borderVisible: false),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "#ffffff"),
                horizontalLines: GridLineOptions(color: "#eee")
            )
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        self.chart = chart
        
        view.addSubview(tooltipView)
        
        tooltipView.translatesAutoresizingMaskIntoConstraints = false
        leadingConstraint = tooltipView.leadingAnchor.constraint(equalTo: chart.leadingAnchor)
        bottomConstraint = tooltipView.bottomAnchor.constraint(equalTo: chart.topAnchor)
        leadingConstraint.isActive = true
        bottomConstraint.isActive = true
        
        tooltipView.isHidden = true
        
        view.bringSubviewToFront(tooltipView)
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(255, 82, 82, 0.56)",
            bottomColor: "rgba(255, 82, 82, 0.04)",
            lineColor: "rgba(255, 82, 82, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            SingleValueData(time: .string("2016-07-18"), value: 98.66),
            SingleValueData(time: .string("2016-07-25"), value: 104.21),
            SingleValueData(time: .string("2016-08-01"), value: 107.48),
            SingleValueData(time: .string("2016-08-08"), value: 108.18),
            SingleValueData(time: .string("2016-08-15"), value: 109.36),
            SingleValueData(time: .string("2016-08-22"), value: 106.94),
            SingleValueData(time: .string("2016-08-29"), value: 107.73),
            SingleValueData(time: .string("2016-09-05"), value: 103.13),
            SingleValueData(time: .string("2016-09-12"), value: 114.92),
            SingleValueData(time: .string("2016-09-19"), value: 112.71),
            SingleValueData(time: .string("2016-09-26"), value: 113.05),
            SingleValueData(time: .string("2016-10-03"), value: 114.06),
            SingleValueData(time: .string("2016-10-10"), value: 117.63),
            SingleValueData(time: .string("2016-10-17"), value: 116.60),
            SingleValueData(time: .string("2016-10-24"), value: 113.72),
            SingleValueData(time: .string("2016-10-31"), value: 108.84),
            SingleValueData(time: .string("2016-11-07"), value: 108.43),
            SingleValueData(time: .string("2016-11-14"), value: 110.06),
            SingleValueData(time: .string("2016-11-21"), value: 111.79),
            SingleValueData(time: .string("2016-11-28"), value: 109.90),
            SingleValueData(time: .string("2016-12-05"), value: 113.95),
            SingleValueData(time: .string("2016-12-12"), value: 115.97),
            SingleValueData(time: .string("2016-12-19"), value: 116.52),
            SingleValueData(time: .string("2016-12-26"), value: 115.82),
            SingleValueData(time: .string("2017-01-02"), value: 117.91),
            SingleValueData(time: .string("2017-01-09"), value: 119.04),
            SingleValueData(time: .string("2017-01-16"), value: 120.00),
            SingleValueData(time: .string("2017-01-23"), value: 121.95),
            SingleValueData(time: .string("2017-01-30"), value: 129.08),
            SingleValueData(time: .string("2017-02-06"), value: 132.12),
            SingleValueData(time: .string("2017-02-13"), value: 135.72),
            SingleValueData(time: .string("2017-02-20"), value: 136.66),
            SingleValueData(time: .string("2017-02-27"), value: 139.78),
            SingleValueData(time: .string("2017-03-06"), value: 139.14),
            SingleValueData(time: .string("2017-03-13"), value: 139.99),
            SingleValueData(time: .string("2017-03-20"), value: 140.64),
            SingleValueData(time: .string("2017-03-27"), value: 143.66),
            SingleValueData(time: .string("2017-04-03"), value: 143.34),
            SingleValueData(time: .string("2017-04-10"), value: 141.05),
            SingleValueData(time: .string("2017-04-17"), value: 142.27),
            SingleValueData(time: .string("2017-04-24"), value: 143.65),
            SingleValueData(time: .string("2017-05-01"), value: 148.96),
            SingleValueData(time: .string("2017-05-08"), value: 156.10),
            SingleValueData(time: .string("2017-05-15"), value: 153.06),
            SingleValueData(time: .string("2017-05-22"), value: 153.61),
            SingleValueData(time: .string("2017-05-29"), value: 155.45),
            SingleValueData(time: .string("2017-06-05"), value: 148.98),
            SingleValueData(time: .string("2017-06-12"), value: 142.27),
            SingleValueData(time: .string("2017-06-19"), value: 146.28),
            SingleValueData(time: .string("2017-06-26"), value: 144.02),
            SingleValueData(time: .string("2017-07-03"), value: 144.18),
            SingleValueData(time: .string("2017-07-10"), value: 149.04),
            SingleValueData(time: .string("2017-07-17"), value: 150.27),
            SingleValueData(time: .string("2017-07-24"), value: 149.50),
            SingleValueData(time: .string("2017-07-31"), value: 156.39),
            SingleValueData(time: .string("2017-08-07"), value: 157.48),
            SingleValueData(time: .string("2017-08-14"), value: 157.50),
            SingleValueData(time: .string("2017-08-21"), value: 159.86),
            SingleValueData(time: .string("2017-08-28"), value: 164.05),
            SingleValueData(time: .string("2017-09-04"), value: 158.63),
            SingleValueData(time: .string("2017-09-11"), value: 159.88),
            SingleValueData(time: .string("2017-09-18"), value: 151.89),
            SingleValueData(time: .string("2017-09-25"), value: 154.12),
            SingleValueData(time: .string("2017-10-02"), value: 155.30),
            SingleValueData(time: .string("2017-10-09"), value: 156.99),
            SingleValueData(time: .string("2017-10-16"), value: 156.25),
            SingleValueData(time: .string("2017-10-23"), value: 163.05),
            SingleValueData(time: .string("2017-10-30"), value: 172.50),
            SingleValueData(time: .string("2017-11-06"), value: 174.67),
            SingleValueData(time: .string("2017-11-13"), value: 170.15),
            SingleValueData(time: .string("2017-11-20"), value: 174.97),
            SingleValueData(time: .string("2017-11-27"), value: 171.05),
            SingleValueData(time: .string("2017-12-04"), value: 169.37),
            SingleValueData(time: .string("2017-12-11"), value: 173.97),
            SingleValueData(time: .string("2017-12-18"), value: 175.01),
            SingleValueData(time: .string("2017-12-25"), value: 169.23),
            SingleValueData(time: .string("2018-01-01"), value: 175.00),
            SingleValueData(time: .string("2018-01-08"), value: 177.09),
            SingleValueData(time: .string("2018-01-15"), value: 178.46),
            SingleValueData(time: .string("2018-01-22"), value: 171.51),
            SingleValueData(time: .string("2018-01-29"), value: 160.50),
            SingleValueData(time: .string("2018-02-05"), value: 156.41),
            SingleValueData(time: .string("2018-02-12"), value: 172.43),
            SingleValueData(time: .string("2018-02-19"), value: 175.50),
            SingleValueData(time: .string("2018-02-26"), value: 176.21),
            SingleValueData(time: .string("2018-03-05"), value: 179.98),
            SingleValueData(time: .string("2018-03-12"), value: 178.02),
            SingleValueData(time: .string("2018-03-19"), value: 164.94),
            SingleValueData(time: .string("2018-03-26"), value: 167.78),
            SingleValueData(time: .string("2018-04-02"), value: 168.38),
            SingleValueData(time: .string("2018-04-09"), value: 174.73),
            SingleValueData(time: .string("2018-04-16"), value: 165.72),
            SingleValueData(time: .string("2018-04-23"), value: 162.32),
            SingleValueData(time: .string("2018-04-30"), value: 183.83),
            SingleValueData(time: .string("2018-05-07"), value: 188.59),
            SingleValueData(time: .string("2018-05-14"), value: 186.31),
            SingleValueData(time: .string("2018-05-21"), value: 188.58),
            SingleValueData(time: .string("2018-05-28"), value: 190.24),
            SingleValueData(time: .string("2018-06-04"), value: 191.70),
            SingleValueData(time: .string("2018-06-11"), value: 188.84),
            SingleValueData(time: .string("2018-06-18"), value: 184.92),
            SingleValueData(time: .string("2018-06-25"), value: 185.11),
            SingleValueData(time: .string("2018-07-02"), value: 187.97),
            SingleValueData(time: .string("2018-07-09"), value: 191.33),
            SingleValueData(time: .string("2018-07-16"), value: 191.44),
            SingleValueData(time: .string("2018-07-23"), value: 190.98),
            SingleValueData(time: .string("2018-07-30"), value: 207.99),
            SingleValueData(time: .string("2018-08-06"), value: 207.53),
            SingleValueData(time: .string("2018-08-13"), value: 217.58),
            SingleValueData(time: .string("2018-08-20"), value: 216.16),
            SingleValueData(time: .string("2018-08-27"), value: 227.63),
            SingleValueData(time: .string("2018-09-03"), value: 221.30),
            SingleValueData(time: .string("2018-09-10"), value: 223.84),
            SingleValueData(time: .string("2018-09-17"), value: 217.66),
            SingleValueData(time: .string("2018-09-24"), value: 225.74),
            SingleValueData(time: .string("2018-10-01"), value: 224.29),
            SingleValueData(time: .string("2018-10-08"), value: 222.11),
            SingleValueData(time: .string("2018-10-15"), value: 219.31),
            SingleValueData(time: .string("2018-10-22"), value: 216.30),
            SingleValueData(time: .string("2018-10-29"), value: 207.48),
            SingleValueData(time: .string("2018-11-05"), value: 204.47),
            SingleValueData(time: .string("2018-11-12"), value: 193.53),
            SingleValueData(time: .string("2018-11-19"), value: 172.29),
            SingleValueData(time: .string("2018-11-26"), value: 178.58),
            SingleValueData(time: .string("2018-12-03"), value: 168.49),
            SingleValueData(time: .string("2018-12-10"), value: 165.48),
            SingleValueData(time: .string("2018-12-17"), value: 150.73),
            SingleValueData(time: .string("2018-12-24"), value: 156.23),
            SingleValueData(time: .string("2018-12-31"), value: 148.26),
            SingleValueData(time: .string("2019-01-07"), value: 152.29),
            SingleValueData(time: .string("2019-01-14"), value: 156.82),
            SingleValueData(time: .string("2019-01-21"), value: 157.76),
            SingleValueData(time: .string("2019-01-28"), value: 166.52),
            SingleValueData(time: .string("2019-02-04"), value: 170.41),
            SingleValueData(time: .string("2019-02-11"), value: 170.42),
            SingleValueData(time: .string("2019-02-18"), value: 172.97),
            SingleValueData(time: .string("2019-02-25"), value: 174.97),
            SingleValueData(time: .string("2019-03-04"), value: 172.91),
            SingleValueData(time: .string("2019-03-11"), value: 186.12),
            SingleValueData(time: .string("2019-03-18"), value: 191.05),
            SingleValueData(time: .string("2019-03-25"), value: 189.95),
            SingleValueData(time: .string("2019-04-01"), value: 197.00),
            SingleValueData(time: .string("2019-04-08"), value: 198.87),
            SingleValueData(time: .string("2019-04-15"), value: 203.86),
            SingleValueData(time: .string("2019-04-22"), value: 204.30),
            SingleValueData(time: .string("2019-04-29"), value: 211.75),
            SingleValueData(time: .string("2019-05-06"), value: 197.18),
            SingleValueData(time: .string("2019-05-13"), value: 189.00),
            SingleValueData(time: .string("2019-05-20"), value: 178.97),
            SingleValueData(time: .string("2019-05-27"), value: 179.03)
        ]
        series.setData(data: data)
        self.series = series
    }
    
    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeCrosshairMove()
    }
    
}

// MARK: - ChartDelegate
extension TrackingTooltipViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        if case let .businessDay(date) = parameters.time,
            let point = parameters.point,
            case let .barPrice(price) = parameters.price(forSeries: series) {
            
            let dateString = "\(date.year) - \(date.month) - \(date.day)"
            tooltipView.update(title: legend, price: price, date: dateString)
            tooltipView.isHidden = false
            leadingConstraint.constant = CGFloat(point.x) + 16
            bottomConstraint.constant = CGFloat(point.y) - 16
        } else {
            self.tooltipView.isHidden = true
        }
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        
    }
    
}
