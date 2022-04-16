//
//  AreaFillFormatter.swift
//  chartsDemo3
//
//  Created by Alex on 2022/4/16.
//
import UIKit
import Charts

class AreaFillFormatter: IFillFormatter {
    
    var fillLineDataSet: LineChartDataSet?
        
        init(fillLineDataSet: LineChartDataSet) {
            self.fillLineDataSet = fillLineDataSet
        }
        
        public func getFillLinePosition(dataSet: ILineChartDataSet, dataProvider: LineChartDataProvider) -> CGFloat {
            return 0.0
        }
        
        public func getFillLineDataSet() -> LineChartDataSet {
            return fillLineDataSet ?? LineChartDataSet()
        }
}
