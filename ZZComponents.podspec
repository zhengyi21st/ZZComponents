Pod::Spec.new do |s|
  s.name        = "ZZComponents"
  s.version     = "0.0.1"
  s.homepage    = "https://github.com/zhengyi21st/ZZComponents"
  s.source = { :git => "https://github.com/zhengyi21st/ZZComponents.git", :tag => s.version }
  s.license     = { :type => "MIT" }
  s.authors     = { "ethan" => "zhengyi21st@gmail.com" }
  s.summary     = "A short description of ZZComponents."
  
  s.requires_arc = true
  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'
  
  s.subspec 'Core' do |subspec|
    subspec.source_files  = "Sources/ZZComponents/Core/*.swift"
  end

 s.subspec 'ActivityIndicatorView' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.source_files  = "Sources/ZZComponents/ActivityIndicatorView/*.swift"
  end
  
  s.subspec 'Button' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.source_files  = "Sources/ZZComponents/Button/*.swift"
  end

  s.subspec 'Color' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.source_files  = "Sources/ZZComponents/Color/**/*.swift"
  end

  s.subspec 'Font' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.source_files  = "Sources/ZZComponents/Font/**/*.swift"
  end
  
  s.subspec 'Gradient' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.source_files  = "Sources/ZZComponents/Gradient/**/*.swift"
  end
  
  s.subspec 'ImageView' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.dependency 'Kingfisher'
    subspec.source_files  = "Sources/ZZComponents/ImageView/**/*.swift"
  end
  
  s.subspec 'Separator' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.dependency 'ZZComponents/Color'
    subspec.source_files  = "Sources/ZZComponents/Separator/**/*.swift"
  end
  
  s.subspec 'Loading' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.dependency 'ZZComponents/Color'
    subspec.dependency 'ZZComponents/Font'
    subspec.source_files  = "Sources/ZZComponents/Loading/**/*.swift"
  end
  
  s.subspec 'Toast' do |subspec|
    subspec.dependency 'ZZComponents/Core'
    subspec.dependency 'ZZComponents/Color'
    subspec.dependency 'ZZComponents/Font'
    subspec.source_files  = "Sources/ZZComponents/Toast/**/*.swift"
  end
  
end
