Pod::Spec.new do |spec|
  spec.name         = "ZoomSDK"
  spec.version      = "5.4.54520.1229"
  spec.summary      = "Original framework for Zoom.us iOS SDK with x86_64 for simulator"
  spec.homepage     = "https://github.com/zoom/zoom-sdk-ios"
  spec.license      = "MIT"
  spec.author             = { "Mokriya" => "info@mokriya.com" }

  spec.swift_version              = "5.0"
  spec.ios.deployment_target      = "9.0"

  spec.source       = { :git => "https://github.com/iagocavalcante/zoom-sdk-ios.git", :tag => "v#{spec.version}" }

  # spec.libraries = "z", "c++", "sqlite3"
  # spec.frameworks = "Foundation", "UIKit", "VideoToolbox", "CoreBluetooth", "ReplayKit", "CoreMotion"

  spec.default_subspec = 'Core'
  spec.requires_arc = true

  spec.default_subspec = 'Core'
  spec.requires_arc = true

  spec.subspec 'Core' do |subspec|
    subspec.ios.source_files           = "MobileRTC.framework/Headers/**/*.{h,m}"
    subspec.ios.public_header_files    = "MobileRTC.framework/Headers/**/*.{h,m}"
    subspec.ios.vendored_frameworks    = "MobileRTC.framework"

    subspec.ios.resource = "MobileRTCResources.bundle"
  end

  # Uncomment when this library will be support Swift 5 or higher
  # spec.subspec 'ShareScreen' do |subspec|
  #   subspec.ios.dependency 'Core'

  #   subspec.ios.source_files            = "MobileRTCScreenShare.framework/Headers/**/*.{h,m}"
  #   subspec.ios.public_header_files     = "MobileRTCScreenShare.framework/Headers/**/*.{h,m}"
  #   subspec.ios.vendored_frameworks     = "MobileRTCScreenShare.framework"
  # end

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end