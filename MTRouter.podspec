#
# Be sure to run `pod lib lint Module_Chat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MTRouter'
  s.version          = '1.0.0'
  s.summary          = '组件化设计，路由模块'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	组件化设计，路由模块
                       DESC

  s.homepage         = 'https://github.com/ireliaBR/MTRouter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '672575302@qq.com' => '672575302@qq.com' }
  s.source           = { :git => 'https://github.com/ireliaBR/MTRouter.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'
  s.source_files = 'MTRouter/MTRouter/**/*.{h,m}'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  s.frameworks = 'UIKit', 'AVFoundation'
end
