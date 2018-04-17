//
//  ViewController.m
//  CodeJam_01_NSSet
//
//  Created by anthony volkov on 4/16/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "ViewController.h"

#define TICK(XXX) NSDate *XXX = [NSDate date]
#define TOCK(XXX) NSLog(@"%s = %f", #XXX, -[XXX timeIntervalSinceNow])

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        
#pragma mark - 1. Create NSArray, containing 30 objects. Add duplicates to array.
        NSMutableArray *temp = [@[] mutableCopy];
        for (int q = 0; q < 30; q++) {
            [temp addObject:[NSNumber numberWithInt:arc4random()%10]];
        }
        NSArray *arrayWithThirtyObjects = [temp copy];
        
        [temp release];
        //    NSLog(@"%lu", (unsigned long)[arrayWithThirtyObjects count]);
        //    NSLog(@"%@", arrayWithThirtyObjects);
        
        
        
#pragma mark - 2. Use NSSet to exclude duplicates from array.
        NSSet *setFromArrayWithThirtyObjects = [NSSet setWithArray:arrayWithThirtyObjects];
        //    NSLog(@"%lu", (unsigned long)[setFromArray count]);
        //    NSLog(@"%@", setFromArray);
        
        [arrayWithThirtyObjects release];
        
        
        
#pragma mark - 3. Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained inside an array. Transform array into NSSet and check whether number 74 is contained inside NSSet.
        NSMutableArray *arrayWithHundredNumbers = [@[] mutableCopy];
        for (int q = 1; q <= 100; q++) {
            [arrayWithHundredNumbers addObject:[NSNumber numberWithInt:q]];
        }
//        NSLog(@"%lu", (unsigned long)[arrayWithHundredNumbers count]);
//        NSLog(@"%@", arrayWithHundredNumbers);
        
        
        //checking time in array
        NSDate *timeStartCheckingArray = [NSDate date];
//        TICK(checkingTimeInArray2);  //too slow
        if ([arrayWithHundredNumbers containsObject:@74]) {
//            NSLog(@"arrayWithHundredNumbers contain number - 74");
        }
        NSTimeInterval checkingTimeInArray = -[timeStartCheckingArray timeIntervalSinceNow];
        NSLog(@"checkingTimeInArray = %f", checkingTimeInArray);
//        TOCK(checkingTimeInArray2);  //too slow
        
        
        
        //checking time in set
        NSSet *setFromArrayWithHundredNumbers = [NSSet setWithArray:arrayWithHundredNumbers];
//        NSLog(@"%lu", (unsigned long)[setFromArrayWithHundredNumbers count]);
//        NSLog(@"%@", setFromArrayWithHundredNumbers);
        NSDate *timeStartCheckingSet = [NSDate date];
//        TICK(checkingTimeInSet1);  //too slow
        if ([setFromArrayWithHundredNumbers containsObject:@74]) {
//            NSLog(@"setFromArrayWithHundredNumbers contain number - 74");
        }
        NSTimeInterval checkingTimeInSet = -[timeStartCheckingSet timeIntervalSinceNow];
        NSLog(@"checkingTimeInArray = %f", checkingTimeInSet);
//        TOCK(checkingTimeInSet1);  //too slow
        
        
        
        //release
        [arrayWithHundredNumbers release];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
