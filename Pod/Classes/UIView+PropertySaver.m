//
//  UIView+PropertySaver.m
//  Pods
//
//  Created by Toshiro Sugii on 9/14/15.
//
//

#import <objc/runtime.h>
#import "UIView+PropertySaver.h"

static const int kDataContainerKey;

@interface TXDataContainer : NSObject

@property (nonatomic, strong) NSData *data;

@end

@implementation TXDataContainer

@end

@implementation UIView (PropertySaver)

- (TXDataContainer *)dataContainer
{
  TXDataContainer *properties = objc_getAssociatedObject(self, &kDataContainerKey);
  if ( !properties ) {
    properties = [[TXDataContainer alloc] init];
    objc_setAssociatedObject(self, &kDataContainerKey, properties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#if !__has_feature(objc_arc)
    [properties release];
#endif
  }
  return properties;
}

- (BOOL)saveProperties
{
  @try {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [self dataContainer].data = data;
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
  if ([self dataContainer] && [self dataContainer].data)
  {
    @try {
      UIView *view = [NSKeyedUnarchiver unarchiveObjectWithData:[self dataContainer].data];
      if (view)
      {
        NSLog(@"view %@", view);
        
        self.backgroundColor = view.backgroundColor;
        self.hidden = view.hidden;
        self.alpha = view.alpha;
        self.opaque = view.opaque;
        self.tintColor = view.tintColor;
        self.tintAdjustmentMode = view.tintAdjustmentMode;
        self.clipsToBounds = view.clipsToBounds;
        self.clearsContextBeforeDrawing = view.clearsContextBeforeDrawing;
        self.maskView = view.maskView;
        
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
        self.contentStretch = view.contentStretch;
        
        self.layoutMargins = view.layoutMargins;
        self.preservesSuperviewLayoutMargins = view.preservesSuperviewLayoutMargins;
        
        self.contentScaleFactor = view.contentScaleFactor;
        self.gestureRecognizers = view.gestureRecognizers;
        
        self.motionEffects = view.motionEffects;
        self.restorationIdentifier = view.restorationIdentifier;
        
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
