#
# Be sure to run `pod lib lint TXPropertySaver.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TXPropertySaver"
  s.version          = "1.0.2"
  s.summary          = "UIView cateogory to save (and load) all current properties values."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
# TXPropertySaver

## Usage

We you want to save all properties, you can call:

```
[self.mysomeview saveProperties];
```
And then, when you want to load all properties back, you can call:

```
[self.mysomeview loadProperties];
```

If you want to access saved properties, you can call:

```
UIView *savedProperties = [self.mysomeview savedProperties];
```

And access the ```savedProperties``` properties.

## Properties

Not all properties are saved. Here is the list of properties that are being saved:

- backgroundColor
- hidden
- alpha
- opaque
- clipsToBounds
- clearsContextBeforeDrawing
- userInteractionEnabled
- multipleTouchEnabled
- exclusiveTouch
- frame
- bounds
- center
- transform
- autoresizingMask
- autoresizesSubviews
- contentMode
- contentStretch
- contentScaleFactor
- tag

## Installation

TXPropertySaver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TXPropertySaver"
```

## License

Copyright (c) 2015 Toshiro Sugii

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
                       DESC

  s.homepage         = "https://github.com/rtoshiro/TXPropertySaver"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "rtoshiro" => "rtoshiro@gmail.com" }
  s.source           = { :git => "https://github.com/rtoshiro/TXPropertySaver.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TXPropertySaver' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
