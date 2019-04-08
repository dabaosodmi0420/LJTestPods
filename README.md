# LJTestPods

[![CI Status](https://img.shields.io/travis/dabaosodmi0420/LJTestPods.svg?style=flat)](https://travis-ci.org/dabaosodmi0420/LJTestPods)
[![Version](https://img.shields.io/cocoapods/v/LJTestPods.svg?style=flat)](https://cocoapods.org/pods/LJTestPods)
[![License](https://img.shields.io/cocoapods/l/LJTestPods.svg?style=flat)](https://cocoapods.org/pods/LJTestPods)
[![Platform](https://img.shields.io/cocoapods/p/LJTestPods.svg?style=flat)](https://cocoapods.org/pods/LJTestPods)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LJTestPods is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LJTestPods'
```
## 创建pod公有库
1、打开终端，进入到要建立私有库工程的目录，执行pod lib create 你的工程名称，之后回答几个问题
```
What platform do you want to use?? [ iOS / macOS ]
> ios

What language do you want to use?? [ Swift / ObjC ]
> objc

Would you like to include a demo application with your library? [ Yes / No ]
> yes

Which testing frameworks will you use? [ Specta / Kiwi / None ]
> none

Would you like to do view based testing? [ Yes / No ]
> yes

What is your class prefix?
> LJ
```
2、创建私有库Git地址，这里以GitHub为例，一个空的
3、配置LJTestPods.podspec文件
4、打开终端，进入Example文件夹，执行pod install，安装依赖项
5、添加库的源码文件，在class文件下天类库，在执行pod install
6、demo项目中使用类库测试功能
7、验证LJTestPods.podspec文件
```
pod lib lint LJTestPods.podspec --allow-warnings 
```
执行完成后
```
Ignoring ffi-1.9.25 because its extensions are not built. Try: gem pristine ffi --version 1.9.25

-> LJTestPods (0.1.0)
- WARN  | summary: The summary is not meaningful.
- NOTE  | xcodebuild:  note: Using new build system
- NOTE  | [iOS] xcodebuild:  note: Planning build
- NOTE  | [iOS] xcodebuild:  note: Constructing build description
- NOTE  | [iOS] xcodebuild:  warning: Skipping code signing because the target does not have an Info.plist file. (in target 'App')

LJTestPods passed validation.
```
8、提交源码到GitHub，并打tag
```
git remote add origin https://github.com/dabaosodmi0420/LJTestPods.git
git add .
git commit -a -m '提交0.1.0'
git pull origin master //第一次创建可以不用执行
git push origin master

//创建tag
git tag 0.1.0
git push origin 0.1.0

//校验.podspec 文件
pod lib lint LJTestPods.podspec --allow-warnings

//发布
pod trunk push LJTestPods.podspe --allow-warnings
//出错 [!] Unable to accept duplicate entry for: LJTestPods (0.1.0)
//适用于版本冲突，重新发布版本
git tag 0.1.1
git push --tags
git push origin master
pod trunk push LJTestPods.podspe --allow-warnings

//pod search 
pod search LJTestPods
//报错 Unable to find a pod with name, author, summary, or description matching
pod setup 
//删除 ~/Library/Caches/CocoaPods 目录下的 search_index.json 文件 
rm ~/Library/Caches/CocoaPods/search_index.json
pod search LJTestPods
```
9、添加资源文件
注：oc工程的podfile一般是不使用use_frameworks!的，swift和自己创建的lib库是默认有的，关于这两点的差异，如果不使用framework，pod里的资源文件会被打成bundle放在mainbundle下面，由于开发中每个pod库对于use_frameworks!的使用情况不一样，我们在设计工具类的时候要两者兼容。
```
- (NSString *)imagePathWithName:(NSString *)imageName bundleName:(NSString *)bundleName{

if(bundleName == nil || imageName == nil){
@throw @"imageName 和 bundleName 不能为空";
}
if ([bundleName containsString:@".bundle"]) {
bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
}
// Podfile 文件中没有使用 use_frameworks!
NSURL *bundelUrl = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
// Podfile 文件中使用了 use_framework!
if (!bundelUrl) {
bundelUrl = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
bundelUrl = [bundelUrl URLByAppendingPathComponent:@"LJTestPods"];//是pod的名字
bundelUrl = [bundelUrl URLByAppendingPathExtension:@"framework"];
NSBundle *bundle = [NSBundle bundleWithURL:bundelUrl];
bundelUrl = [bundle URLForResource:bundleName withExtension:@"bundle"];
}
NSAssert(bundelUrl, @"获取不到bundle");
if (bundelUrl) {
NSBundle *bundle = [NSBundle bundleWithURL:bundelUrl];
NSString *imagePath = [bundle pathForResource:imageName ofType:@"png"];
NSLog(@"%@",imagePath);
return imagePath;
}else{
return @"";
}
}
```


