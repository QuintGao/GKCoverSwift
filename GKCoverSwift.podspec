Pod::Spec.new do |s|
  s.name         = "GKCoverSwift"
  s.version      = "1.0.0"
  s.summary      = "GKCover swift版本，一行代码显示遮罩视图，让你的弹窗更easy!"
  s.homepage     = "https://github.com/QuintGao/GKCoverSwift"
  s.license      = "MIT"
  s.authors      = { "高坤" => "1094887059@qq.com" }
  s.social_media_url   = "https://github.com/QuintGao"
  s.platform     = :ios, "6.0"
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/QuintGao/GKCoverSwift.git", :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'GKCoverSwift/**/*.{swift}'
  s.public_header_files = 'GKCoverSwift/**/*.{swift}'
  s.resource     = 'GKCoverSwift/Resource'
  s.frameworks   = "Foundation", "UIKit"

end
