


Pod::Spec.new do |s|
  s.name             = 'KFXCellularViewData'
  s.version          = '0.2.0'
  s.summary          = 'KFXCellularViewData - Table & Collection data.'
  s.description      = <<-DESC
Data model structure for UITableViews and UICollectionViews
                       DESC

  s.homepage         = 'https://kfxtech@bitbucket.org/kfx_pods/kfxcellularviewdata.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianFox' => 'christianfox890@icloud.com' }
  s.source           = { :git => 'https://kfxtech@bitbucket.org/kfx_pods/kfxcellularviewdata.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'KFXCellularViewData/Classes/**/*'
  
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'KFXAbstracts'
end
