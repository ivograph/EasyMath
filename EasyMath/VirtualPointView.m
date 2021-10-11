//
//  VirtualPointView.m
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/10/21.
//

#import "VirtualPointView.h"

@interface VirtualPointView()
@property  (strong) NSColor* circleFill;
@end

@implementation VirtualPointView

-(void)awakeFromNib{
    self.circleFill = [NSColor  windowBackgroundColor];
}

-(void)mouseDown:(NSEvent *)event{
    if(self.circleFill==[NSColor blackColor])
        self.circleFill = [NSColor windowBackgroundColor];
    else
        self.circleFill = [NSColor blackColor];
    
    self.needsDisplay = YES;
}
    
-(void)reset{
    self.circleFill = [NSColor  windowBackgroundColor];
    self.needsDisplay = YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [self drawCircle:NSMakeRect(10, 10, 10, 10) stroke:[NSColor blackColor] fill:self.circleFill];
}

-(void)drawCircle:(NSRect)rect stroke: (NSColor*)stroke fill: (NSColor*)fill {
    // Get the graphics context that we are currently executing under
    NSGraphicsContext* gc = [NSGraphicsContext currentContext];

    // Save the current graphics context settings
    [gc saveGraphicsState];

    // Set the color in the current graphics context for future draw operations
    [stroke setStroke];
    [fill setFill];

    // Create our circle path
    NSBezierPath* circlePath = [NSBezierPath bezierPath];
    [circlePath appendBezierPathWithOvalInRect: rect];

    // Outline and fill the path
    [circlePath stroke];
    [circlePath fill];

    // Restore the context to what it was before we messed with it
    [gc restoreGraphicsState];
}

@end
