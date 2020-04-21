require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-pagecall"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-pagecall
                   DESC
  s.homepage     = "https://github.com/pplink/react-native-pagecall"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Sehun" => "sehun@pplink.net" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/pplink/react-native-pagecall.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true
  s.ios.vendored_frameworks = 'ios/WebRTC.framework', 'ios/PageCallSDK.framework'
  s.dependency "React"
  # ...
  # s.dependency "..."
end

