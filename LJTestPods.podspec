#
# Be sure to run `pod lib lint LJTestPods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LJTestPods'
  s.version          = '0.1.1'
  s.summary          = 'A short description of LJTestPods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dabaosodmi0420/LJTestPods'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dabaosodmi0420' => 'zhenglianjie@csc.com.cn' }
  s.source           = { :git => 'https://github.com/dabaosodmi0420/LJTestPods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LJTestPods/Classes/**/*'
  s.resource_bundles = {
    'Resource' => ['LJTestPods/Assets/Resource/*.png']
  }

   s.public_header_files = 'LJTestPods/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.libraries = "stdc++", "stdc++.6", "c++" # 依赖的 C 库
#   s.subspec 'Controller' do |vc|
#       vc.source_files = 'ZXJTOpenAccount/Classes/OpenAccountCode/OldH5OpenAccount/ViewController/**/*',
#       'ZXJTOpenAccount/Classes/OpenAccountCode/NewH5OpenAccount/ViewController/**/*'
#       vc.public_header_files = 'ZXJTOpenAccount/Classes/OpenAccountCode/OldH5OpenAccount/ViewController/**/*.h',
#       'ZXJTOpenAccount/Classes/OpenAccountCode/NewH5OpenAccount/ViewController/**/*.h'
#   end
#   自己添加的 framework 库
#   s.vendored_frameworks = 'ZXJTOpenAccount/Classes/OpenAccountSDK/ZXJTBaseFramework.framework'
#   s.dependency 'AFNetworking', '~> 2.3'
end
