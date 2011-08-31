//
//  QuartzFunView.m
//  QuartzFun
//
//  Created by guo gloria on 11-8-28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "QuartzFunView.h"
#import "UIColor-Random.h"

@implementation QuartzFunView

@synthesize firstPoint;
@synthesize lastPoint;
@synthesize currentColor;
@synthesize shapeType;
@synthesize drawImage;
@synthesize useRandomColor;
@synthesize redrawRect;

//pyanfield
// this view is being loaded from a nib, we implement this method. that object instances in nibs are stored as archived objects. we add any initialization code here
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        currentColor = [[UIColor redColor] retain];
        useRandomColor = NO;
        if (drawImage == nil) {
            drawImage = [[UIImage imageNamed:@"iphone.png"] retain];
        }
    }
    return  self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)currentRect
{
    return CGRectMake(firstTouch.x, firstTouch.y, lastTouch.x-firstTouch.x, lastTouch.y-firstTouch.y);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //pyanfield: create a reference to the current context so we know where to draw
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, currentColor.CGColor);
    //CGRect currentRect = CGRectMake(firstTouch.x, firstTouch.y, lastTouch.x-firstTouch.x, lastTouch.y-firstTouch.y);
    
    switch (shapeType) {
        case kLineShap:
            CGContextMoveToPoint(context, firstTouch.x, firstTouch.y);
            CGContextAddLineToPoint(context, lastTouch.x, lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:
            //pyanfield : added the curly braces around the code.because the compliler has a problem with variables declared in the first line after a case statement.
        {
            CGFloat verticalOffset = drawImage.size.height/2;
            CGFloat horizontalOffset = drawImage.size.width/2;
            CGPoint drawPoint = CGPointMake(lastTouch.x - horizontalOffset, lastTouch.y-verticalOffset);
            [drawImage drawAtPoint:drawPoint];
        }
            break;
        default:
            break;
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    lastTouch = [touch locationInView:self];
    
    //pyanfield: entire bounds rectangle as needing to be redrawn.
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    
    //[self setNeedsDisplay];
    if (shapeType == kImageShape) {
        CGFloat horizontalOffset = drawImage.size.width/2;
        CGFloat verticalOffset = drawImage.size.height/2;
        
        redrawRect = CGRectUnion(redrawRect, CGRectMake(lastTouch.x-horizontalOffset, lastTouch.y-verticalOffset, drawImage.size.width, drawImage.size.height));
    } else {
        redrawRect = CGRectUnion(redrawRect, self.currentRect);
    }
    redrawRect = CGRectInset(redrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:redrawRect];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    
    //[self setNeedsDisplay];
    if (shapeType == kImageShape) {
        CGFloat horizontalOffset = drawImage.size.width/2;
        CGFloat verticalOffset = drawImage.size.height/2;
        
        redrawRect = CGRectUnion(redrawRect, CGRectMake(lastTouch.x-horizontalOffset, lastTouch.y-verticalOffset, drawImage.size.width, drawImage.size.height));
    }
    redrawRect = CGRectUnion(redrawRect, self.currentRect);
    [self setNeedsDisplayInRect:redrawRect];
}

- (void)dealloc
{
    [currentColor release];
    [drawImage release];
    [super dealloc];
}


@end
