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

@interface TXPropertyView : UIView

@end

@implementation TXPropertyView

- (UIView *)maskView
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (UIColor *)tintColor
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (UIViewTintAdjustmentMode)tintAdjustmentMode
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (NSArray *)motionEffects
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (NSString *)restorationIdentifier
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (UIView *)superview
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (NSArray *)subviews
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (UIWindow *)window
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (CALayer *)layer
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (UIEdgeInsets)layoutMargins
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (BOOL)preservesSuperviewLayoutMargins
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (NSArray *)gestureRecognizers
{
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"Cannot save %@ property", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

@end

@implementation UIView (PropertySaver)

- (TXPropertyView *)dataContainer
{
  TXPropertyView *properties = objc_getAssociatedObject(self, &kDataContainerKey);
  if ( !properties ) {
    properties = [[TXPropertyView alloc] init];
    objc_setAssociatedObject(self, &kDataContainerKey, properties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#if !__has_feature(objc_arc)
    [properties release];
#endif
  }
  return properties;
}

- (UIView *)savedProperties
{
  return [self dataContainer];
}

- (BOOL)saveProperties
{
  @try {
    TXPropertyView *data = [self dataContainer];
    
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
  if ([self dataContainer])
  {
    @try {
      TXPropertyView *view = [self dataContainer];
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
