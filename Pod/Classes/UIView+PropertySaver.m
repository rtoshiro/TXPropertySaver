//
//  UIView+PropertySaver.m
//  Pods
//
//  Created by Toshiro Sugii on 9/14/15.
//
//

#import <objc/runtime.h>
#import "UIView+PropertySaver.h"

static const int ksavedPropertiesKey;

@interface TXsavedProperties : UIView

@end

@implementation TXsavedProperties

@end

@implementation UIView (PropertySaver)

- (UIView *)savedProperties
{
  TXsavedProperties *properties = objc_getAssociatedObject(self, &ksavedPropertiesKey);
  if ( !properties ) {
    properties = [[TXsavedProperties alloc] init];
    objc_setAssociatedObject(self, &ksavedPropertiesKey, properties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#if !__has_feature(objc_arc)
    [properties release];
#endif
  }
  return properties;
}

- (BOOL)saveProperties
{
  @try {
    TXsavedProperties *data = (TXsavedProperties *)[self savedProperties];
    
    data.backgroundColor = self.backgroundColor;
    data.hidden = self.hidden;
    data.alpha = self.alpha;
    data.opaque = self.opaque;
    data.clipsToBounds = self.clipsToBounds;
    data.clearsContextBeforeDrawing = self.clearsContextBeforeDrawing;
    
    data.userInteractionEnabled = self.userInteractionEnabled;
    data.multipleTouchEnabled = self.multipleTouchEnabled;
    data.exclusiveTouch = self.exclusiveTouch;
    
    data.frame = self.frame;
    data.bounds = self.bounds;
    data.center = self.center;
    data.transform = self.transform;
    
    data.autoresizingMask = self.autoresizingMask;
    data.autoresizesSubviews = self.autoresizesSubviews;
    data.contentMode = self.contentMode;
//    data.contentStretch = self.contentStretch;

    data.contentScaleFactor = self.contentScaleFactor;

    data.tag = self.tag;
    
    return YES;
  }
  @catch (NSException *exception) {
    NSLog(@"Exception %@", exception);
  }
  @finally {
    
  }
  return NO;
}

- (BOOL)loadProperties
{
  if ([self savedProperties])
  {
    @try {
      TXsavedProperties *view = (TXsavedProperties *)[self savedProperties];
      if (view)
      {
        NSLog(@"view %@", view);
        
        self.backgroundColor = view.backgroundColor;
        self.hidden = view.hidden;
        self.alpha = view.alpha;
        self.opaque = view.opaque;
        self.clipsToBounds = view.clipsToBounds;
        self.clearsContextBeforeDrawing = view.clearsContextBeforeDrawing;
        
        self.userInteractionEnabled = view.userInteractionEnabled;
        self.multipleTouchEnabled = view.multipleTouchEnabled;
        self.exclusiveTouch = view.exclusiveTouch;
        
        self.frame = view.frame;
        self.bounds = view.bounds;
        self.center = view.center;
        self.transform = view.transform;
        
        self.autoresizingMask = view.autoresizingMask;
        self.autoresizesSubviews = view.autoresizesSubviews;
        self.contentMode = view.contentMode;
//        self.contentStretch = view.contentStretch;

        self.contentScaleFactor = view.contentScaleFactor;

        self.tag = view.tag;
        
        return YES;
      }
    }
    @catch (NSException *exception) {
      NSLog(@"Exception: %@", exception);
    }
    @finally {
      
    }
  }
  return NO;
}

@end
