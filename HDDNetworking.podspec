#
# Be sure to run `pod lib lint HDNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HDDNetworking'
  s.version          = '0.1.3'
  s.summary          = '基于AFNetworking进行网络请求，基于PINCache进行网络数据缓存的网络请求组件'
  s.description      = '基于AFNetworking进行网络请求，基于PINCache进行网络数据缓存，支持清除指定url缓存、url及参数组合缓存，通过AFNetworkActivityLogger进行网络log打印。该代码使用灵活的请求方式，不包含任何业务代码，上层支持集中式、分布式网络接口管理方式，在请求前可以对请求进行配置，也支持对网络请求后返回的数据进行统一处理'
  s.homepage         = 'https://github.com/erduoniba/HDNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denglibing' => '13049862397@163.com' }
  s.source           = { :git => 'https://github.com/erduoniba/HDNetworking.git', :tag => s.version.to_s }
  s.social_media_url = 'http://blog.csdn.net/u012390519'

  s.ios.deployment_target = '8.0'
  s.public_header_files = 'HDNetworking/*.h'
  s.source_files = 'HDNetworking/*.{h,m}'
  s.dependency 'AFNetworking'
  s.dependency 'PINCache'
end
