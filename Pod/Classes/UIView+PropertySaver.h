//
//  UIView+PropertySaver.h
//  Pods
//
//  Created by Toshiro Sugii on 9/14/15.
//
//

#import <UIKit/UIKit.h>

@interface UIView (PropertySaver)

- (BOOL)saveProperties;
- (BOOL)loadProperties;
- (UIView *)savedProperties;

@end
