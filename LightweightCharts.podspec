Pod::Spec.new do |s|
    
  s.name                    = 'LightweightCharts'
  s.version                 = '3.8.8'
  s.summary                 = 'LightweightCharts for iOS.'
  s.description             = 'LightweightCharts pod. Swift wrapper above JavaScript library.'
  s.homepage                = 'https://tradingview.com'
  s.license                 = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author                  = { 'TradingView, Inc.' => 'noreply@tradingview.com' }
  s.source                  = { :git => 'https://github.com/newton-technology/LightweightChartsIOS.git', :branch => 'chart-improvements', :tag => s.version }
  s.ios.deployment_target   = '10.0'
  s.source_files            = 'Sources/LightweightCharts/**/*.swift'
  s.resources               = 'Sources/LightweightCharts/Assets/*'
  s.swift_version           = '5.0'
  
end
