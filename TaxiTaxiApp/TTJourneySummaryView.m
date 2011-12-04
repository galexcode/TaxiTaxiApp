//
//  TTJourneySummaryView.m
//  TaxiTaxiApp
//
//  Created by Michael Wawra on 19/11/2011.
//  Copyright (c) 2011 Wawra Corp. All rights reserved.
//

#import "TTJourneySummaryView.h"
#import "Checkin.h"

@implementation TTJourneySummaryView

@synthesize managedObjectContext;
@synthesize movementImage;

-(void)initCustom
{
    NSLog(@"init: Setting image to same-up.png");

    if(movementImage != nil)
    {
        NSLog(@"image already displayed:  %@",movementImage.image);
    }
    else NSLog(@"Movement Image is Nil!");
    
    for (UIView * views in [self subviews])
    {
        NSLog(@"Found a %@",views);
    }
    
    movementImage = (UIImageView *)[self viewWithTag: 1];
    
    //test the look of different images...
    int dir =  (arc4random() % 9) + 1;
    
    NSLog(@"%d is chosen",dir);
    
    switch(dir)
    {
        case 0: 
            [movementImage setImage:[UIImage imageNamed:@"up-up.png"]]; 
            break;
        case 1: 
            [movementImage setImage:[UIImage imageNamed:@"up-down.png"]]; 
            break;
        case 2: 
            [movementImage setImage:[UIImage imageNamed:@"up-same.png"]]; 
            break;
        case 3: 
            [movementImage setImage:[UIImage imageNamed:@"same-up.png"]]; 
            break;
        case 4: 
            [movementImage setImage:[UIImage imageNamed:@"same-down.png"]]; 
            break;
        case 5: 
            [movementImage setImage:[UIImage imageNamed:@"same-same.png"]]; 
            break;
        case 6: 
            [movementImage setImage:[UIImage imageNamed:@"down-up.png"]]; 
            break;
        case 7: 
            [movementImage setImage:[UIImage imageNamed:@"down-down.png"]]; 
            break;
        case 8: 
            [movementImage setImage:[UIImage imageNamed:@"down-same.png"]]; 
            break;
        default:
            break;
    }
    
    
}

- (void) weekChangeData
{
    //get the last month, current month, last week, and current week to see what the change is.
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Checkin" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *checkinDateSort = [[NSSortDescriptor alloc] initWithKey:@"checkin" ascending:NO];
    NSSortDescriptor *checkoutDateSort = [[NSSortDescriptor alloc] initWithKey:@"checkout"ascending: NO];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:checkinDateSort,checkoutDateSort, nil];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) 
    {
        NSLog(@"Failed to get checkin objects.");
    }
    else NSLog(@"Got %d records from checkin query...",[mutableFetchResults count]);
    
    //[self setJourneyHistory: mutableFetchResults];
}

- (void) didMoveToWindow
{
    [self initCustom];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCustom];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
