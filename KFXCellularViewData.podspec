


Pod::Spec.new do |s|
  s.name             = 'KFXCellularViewData'
  s.version          = '0.4.0'
  s.summary          = 'KFXCellularViewData - Table & Collection data.'
  s.description      = <<-DESC
Data model structure for UITableViews and UICollectionViews
                       DESC

  s.homepage         = 'https://github.com/ChristianFox/KFXCellularViewData.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianFox' => 'christianfox890@icloud.com' }
  s.source           = { :git => 'https://github.com/ChristianFox/KFXCellularViewData.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'KFXCellularViewData/Classes/**/*'
  s.dependency 'KFXAbstracts'
end
