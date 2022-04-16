//
//  ViewController.swift
//  chartsDemo3
//
//  Created by Alex on 2022/4/16.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    
    let fullSize = UIScreen.main.bounds.size
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        
        chartView.animate(xAxisDuration: 2.5) // 動畫顯示 2.5 秒
        chartView.xAxis.drawGridLinesEnabled = false
        
        return chartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(lineChartView)
        lineChartView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        lineChartView.center = CGPoint(x: fullSize.width/2, y: fullSize.height/2)
        
        setData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData() {
        let set1 = LineChartDataSet(entries: firstValues, label: "2021")
        let set2 = LineChartDataSet(entries: secondValues, label: "2020")
        let set3 = LineChartDataSet(entries: eraseValues)

        set1.mode = .linear // 圓弧曲線
        set1.drawCirclesEnabled = false // 不顯示圓圈
        set1.setColor(.systemBlue)
        set1.fillColor = .systemBlue
        set1.fillAlpha = 0.6
        
        set2.mode = .linear
        set2.drawCirclesEnabled = false
        set2.setColor(.systemGreen)
        set2.fillColor = .systemGreen
        set2.fillAlpha = 0.6
        
        set3.mode = .linear
        set3.drawCirclesEnabled = false
        
        let data = LineChartData(dataSets: [set1, set2, set3])
        
        data.setDrawValues(false) // 不顯示出數據的數字
        
        lineChartView.data = data
        lineChartView.renderer = CustomLineChartRenderer(dataProvider: self.lineChartView, animator: self.lineChartView.chartAnimator, viewPortHandler: self.lineChartView.viewPortHandler)
        
        set1.drawFilledEnabled = true
        set1.fillFormatter = AreaFillFormatter(fillLineDataSet: set2)
        
        set2.drawFilledEnabled = true
        set2.fillFormatter = AreaFillFormatter(fillLineDataSet: set3)
    }
    
    let firstValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 7.0),
        ChartDataEntry(x: 3.0, y: 5.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 5.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 12.0),
        ChartDataEntry(x: 10.0, y: 13.0),
        ChartDataEntry(x: 11.0, y: 5.0),
        ChartDataEntry(x: 12.0, y: 7.0),
        ChartDataEntry(x: 13.0, y: 3.0),
        ChartDataEntry (x: 14.0,y: 15.0),
        ChartDataEntry(x: 15.0, y: 6.0),
        ChartDataEntry(x: 16.0, y: 6.0),
        ChartDataEntry (x: 17.0, y: 7.0),
        ChartDataEntry(x: 18.0, y: 3.0),
        ChartDataEntry(x: 19.0, y: 10.0),
        ChartDataEntry(x: 20.0, y: 12.0),
        ChartDataEntry(x: 21.0, y: 15.0),
        ChartDataEntry(x: 22.0, y: 17.0),
        ChartDataEntry(x: 23.0, y: 15.0),
        ChartDataEntry(x: 24.0, y: 10.0),
        ChartDataEntry(x: 25.0, y: 10.0),
        ChartDataEntry(x: 26.0, y: 10.0),
        ChartDataEntry(x: 27.0, y: 17.0),
        ChartDataEntry(x: 28.0, y: 13.0),
        ChartDataEntry(x: 29.0, y: 20.0),
        ChartDataEntry(x: 30.0, y: 24.0),
        ChartDataEntry(x: 31.0, y: 25.0),
        ChartDataEntry(x: 32.0, y: 30.0),
        ChartDataEntry(x: 33.0, y: 33.0),
        ChartDataEntry(x: 34.0, y: 40.0),
        ChartDataEntry(x: 35.0, y: 45.0),
        ChartDataEntry(x: 36.0, y: 50.0),
        ChartDataEntry(x: 37.0, y: 45.0),
        ChartDataEntry(x: 38.0, y: 43.0),
        ChartDataEntry(x: 39.0, y: 40.0),
        ChartDataEntry(x: 40.0, y: 45.0)
    ]
    
    let secondValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 8.0),
        ChartDataEntry(x: 1.0, y: 3.0),
        ChartDataEntry(x: 2.0, y: 5.0),
        ChartDataEntry(x: 3.0, y: 3.0),
        ChartDataEntry(x: 4.0, y: 8.0),
        ChartDataEntry(x: 5.0, y: 4.0),
        ChartDataEntry(x: 6.0, y: 3.0),
        ChartDataEntry(x: 7.0, y: 5.0),
        ChartDataEntry(x: 8.0, y: 6.0),
        ChartDataEntry(x: 9.0, y: 10.0),
        ChartDataEntry(x: 10.0, y: 11.0),
        ChartDataEntry(x: 11.0, y: 3.0),
        ChartDataEntry(x: 12.0, y: 5.0),
        ChartDataEntry(x: 13.0, y: 1.0),
        ChartDataEntry (x: 14.0,y: 13.0),
        ChartDataEntry(x: 15.0, y: 3.0),
        ChartDataEntry(x: 16.0, y: 4.0),
        ChartDataEntry (x: 17.0, y: 5.0),
        ChartDataEntry(x: 18.0, y: 1.0),
        ChartDataEntry(x: 19.0, y: 8.0),
        ChartDataEntry(x: 20.0, y: 10.0),
        ChartDataEntry(x: 21.0, y: 13.0),
        ChartDataEntry(x: 22.0, y: 15.0),
        ChartDataEntry(x: 23.0, y: 13.0),
        ChartDataEntry(x: 24.0, y: 8.0),
        ChartDataEntry(x: 25.0, y: 8.0),
        ChartDataEntry(x: 26.0, y: 8.0),
        ChartDataEntry(x: 27.0, y: 15.0),
        ChartDataEntry(x: 28.0, y: 11.0),
        ChartDataEntry(x: 29.0, y: 18.0),
        ChartDataEntry(x: 30.0, y: 22.0),
        ChartDataEntry(x: 31.0, y: 23.0),
        ChartDataEntry(x: 32.0, y: 28.0),
        ChartDataEntry(x: 33.0, y: 30.0),
        ChartDataEntry(x: 34.0, y: 37.0),
        ChartDataEntry(x: 35.0, y: 42.0),
        ChartDataEntry(x: 36.0, y: 47.0),
        ChartDataEntry(x: 37.0, y: 42.0),
        ChartDataEntry(x: 38.0, y: 39.0),
        ChartDataEntry(x: 39.0, y: 37.0),
        ChartDataEntry(x: 40.0, y: 43.0)
    ]
    
    let eraseValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 5.0),
        ChartDataEntry(x: 1.0, y: 0.0),
        ChartDataEntry(x: 2.0, y: 2.0),
        ChartDataEntry(x: 3.0, y: 0.0),
        ChartDataEntry(x: 4.0, y: 5.0),
        ChartDataEntry(x: 5.0, y: 1.0),
        ChartDataEntry(x: 6.0, y: 0.0),
        ChartDataEntry(x: 7.0, y: 2.0),
        ChartDataEntry(x: 8.0, y: 3.0),
        ChartDataEntry(x: 9.0, y: 7.0),
        ChartDataEntry(x: 10.0, y: 8.0),
        ChartDataEntry(x: 11.0, y: 0.0),
        ChartDataEntry(x: 12.0, y: 2.0),
        ChartDataEntry(x: 13.0, y: 0.0),
        ChartDataEntry (x: 14.0,y: 8.0),
        ChartDataEntry(x: 15.0, y: 0.0),
        ChartDataEntry(x: 16.0, y: 0.0),
        ChartDataEntry (x: 17.0, y: 0.0),
        ChartDataEntry(x: 18.0, y: 0.0),
        ChartDataEntry(x: 19.0, y: 3.0),
        ChartDataEntry(x: 20.0, y: 5.0),
        ChartDataEntry(x: 21.0, y: 8.0),
        ChartDataEntry(x: 22.0, y: 10.0),
        ChartDataEntry(x: 23.0, y: 8.0),
        ChartDataEntry(x: 24.0, y: 3.0),
        ChartDataEntry(x: 25.0, y: 3.0),
        ChartDataEntry(x: 26.0, y: 3.0),
        ChartDataEntry(x: 27.0, y: 10.0),
        ChartDataEntry(x: 28.0, y: 6.0),
        ChartDataEntry(x: 29.0, y: 13.0),
        ChartDataEntry(x: 30.0, y: 17.0),
        ChartDataEntry(x: 31.0, y: 18.0),
        ChartDataEntry(x: 32.0, y: 24.0),
        ChartDataEntry(x: 33.0, y: 27.0),
        ChartDataEntry(x: 34.0, y: 33.0),
        ChartDataEntry(x: 35.0, y: 38.0),
        ChartDataEntry(x: 36.0, y: 43.0),
        ChartDataEntry(x: 37.0, y: 38.0),
        ChartDataEntry(x: 38.0, y: 35.0),
        ChartDataEntry(x: 39.0, y: 33.0),
        ChartDataEntry(x: 40.0, y: 40.0)
    ]


}



