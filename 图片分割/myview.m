//
//  myview.m
//  huatu
//
//  Created by admin on 16/2/17.
//  Copyright © 2016年 3lengjing. All rights reserved.
//

#import "myview.h"

@implementation myview{
    int i;
}
+ (Class)layerClass
{
    return [CATiledLayer class];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
-(id)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor clearColor];
        [(CATiledLayer*)self.layer setTileSize:CGSizeMake((410/2)*self.contentScaleFactor, (554/2)*self.contentScaleFactor)];
    }

    return self;
    
}
//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
////    CGRect rect=CGContextGetClipBoundingBox(ctx);
////    CGContextSetFillColorWithColor(ctx, [UIColor colorWithPatternImage:[UIImage imageNamed:@"首页.jpg"]].CGColor);
////    CGContextDrawTiledImage(ctx, self.bounds, [UIImage imageNamed:@"首页.jpg"].CGImage);
////    CGContextDrawTiledImage(ctx, self.bounds, [UIImage imageNamed:@"首页.jpg"].CGImage);
////    CGContextDrawImage(ctx, self.bounds, [UIImage imageNamed:@"首页.jpg"].CGImage);
//    
//    CGContextDrawImage(ctx, self.bounds, [UIImage imageNamed:@"首页.jpg"].CGImage);
//
//////
////    CGContextFillPath(ctx);
////    layer.contents=(id)[UIImage imageNamed:@"首页.jpg"].CGImage;
////    CGContextAddRect(ctx, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
////    CGContextFillPath(ctx);
////    [[CIContextcontextWithCGContext:ctx options:nil] drawImage:imageatPoint:CGPointMake(0, 0) fromRect:CGRectMake(0, 0, 6064, 4128)];
////
//}
- (void)drawRect:(CGRect)rect
{
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"wenwuxiangqingyemianj%d_%d.jpg",(int)(rect.origin.x/(410/2)),(int)(rect.origin.y/(554/2))]];
    [image drawInRect:rect];
//  UIImage *image = [UIImage imageNamed:@"Shouye_ChangTu.jpg"];
//  [image drawInRect:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height)];
//  CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextDrawImage(context, self.bounds, [UIImage imageNamed:@"首页.jpg"].CGImage);
//
////    UIGraphicsPushContext(context);
////    [image drawInRect:self.bounds];
////    UIGraphicsPopContext();
////    UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"wenw%d_%d",(int)(rect.origin.x/1024),(int)(rect.origin.x/64)]];
////        UIImage *image = [UIImage imageNamed:@"wenw%d"];
    
////        CGRect rect1 = self.bounds;
//        CGContextDrawImage(context, rect, [image CGImage]);
////
//    i++;
//
//
}


@end
