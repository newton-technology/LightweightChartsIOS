import UIKit
import LightweightCharts

class VolumeStudyViewController: UIViewController {

    private var chart: LightweightCharts!
    private var areaSeries: AreaSeries!
    private var volumeSeries: HistogramSeries!
    
    private var leadingConstraint: NSLayoutConstraint!
    
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
            layout: LayoutOptions(backgroundColor: "#131722", textColor: "#d1d4dc"),
            rightPriceScale: VisiblePriceScaleOptions(
                scaleMargins: PriceScaleMargins(top: 0.3, bottom: 0.25),
                borderVisible: false
            ),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "rgba(42, 46, 57, 0)"),
                horizontalLines: GridLineOptions(color: "rgba(42, 46, 57, 0.6)")
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
        let areaSeriesOptions = AreaSeriesOptions(
            topColor: "rgba(38,198,218, 0.56)",
            bottomColor: "rgba(38,198,218, 0.04)",
            lineColor: "rgba(38,198,218, 1)",
            lineWidth: .two
        )
        let areaSeries = chart.addAreaSeries(options: areaSeriesOptions)
        let areaData = [
            SingleValueData(time: .string("2018-10-19"), value: 54.90),
            SingleValueData(time: .string("2018-10-22"), value: 54.98),
            SingleValueData(time: .string("2018-10-23"), value: 57.21),
            SingleValueData(time: .string("2018-10-24"), value: 57.42),
            SingleValueData(time: .string("2018-10-25"), value: 56.43),
            SingleValueData(time: .string("2018-10-26"), value: 55.51),
            SingleValueData(time: .string("2018-10-29"), value: 56.48),
            SingleValueData(time: .string("2018-10-30"), value: 58.18),
            SingleValueData(time: .string("2018-10-31"), value: 57.09),
            SingleValueData(time: .string("2018-11-01"), value: 56.05),
            SingleValueData(time: .string("2018-11-02"), value: 56.63),
            SingleValueData(time: .string("2018-11-05"), value: 57.21),
            SingleValueData(time: .string("2018-11-06"), value: 57.21),
            SingleValueData(time: .string("2018-11-07"), value: 57.65),
            SingleValueData(time: .string("2018-11-08"), value: 58.27),
            SingleValueData(time: .string("2018-11-09"), value: 58.46),
            SingleValueData(time: .string("2018-11-12"), value: 58.72),
            SingleValueData(time: .string("2018-11-13"), value: 58.66),
            SingleValueData(time: .string("2018-11-14"), value: 58.94),
            SingleValueData(time: .string("2018-11-15"), value: 59.08),
            SingleValueData(time: .string("2018-11-16"), value: 60.21),
            SingleValueData(time: .string("2018-11-19"), value: 60.62),
            SingleValueData(time: .string("2018-11-20"), value: 59.46),
            SingleValueData(time: .string("2018-11-21"), value: 59.16),
            SingleValueData(time: .string("2018-11-23"), value: 58.64),
            SingleValueData(time: .string("2018-11-26"), value: 59.17),
            SingleValueData(time: .string("2018-11-27"), value: 60.65),
            SingleValueData(time: .string("2018-11-28"), value: 60.06),
            SingleValueData(time: .string("2018-11-29"), value: 59.45),
            SingleValueData(time: .string("2018-11-30"), value: 60.30),
            SingleValueData(time: .string("2018-12-03"), value: 58.16),
            SingleValueData(time: .string("2018-12-04"), value: 58.09),
            SingleValueData(time: .string("2018-12-06"), value: 58.08),
            SingleValueData(time: .string("2018-12-07"), value: 57.68),
            SingleValueData(time: .string("2018-12-10"), value: 58.27),
            SingleValueData(time: .string("2018-12-11"), value: 58.85),
            SingleValueData(time: .string("2018-12-12"), value: 57.25),
            SingleValueData(time: .string("2018-12-13"), value: 57.09),
            SingleValueData(time: .string("2018-12-14"), value: 57.08),
            SingleValueData(time: .string("2018-12-17"), value: 55.95),
            SingleValueData(time: .string("2018-12-18"), value: 55.65),
            SingleValueData(time: .string("2018-12-19"), value: 55.86),
            SingleValueData(time: .string("2018-12-20"), value: 55.07),
            SingleValueData(time: .string("2018-12-21"), value: 54.92),
            SingleValueData(time: .string("2018-12-24"), value: 53.05),
            SingleValueData(time: .string("2018-12-26"), value: 54.44),
            SingleValueData(time: .string("2018-12-27"), value: 55.15),
            SingleValueData(time: .string("2018-12-28"), value: 55.27),
            SingleValueData(time: .string("2018-12-31"), value: 56.22),
            SingleValueData(time: .string("2019-01-02"), value: 56.02),
            SingleValueData(time: .string("2019-01-03"), value: 56.22),
            SingleValueData(time: .string("2019-01-04"), value: 56.36),
            SingleValueData(time: .string("2019-01-07"), value: 56.72),
            SingleValueData(time: .string("2019-01-08"), value: 58.38),
            SingleValueData(time: .string("2019-01-09"), value: 57.05),
            SingleValueData(time: .string("2019-01-10"), value: 57.60),
            SingleValueData(time: .string("2019-01-11"), value: 58.02),
            SingleValueData(time: .string("2019-01-14"), value: 58.03),
            SingleValueData(time: .string("2019-01-15"), value: 58.10),
            SingleValueData(time: .string("2019-01-16"), value: 57.08),
            SingleValueData(time: .string("2019-01-17"), value: 56.83),
            SingleValueData(time: .string("2019-01-18"), value: 57.09),
            SingleValueData(time: .string("2019-01-22"), value: 56.99),
            SingleValueData(time: .string("2019-01-23"), value: 57.76),
            SingleValueData(time: .string("2019-01-24"), value: 57.07),
            SingleValueData(time: .string("2019-01-25"), value: 56.40),
            SingleValueData(time: .string("2019-01-28"), value: 55.07),
            SingleValueData(time: .string("2019-01-29"), value: 53.28),
            SingleValueData(time: .string("2019-01-30"), value: 54.00),
            SingleValueData(time: .string("2019-01-31"), value: 55.06),
            SingleValueData(time: .string("2019-02-01"), value: 54.55),
            SingleValueData(time: .string("2019-02-04"), value: 54.04),
            SingleValueData(time: .string("2019-02-05"), value: 54.14),
            SingleValueData(time: .string("2019-02-06"), value: 53.79),
            SingleValueData(time: .string("2019-02-07"), value: 53.57),
            SingleValueData(time: .string("2019-02-08"), value: 53.95),
            SingleValueData(time: .string("2019-02-11"), value: 54.05),
            SingleValueData(time: .string("2019-02-12"), value: 54.42),
            SingleValueData(time: .string("2019-02-13"), value: 54.48),
            SingleValueData(time: .string("2019-02-14"), value: 54.03),
            SingleValueData(time: .string("2019-02-15"), value: 55.16),
            SingleValueData(time: .string("2019-02-19"), value: 55.44),
            SingleValueData(time: .string("2019-02-20"), value: 55.76),
            SingleValueData(time: .string("2019-02-21"), value: 56.15),
            SingleValueData(time: .string("2019-02-22"), value: 56.92),
            SingleValueData(time: .string("2019-02-25"), value: 56.78),
            SingleValueData(time: .string("2019-02-26"), value: 56.64),
            SingleValueData(time: .string("2019-02-27"), value: 56.72),
            SingleValueData(time: .string("2019-02-28"), value: 56.92),
            SingleValueData(time: .string("2019-03-01"), value: 56.96),
            SingleValueData(time: .string("2019-03-04"), value: 56.24),
            SingleValueData(time: .string("2019-03-05"), value: 56.08),
            SingleValueData(time: .string("2019-03-06"), value: 55.68),
            SingleValueData(time: .string("2019-03-07"), value: 56.30),
            SingleValueData(time: .string("2019-03-08"), value: 56.53),
            SingleValueData(time: .string("2019-03-11"), value: 57.58),
            SingleValueData(time: .string("2019-03-12"), value: 57.43),
            SingleValueData(time: .string("2019-03-13"), value: 57.66),
            SingleValueData(time: .string("2019-03-14"), value: 57.95),
            SingleValueData(time: .string("2019-03-15"), value: 58.39),
            SingleValueData(time: .string("2019-03-18"), value: 58.07),
            SingleValueData(time: .string("2019-03-19"), value: 57.50),
            SingleValueData(time: .string("2019-03-20"), value: 57.67),
            SingleValueData(time: .string("2019-03-21"), value: 58.29),
            SingleValueData(time: .string("2019-03-22"), value: 59.76),
            SingleValueData(time: .string("2019-03-25"), value: 60.08),
            SingleValueData(time: .string("2019-03-26"), value: 60.63),
            SingleValueData(time: .string("2019-03-27"), value: 60.88),
            SingleValueData(time: .string("2019-03-28"), value: 59.08),
            SingleValueData(time: .string("2019-03-29"), value: 59.13),
            SingleValueData(time: .string("2019-04-01"), value: 59.09),
            SingleValueData(time: .string("2019-04-02"), value: 58.53),
            SingleValueData(time: .string("2019-04-03"), value: 58.87),
            SingleValueData(time: .string("2019-04-04"), value: 58.99),
            SingleValueData(time: .string("2019-04-05"), value: 59.09),
            SingleValueData(time: .string("2019-04-08"), value: 59.13),
            SingleValueData(time: .string("2019-04-09"), value: 58.40),
            SingleValueData(time: .string("2019-04-10"), value: 58.61),
            SingleValueData(time: .string("2019-04-11"), value: 58.56),
            SingleValueData(time: .string("2019-04-12"), value: 58.74),
            SingleValueData(time: .string("2019-04-15"), value: 58.71),
            SingleValueData(time: .string("2019-04-16"), value: 58.79),
            SingleValueData(time: .string("2019-04-17"), value: 57.78),
            SingleValueData(time: .string("2019-04-18"), value: 58.04),
            SingleValueData(time: .string("2019-04-22"), value: 58.37),
            SingleValueData(time: .string("2019-04-23"), value: 57.15),
            SingleValueData(time: .string("2019-04-24"), value: 57.08),
            SingleValueData(time: .string("2019-04-25"), value: 55.85),
            SingleValueData(time: .string("2019-04-26"), value: 56.58),
            SingleValueData(time: .string("2019-04-29"), value: 56.84),
            SingleValueData(time: .string("2019-04-30"), value: 57.19),
            SingleValueData(time: .string("2019-05-01"), value: 56.52),
            SingleValueData(time: .string("2019-05-02"), value: 56.99),
            SingleValueData(time: .string("2019-05-03"), value: 57.24),
            SingleValueData(time: .string("2019-05-06"), value: 56.91),
            SingleValueData(time: .string("2019-05-07"), value: 56.63),
            SingleValueData(time: .string("2019-05-08"), value: 56.38),
            SingleValueData(time: .string("2019-05-09"), value: 56.48),
            SingleValueData(time: .string("2019-05-10"), value: 56.91),
            SingleValueData(time: .string("2019-05-13"), value: 56.75),
            SingleValueData(time: .string("2019-05-14"), value: 56.55),
            SingleValueData(time: .string("2019-05-15"), value: 56.81),
            SingleValueData(time: .string("2019-05-16"), value: 57.38),
            SingleValueData(time: .string("2019-05-17"), value: 58.09),
            SingleValueData(time: .string("2019-05-20"), value: 59.01),
            SingleValueData(time: .string("2019-05-21"), value: 59.50),
            SingleValueData(time: .string("2019-05-22"), value: 59.25),
            SingleValueData(time: .string("2019-05-23"), value: 58.87),
            SingleValueData(time: .string("2019-05-24"), value: 59.32),
            SingleValueData(time: .string("2019-05-28"), value: 59.57)
        ]
        areaSeries.setData(data: areaData)
        self.areaSeries = areaSeries
        
        let volumeSeriesOptions = HistogramSeriesOptions(
            priceLineVisible: false,
            priceFormat: .builtIn(BuiltInPriceFormat(type: .volume, precision: nil, minMove: nil)),
            color: "#26a69a"
        )
        let volumeSeries = chart.addHistogramSeries(options: volumeSeriesOptions)
        let volumeData = [
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-19"), value: 19103293.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-22"), value: 21737523.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-23"), value: 29328713.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-24"), value: 37435638.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-10-25"), value: 25269995.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-10-26"), value: 24973311.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-29"), value: 22103692.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-10-30"), value: 25231199.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-10-31"), value: 24214427.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-01"), value: 22533201.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-02"), value: 14734412.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-05"), value: 12733842.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-06"), value: 12371207.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-07"), value: 14891287.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-08"), value: 12482392.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-09"), value: 17365762.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-12"), value: 13236769.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-13"), value: 13047907.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-14"), value: 18288710.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-15"), value: 17147123.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-16"), value: 19470986.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-19"), value: 18405731.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-20"), value: 22028957.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-21"), value: 18482233.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-23"), value: 7009050.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-26"), value: 12308876.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-27"), value: 14118867.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-28"), value: 18662989.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-11-29"), value: 14763658.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-11-30"), value: 31142818.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-03"), value: 27795428.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-04"), value: 21727411.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-06"), value: 26880429.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-07"), value: 16948126.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-10"), value: 16603356.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-11"), value: 14991438.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-12"), value: 18892182.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-13"), value: 15454706.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-14"), value: 13960870.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-17"), value: 18902523.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-18"), value: 18895777.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-19"), value: 20968473.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-20"), value: 26897008.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-21"), value: 55413082.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2018-12-24"), value: 15077207.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-26"), value: 17970539.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-27"), value: 17530977.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-28"), value: 14771641.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2018-12-31"), value: 15331758.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-02"), value: 13969691.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-03"), value: 19245411.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-04"), value: 17035848.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-07"), value: 16348982.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-08"), value: 21425008.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-09"), value: 18136000.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-10"), value: 14259910.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-11"), value: 15801548.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-14"), value: 11342293.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-15"), value: 10074386.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-16"), value: 13411691.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-17"), value: 15223854.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-18"), value: 16802516.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-22"), value: 18284771.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-23"), value: 15109007.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-24"), value: 12494109.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-25"), value: 17806822.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-28"), value: 25955718.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-01-29"), value: 33789235.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-30"), value: 27260036.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-01-31"), value: 28585447.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-01"), value: 13778392.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-04"), value: 15818901.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-05"), value: 14124794.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-06"), value: 11391442.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-07"), value: 12436168.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-08"), value: 12011657.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-11"), value: 9802798.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-12"), value: 11227550.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-13"), value: 11884803.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-14"), value: 11190094.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-15"), value: 15719416.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-19"), value: 12272877.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-20"), value: 11379006.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-21"), value: 14680547.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-22"), value: 12534431.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-25"), value: 15051182.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-02-26"), value: 12005571.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-27"), value: 8962776.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-02-28"), value: 15742971.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-01"), value: 10942737.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-04"), value: 13674737.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-05"), value: 15749545.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-06"), value: 13935530.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-07"), value: 12644171.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-08"), value: 10646710.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-11"), value: 13627431.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-12"), value: 12812980.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-13"), value: 14168350.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-14"), value: 12148349.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-15"), value: 23715337.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-18"), value: 12168133.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-19"), value: 13462686.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-20"), value: 11903104.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-21"), value: 10920129.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-22"), value: 25125385.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-25"), value: 15463411.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-26"), value: 12316901.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-27"), value: 13290298.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-03-28"), value: 20547060.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-03-29"), value: 17283871.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-01"), value: 16331140.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-02"), value: 11408146.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-03"), value: 15491724.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-04"), value: 8776028.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-05"), value: 11497780.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-08"), value: 11680538.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-09"), value: 10414416.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-10"), value: 8782061.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-11"), value: 9219930.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-12"), value: 10847504.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-15"), value: 7741472.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-16"), value: 10239261.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-17"), value: 15498037.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-18"), value: 13189013.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-22"), value: 11950365.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-23"), value: 23488682.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-24"), value: 13227084.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-04-25"), value: 17425466.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-26"), value: 16329727.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-29"), value: 13984965.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-04-30"), value: 15469002.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-01"), value: 11627436.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-02"), value: 14435436.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-03"), value: 9388228.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-06"), value: 10066145.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-07"), value: 12963827.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-08"), value: 12086743.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-09"), value: 14835326.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-10"), value: 10707335.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-13"), value: 13759350.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-14"), value: 12776175.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-15"), value: 10806379.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-16"), value: 11695064.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-17"), value: 14436662.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-20"), value: 20910590.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-21"), value: 14016315.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-22"), value: 11487448.00),
            HistogramData(color: "rgba(255,82,82, 0.8)", time: .string("2019-05-23"), value: 11707083.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-24"), value: 8755506.00),
            HistogramData(color: "rgba(0, 150, 136, 0.8)", time: .string("2019-05-28"), value: 3097125.00)
        ]
        volumeSeries.setData(data: volumeData)
        self.volumeSeries = volumeSeries
    }
    
}
