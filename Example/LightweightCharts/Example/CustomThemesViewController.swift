import UIKit
import LightweightCharts

class CustomThemesViewController: UIViewController {

    enum Theme: CaseIterable {
        case dark
        case light
        
        var title: String {
            switch self {
            case .dark: return "Dark"
            case .light: return "Light"
            }
        }
        
        var chartOptions: ChartOptions {
            switch self {
            case .dark:
                return ChartOptions(
                    watermark: WatermarkOptions(color: "rgba(0, 0, 0, 0)"),
                    // TODO: need lineColor
                    layout: LayoutOptions(backgroundColor: "#2B2B43", textColor: "#D9D9D9"),
                    crosshair: CrosshairOptions(
                        vertLine: CrosshairLineOptions(color: "#758696"),
                        horzLine: CrosshairLineOptions(color: "#758696")
                    ),
                    grid: GridOptions(
                        verticalLines: GridLineOptions(color: "#2B2B43"),
                        horizontalLines: GridLineOptions(color: "#363C4E")
                    )
                )
            case .light:
                return ChartOptions(
                    watermark: WatermarkOptions(color: "rgba(0, 0, 0, 0)"),
                    // TODO: need lineColor
                    layout: LayoutOptions(backgroundColor: "#FFFFFF", textColor: "#191919"),
                    crosshair: CrosshairOptions(
                        vertLine: CrosshairLineOptions(color: "#758696"),
                        horzLine: CrosshairLineOptions(color: "#758696")
                    ),
                    grid: GridOptions(
                        verticalLines: GridLineOptions(visible: false),
                        horizontalLines: GridLineOptions(color: "#f0f3fa")
                    )
                )
            }
        }
        
        var seriesOptions: AreaSeriesOptions {
            switch self {
            case .dark:
                return AreaSeriesOptions(
                    topColor: "rgba(32, 226, 47, 0.56)",
                    bottomColor: "rgba(32, 226, 47, 0.04)",
                    lineColor: "rgba(32, 226, 47, 1)"
                )
            case .light:
                return AreaSeriesOptions(
                    topColor: "rgba(33, 150, 243, 0.56)",
                    bottomColor: "rgba(33, 150, 243, 0.04)",
                    lineColor: "rgba(33, 150, 243, 1)"
                )
            }
        }
    }
    
    private var chart: LightweightCharts!
    private var series: AreaSeries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        syncToTheme(.dark)
    }
    
    private func setupUI() {
        let segmentedControl = UISegmentedControl(items: Theme.allCases.map { $0.title })
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        let options = ChartOptions(
            rightPriceScale: VisiblePriceScaleOptions(borderVisible: false),
            timeScale: TimeScaleOptions(borderVisible: false)
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        }
        self.chart = chart
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(33, 150, 243, 0.56)",
            bottomColor: "rgba(33, 150, 243, 0.04)",
            lineColor: "rgba(33, 150, 243, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            SingleValueData(time: .string("2018-10-19"), value: 35.98),
            SingleValueData(time: .string("2018-10-22"), value: 35.75),
            SingleValueData(time: .string("2018-10-23"), value: 35.65),
            SingleValueData(time: .string("2018-10-24"), value: 34.12),
            SingleValueData(time: .string("2018-10-25"), value: 35.84),
            SingleValueData(time: .string("2018-10-26"), value: 35.24),
            SingleValueData(time: .string("2018-10-29"), value: 35.99),
            SingleValueData(time: .string("2018-10-30"), value: 37.71),
            SingleValueData(time: .string("2018-10-31"), value: 38.14),
            SingleValueData(time: .string("2018-11-01"), value: 37.95),
            SingleValueData(time: .string("2018-11-02"), value: 37.66),
            SingleValueData(time: .string("2018-11-05"), value: 38.02),
            SingleValueData(time: .string("2018-11-06"), value: 37.73),
            SingleValueData(time: .string("2018-11-07"), value: 38.30),
            SingleValueData(time: .string("2018-11-08"), value: 38.30),
            SingleValueData(time: .string("2018-11-09"), value: 38.34),
            SingleValueData(time: .string("2018-11-12"), value: 38.00),
            SingleValueData(time: .string("2018-11-13"), value: 37.72),
            SingleValueData(time: .string("2018-11-14"), value: 38.29),
            SingleValueData(time: .string("2018-11-15"), value: 38.49),
            SingleValueData(time: .string("2018-11-16"), value: 38.59),
            SingleValueData(time: .string("2018-11-19"), value: 38.18),
            SingleValueData(time: .string("2018-11-20"), value: 36.76),
            SingleValueData(time: .string("2018-11-21"), value: 37.51),
            SingleValueData(time: .string("2018-11-23"), value: 37.39),
            SingleValueData(time: .string("2018-11-26"), value: 37.77),
            SingleValueData(time: .string("2018-11-27"), value: 38.36),
            SingleValueData(time: .string("2018-11-28"), value: 39.06),
            SingleValueData(time: .string("2018-11-29"), value: 39.42),
            SingleValueData(time: .string("2018-11-30"), value: 39.01),
            SingleValueData(time: .string("2018-12-03"), value: 39.15),
            SingleValueData(time: .string("2018-12-04"), value: 37.69),
            SingleValueData(time: .string("2018-12-06"), value: 37.88),
            SingleValueData(time: .string("2018-12-07"), value: 37.41),
            SingleValueData(time: .string("2018-12-10"), value: 37.35),
            SingleValueData(time: .string("2018-12-11"), value: 36.84),
            SingleValueData(time: .string("2018-12-12"), value: 36.98),
            SingleValueData(time: .string("2018-12-13"), value: 36.76),
            SingleValueData(time: .string("2018-12-14"), value: 36.34),
            SingleValueData(time: .string("2018-12-17"), value: 36.21),
            SingleValueData(time: .string("2018-12-18"), value: 35.65),
            SingleValueData(time: .string("2018-12-19"), value: 35.19),
            SingleValueData(time: .string("2018-12-20"), value: 34.62),
            SingleValueData(time: .string("2018-12-21"), value: 33.75),
            SingleValueData(time: .string("2018-12-24"), value: 33.07),
            SingleValueData(time: .string("2018-12-26"), value: 34.14),
            SingleValueData(time: .string("2018-12-27"), value: 34.47),
            SingleValueData(time: .string("2018-12-28"), value: 34.35),
            SingleValueData(time: .string("2018-12-31"), value: 34.05),
            SingleValueData(time: .string("2019-01-02"), value: 34.37),
            SingleValueData(time: .string("2019-01-03"), value: 34.64),
            SingleValueData(time: .string("2019-01-04"), value: 35.81),
            SingleValueData(time: .string("2019-01-07"), value: 35.43),
            SingleValueData(time: .string("2019-01-08"), value: 35.72),
            SingleValueData(time: .string("2019-01-09"), value: 36.06),
            SingleValueData(time: .string("2019-01-10"), value: 35.82),
            SingleValueData(time: .string("2019-01-11"), value: 35.63),
            SingleValueData(time: .string("2019-01-14"), value: 35.77),
            SingleValueData(time: .string("2019-01-15"), value: 35.83),
            SingleValueData(time: .string("2019-01-16"), value: 35.90),
            SingleValueData(time: .string("2019-01-17"), value: 35.91),
            SingleValueData(time: .string("2019-01-18"), value: 36.21),
            SingleValueData(time: .string("2019-01-22"), value: 34.97),
            SingleValueData(time: .string("2019-01-23"), value: 36.89),
            SingleValueData(time: .string("2019-01-24"), value: 36.24),
            SingleValueData(time: .string("2019-01-25"), value: 35.78),
            SingleValueData(time: .string("2019-01-28"), value: 35.37),
            SingleValueData(time: .string("2019-01-29"), value: 36.08),
            SingleValueData(time: .string("2019-01-30"), value: 35.43),
            SingleValueData(time: .string("2019-01-31"), value: 36.57),
            SingleValueData(time: .string("2019-02-01"), value: 36.79),
            SingleValueData(time: .string("2019-02-04"), value: 36.77),
            SingleValueData(time: .string("2019-02-05"), value: 37.15),
            SingleValueData(time: .string("2019-02-06"), value: 37.17),
            SingleValueData(time: .string("2019-02-07"), value: 37.68),
            SingleValueData(time: .string("2019-02-08"), value: 37.60),
            SingleValueData(time: .string("2019-02-11"), value: 37.00),
            SingleValueData(time: .string("2019-02-12"), value: 37.24),
            SingleValueData(time: .string("2019-02-13"), value: 37.03),
            SingleValueData(time: .string("2019-02-14"), value: 37.26),
            SingleValueData(time: .string("2019-02-15"), value: 37.77),
            SingleValueData(time: .string("2019-02-19"), value: 37.55),
            SingleValueData(time: .string("2019-02-20"), value: 37.79),
            SingleValueData(time: .string("2019-02-21"), value: 38.47),
            SingleValueData(time: .string("2019-02-22"), value: 38.61),
            SingleValueData(time: .string("2019-02-25"), value: 38.57),
            SingleValueData(time: .string("2019-02-26"), value: 38.80),
            SingleValueData(time: .string("2019-02-27"), value: 38.53),
            SingleValueData(time: .string("2019-02-28"), value: 38.67),
            SingleValueData(time: .string("2019-03-01"), value: 39.10),
            SingleValueData(time: .string("2019-03-04"), value: 38.73),
            SingleValueData(time: .string("2019-03-05"), value: 38.72),
            SingleValueData(time: .string("2019-03-06"), value: 38.61),
            SingleValueData(time: .string("2019-03-07"), value: 38.38),
            SingleValueData(time: .string("2019-03-08"), value: 38.19),
            SingleValueData(time: .string("2019-03-11"), value: 39.17),
            SingleValueData(time: .string("2019-03-12"), value: 39.49),
            SingleValueData(time: .string("2019-03-13"), value: 39.56),
            SingleValueData(time: .string("2019-03-14"), value: 39.87),
            SingleValueData(time: .string("2019-03-15"), value: 40.47),
            SingleValueData(time: .string("2019-03-18"), value: 39.92),
            SingleValueData(time: .string("2019-03-19"), value: 39.78),
            SingleValueData(time: .string("2019-03-20"), value: 39.47),
            SingleValueData(time: .string("2019-03-21"), value: 40.05),
            SingleValueData(time: .string("2019-03-22"), value: 39.46),
            SingleValueData(time: .string("2019-03-25"), value: 39.18),
            SingleValueData(time: .string("2019-03-26"), value: 39.63),
            SingleValueData(time: .string("2019-03-27"), value: 40.21),
            SingleValueData(time: .string("2019-03-28"), value: 40.42),
            SingleValueData(time: .string("2019-03-29"), value: 39.98),
            SingleValueData(time: .string("2019-04-01"), value: 40.31),
            SingleValueData(time: .string("2019-04-02"), value: 40.02),
            SingleValueData(time: .string("2019-04-03"), value: 40.27),
            SingleValueData(time: .string("2019-04-04"), value: 40.41),
            SingleValueData(time: .string("2019-04-05"), value: 40.42),
            SingleValueData(time: .string("2019-04-08"), value: 40.71),
            SingleValueData(time: .string("2019-04-09"), value: 41.04),
            SingleValueData(time: .string("2019-04-10"), value: 41.08),
            SingleValueData(time: .string("2019-04-11"), value: 41.04),
            SingleValueData(time: .string("2019-04-12"), value: 41.30),
            SingleValueData(time: .string("2019-04-15"), value: 41.78),
            SingleValueData(time: .string("2019-04-16"), value: 41.97),
            SingleValueData(time: .string("2019-04-17"), value: 42.57),
            SingleValueData(time: .string("2019-04-18"), value: 42.43),
            SingleValueData(time: .string("2019-04-22"), value: 42.00),
            SingleValueData(time: .string("2019-04-23"), value: 41.99),
            SingleValueData(time: .string("2019-04-24"), value: 41.85),
            SingleValueData(time: .string("2019-04-25"), value: 42.93),
            SingleValueData(time: .string("2019-04-26"), value: 43.08),
            SingleValueData(time: .string("2019-04-29"), value: 43.45),
            SingleValueData(time: .string("2019-04-30"), value: 43.53),
            SingleValueData(time: .string("2019-05-01"), value: 43.42),
            SingleValueData(time: .string("2019-05-02"), value: 42.65),
            SingleValueData(time: .string("2019-05-03"), value: 43.29),
            SingleValueData(time: .string("2019-05-06"), value: 43.30),
            SingleValueData(time: .string("2019-05-07"), value: 42.76),
            SingleValueData(time: .string("2019-05-08"), value: 42.55),
            SingleValueData(time: .string("2019-05-09"), value: 42.92),
            SingleValueData(time: .string("2019-05-10"), value: 43.15),
            SingleValueData(time: .string("2019-05-13"), value: 42.28),
            SingleValueData(time: .string("2019-05-14"), value: 42.91),
            SingleValueData(time: .string("2019-05-15"), value: 42.49),
            SingleValueData(time: .string("2019-05-16"), value: 43.19),
            SingleValueData(time: .string("2019-05-17"), value: 43.54),
            SingleValueData(time: .string("2019-05-20"), value: 42.78),
            SingleValueData(time: .string("2019-05-21"), value: 43.29),
            SingleValueData(time: .string("2019-05-22"), value: 43.30),
            SingleValueData(time: .string("2019-05-23"), value: 42.73),
            SingleValueData(time: .string("2019-05-24"), value: 42.67),
            SingleValueData(time: .string("2019-05-28"), value: 42.75)
        ]
        series.setData(data: data)
        self.series = series
    }

    private func syncToTheme(_ theme: Theme) {
        chart.applyOptions(options: theme.chartOptions)
        series.applyOptions(options: theme.seriesOptions)
    }
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        syncToTheme(Theme.allCases[sender.selectedSegmentIndex])
    }
    
}
