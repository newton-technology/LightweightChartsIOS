import UIKit
import LightweightCharts

class NoPriceScaleViewController: UIViewController {

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
    }
    
    private func setupUI() {
        let options = ChartOptions(
            layout: LayoutOptions(backgroundColor: "#fff"),
            rightPriceScale: VisiblePriceScaleOptions(visible: false),
            grid: GridOptions(
                verticalLines: GridLineOptions(visible: false),
                horizontalLines: GridLineOptions(visible: false)
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
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(233, 16, 169, 0.35)",
            bottomColor: "rgba(233, 16, 169, 0)",
            lineColor: "rgba(233, 16, 169, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            SingleValueData(time: .string("2016-07-18"), value: 64.04),
            SingleValueData(time: .string("2016-07-25"), value: 63.97),
            SingleValueData(time: .string("2016-08-01"), value: 66.30),
            SingleValueData(time: .string("2016-08-08"), value: 65.32),
            SingleValueData(time: .string("2016-08-15"), value: 65.86),
            SingleValueData(time: .string("2016-08-22"), value: 66.22),
            SingleValueData(time: .string("2016-08-29"), value: 67.49),
            SingleValueData(time: .string("2016-09-05"), value: 66.65),
            SingleValueData(time: .string("2016-09-12"), value: 65.82),
            SingleValueData(time: .string("2016-09-19"), value: 67.25),
            SingleValueData(time: .string("2016-09-26"), value: 66.59),
            SingleValueData(time: .string("2016-10-03"), value: 68.11),
            SingleValueData(time: .string("2016-10-10"), value: 67.52),
            SingleValueData(time: .string("2016-10-17"), value: 68.49),
            SingleValueData(time: .string("2016-10-24"), value: 69.11),
            SingleValueData(time: .string("2016-10-31"), value: 67.76),
            SingleValueData(time: .string("2016-11-07"), value: 76.69),
            SingleValueData(time: .string("2016-11-14"), value: 77.71),
            SingleValueData(time: .string("2016-11-21"), value: 78.83),
            SingleValueData(time: .string("2016-11-28"), value: 81.60),
            SingleValueData(time: .string("2016-12-05"), value: 85.49),
            SingleValueData(time: .string("2016-12-12"), value: 84.94),
            SingleValueData(time: .string("2016-12-19"), value: 87.05),
            SingleValueData(time: .string("2016-12-26"), value: 86.29),
            SingleValueData(time: .string("2017-01-02"), value: 86.12),
            SingleValueData(time: .string("2017-01-09"), value: 86.70),
            SingleValueData(time: .string("2017-01-16"), value: 83.67),
            SingleValueData(time: .string("2017-01-23"), value: 86.93),
            SingleValueData(time: .string("2017-01-30"), value: 87.18),
            SingleValueData(time: .string("2017-02-06"), value: 87.00),
            SingleValueData(time: .string("2017-02-13"), value: 90.23),
            SingleValueData(time: .string("2017-02-20"), value: 90.33),
            SingleValueData(time: .string("2017-02-27"), value: 92.80),
            SingleValueData(time: .string("2017-03-06"), value: 91.28),
            SingleValueData(time: .string("2017-03-13"), value: 90.68),
            SingleValueData(time: .string("2017-03-20"), value: 87.29),
            SingleValueData(time: .string("2017-03-27"), value: 87.84),
            SingleValueData(time: .string("2017-04-03"), value: 86.18),
            SingleValueData(time: .string("2017-04-10"), value: 84.40),
            SingleValueData(time: .string("2017-04-17"), value: 84.52),
            SingleValueData(time: .string("2017-04-24"), value: 87.00),
            SingleValueData(time: .string("2017-05-01"), value: 87.00),
            SingleValueData(time: .string("2017-05-08"), value: 86.92),
            SingleValueData(time: .string("2017-05-15"), value: 84.78),
            SingleValueData(time: .string("2017-05-22"), value: 85.36),
            SingleValueData(time: .string("2017-05-29"), value: 82.64),
            SingleValueData(time: .string("2017-06-05"), value: 86.96),
            SingleValueData(time: .string("2017-06-12"), value: 86.18),
            SingleValueData(time: .string("2017-06-19"), value: 86.86),
            SingleValueData(time: .string("2017-06-26"), value: 91.40),
            SingleValueData(time: .string("2017-07-03"), value: 93.85),
            SingleValueData(time: .string("2017-07-10"), value: 92.25),
            SingleValueData(time: .string("2017-07-17"), value: 90.89),
            SingleValueData(time: .string("2017-07-24"), value: 91.28),
            SingleValueData(time: .string("2017-07-31"), value: 93.66),
            SingleValueData(time: .string("2017-08-07"), value: 91.42),
            SingleValueData(time: .string("2017-08-14"), value: 90.74),
            SingleValueData(time: .string("2017-08-21"), value: 91.89),
            SingleValueData(time: .string("2017-08-28"), value: 91.70),
            SingleValueData(time: .string("2017-09-04"), value: 88.42),
            SingleValueData(time: .string("2017-09-11"), value: 91.62),
            SingleValueData(time: .string("2017-09-18"), value: 94.83),
            SingleValueData(time: .string("2017-09-25"), value: 95.51),
            SingleValueData(time: .string("2017-10-02"), value: 96.92),
            SingleValueData(time: .string("2017-10-09"), value: 95.86),
            SingleValueData(time: .string("2017-10-16"), value: 99.51),
            SingleValueData(time: .string("2017-10-23"), value: 101.77),
            SingleValueData(time: .string("2017-10-30"), value: 101.41),
            SingleValueData(time: .string("2017-11-06"), value: 97.51),
            SingleValueData(time: .string("2017-11-13"), value: 98.14),
            SingleValueData(time: .string("2017-11-20"), value: 98.32),
            SingleValueData(time: .string("2017-11-27"), value: 104.79),
            SingleValueData(time: .string("2017-12-04"), value: 105.93),
            SingleValueData(time: .string("2017-12-11"), value: 106.14),
            SingleValueData(time: .string("2017-12-18"), value: 107.45),
            SingleValueData(time: .string("2017-12-25"), value: 106.94),
            SingleValueData(time: .string("2018-01-01"), value: 108.34),
            SingleValueData(time: .string("2018-01-08"), value: 112.67),
            SingleValueData(time: .string("2018-01-15"), value: 113.01),
            SingleValueData(time: .string("2018-01-22"), value: 116.32),
            SingleValueData(time: .string("2018-01-29"), value: 114.28),
            SingleValueData(time: .string("2018-02-05"), value: 110.04),
            SingleValueData(time: .string("2018-02-12"), value: 114.68),
            SingleValueData(time: .string("2018-02-19"), value: 117.31),
            SingleValueData(time: .string("2018-02-26"), value: 113.32),
            SingleValueData(time: .string("2018-03-05"), value: 118.04),
            SingleValueData(time: .string("2018-03-12"), value: 115.44),
            SingleValueData(time: .string("2018-03-19"), value: 107.01),
            SingleValueData(time: .string("2018-03-26"), value: 109.97),
            SingleValueData(time: .string("2018-04-02"), value: 109.09),
            SingleValueData(time: .string("2018-04-09"), value: 110.30),
            SingleValueData(time: .string("2018-04-16"), value: 111.47),
            SingleValueData(time: .string("2018-04-23"), value: 109.40),
            SingleValueData(time: .string("2018-04-30"), value: 108.43),
            SingleValueData(time: .string("2018-05-07"), value: 113.86),
            SingleValueData(time: .string("2018-05-14"), value: 111.13),
            SingleValueData(time: .string("2018-05-21"), value: 110.66),
            SingleValueData(time: .string("2018-05-28"), value: 108.40),
            SingleValueData(time: .string("2018-06-04"), value: 111.11),
            SingleValueData(time: .string("2018-06-11"), value: 107.90),
            SingleValueData(time: .string("2018-06-18"), value: 105.75),
            SingleValueData(time: .string("2018-06-25"), value: 104.20),
            SingleValueData(time: .string("2018-07-02"), value: 104.06),
            SingleValueData(time: .string("2018-07-09"), value: 106.36),
            SingleValueData(time: .string("2018-07-16"), value: 111.28),
            SingleValueData(time: .string("2018-07-23"), value: 116.03),
            SingleValueData(time: .string("2018-07-30"), value: 117.09),
            SingleValueData(time: .string("2018-08-06"), value: 115.73),
            SingleValueData(time: .string("2018-08-13"), value: 114.77),
            SingleValueData(time: .string("2018-08-20"), value: 114.68),
            SingleValueData(time: .string("2018-08-27"), value: 114.58),
            SingleValueData(time: .string("2018-09-03"), value: 114.32),
            SingleValueData(time: .string("2018-09-10"), value: 113.50),
            SingleValueData(time: .string("2018-09-17"), value: 117.85),
            SingleValueData(time: .string("2018-09-24"), value: 112.84),
            SingleValueData(time: .string("2018-10-01"), value: 114.62),
            SingleValueData(time: .string("2018-10-08"), value: 106.95),
            SingleValueData(time: .string("2018-10-15"), value: 107.91),
            SingleValueData(time: .string("2018-10-22"), value: 103.42),
            SingleValueData(time: .string("2018-10-29"), value: 108.38),
            SingleValueData(time: .string("2018-11-05"), value: 111.29),
            SingleValueData(time: .string("2018-11-12"), value: 109.99),
            SingleValueData(time: .string("2018-11-19"), value: 106.65),
            SingleValueData(time: .string("2018-11-26"), value: 111.19),
            SingleValueData(time: .string("2018-12-03"), value: 103.29),
            SingleValueData(time: .string("2018-12-10"), value: 100.29),
            SingleValueData(time: .string("2018-12-17"), value: 94.17),
            SingleValueData(time: .string("2018-12-24"), value: 96.83),
            SingleValueData(time: .string("2018-12-31"), value: 100.69),
            SingleValueData(time: .string("2019-01-07"), value: 99.91),
            SingleValueData(time: .string("2019-01-14"), value: 104.59),
            SingleValueData(time: .string("2019-01-21"), value: 103.39),
            SingleValueData(time: .string("2019-01-28"), value: 103.88),
            SingleValueData(time: .string("2019-02-04"), value: 101.36),
            SingleValueData(time: .string("2019-02-11"), value: 105.55),
            SingleValueData(time: .string("2019-02-18"), value: 105.00),
            SingleValueData(time: .string("2019-02-25"), value: 104.43),
            SingleValueData(time: .string("2019-03-04"), value: 103.01),
            SingleValueData(time: .string("2019-03-11"), value: 106.55),
            SingleValueData(time: .string("2019-03-18"), value: 99.76),
            SingleValueData(time: .string("2019-03-25"), value: 101.23),
            SingleValueData(time: .string("2019-04-01"), value: 105.31),
            SingleValueData(time: .string("2019-04-08"), value: 111.21),
            SingleValueData(time: .string("2019-04-15"), value: 113.46),
            SingleValueData(time: .string("2019-04-22"), value: 114.47),
            SingleValueData(time: .string("2019-04-29"), value: 116.12),
            SingleValueData(time: .string("2019-05-06"), value: 112.51),
            SingleValueData(time: .string("2019-05-13"), value: 110.77),
            SingleValueData(time: .string("2019-05-20"), value: 109.71),
            SingleValueData(time: .string("2019-05-27"), value: 109.33)
        ]
        series.setData(data: data)
        self.series = series
    }

}
