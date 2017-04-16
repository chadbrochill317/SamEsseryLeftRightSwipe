//
//  ViewController.m
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "AppDelegate.h"

#define LABEL_HEIGHT 105
#define LABEL_WIDTH 250


@interface ViewController ()

@property CGFloat initialHeight;
@property CGFloat initialWidth;
@property CGFloat quarterHeightForSquares;
@property CGFloat swipeCenter;
@property CGFloat centeredScreen;

@property CGPoint rightSwipePosition;
@property CGPoint leftSwipePosition;
@property CGPoint labelPosition;

@property UIView *rightSwipeSquare;
@property UIView *leftSwipeSquare;

@property UILabel *swipeReference;

@property NSArray *courseArray;

@property BOOL selected;

@property int swipeCount;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Determining Screen Size
    self.initialHeight = self.view.frame.size.height;
    self.initialWidth = self.view.frame.size.width;
    self.quarterHeightForSquares = self.initialHeight/4;
    self.swipeCenter = self.initialWidth/4;
    self.centeredScreen = self.initialWidth/2;
    self.swipeCount = 0;
    
    // Positioning Points for Squares and Label
    self.rightSwipePosition = CGPointMake(self.initialWidth - self.swipeCenter, self.initialHeight - self.quarterHeightForSquares);
    self.leftSwipePosition = CGPointMake(self.initialWidth - (self.swipeCenter * 3), self.initialHeight - self.quarterHeightForSquares);
    self.labelPosition = CGPointMake(self.centeredScreen, self.initialHeight - (3 * self.quarterHeightForSquares));
    
    //Label
    self.swipeReference = [[UILabel alloc] initWithFrame:CGRectMake(self.centeredScreen, self.initialHeight, LABEL_WIDTH, LABEL_HEIGHT)];
    self.swipeReference.numberOfLines = 4;
    self.swipeReference.layer.borderColor = [[UIColor grayColor] CGColor];
    self.swipeReference.layer.borderWidth = 5;
    self.swipeReference.center = self.labelPosition;
    self.swipeReference.textAlignment = NSTextAlignmentCenter;
    AppDelegate *appDelegate3 = [[UIApplication sharedApplication]delegate];
    self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate3.theModel.class1.name,appDelegate3.theModel.class1.startTime, appDelegate3.theModel.class1.finishTime, appDelegate3.theModel.class1.day];
    [self.view addSubview:self.swipeReference];
    
    //Green Square
    self.rightSwipeSquare = [[UIView alloc]initWithFrame:CGRectMake(0, 0 , self.initialWidth - self.centeredScreen, self.initialHeight - (3 * self.quarterHeightForSquares))];
    self.rightSwipeSquare.backgroundColor = [UIColor greenColor];
    self.rightSwipeSquare.center = self.rightSwipePosition;
    [self.view addSubview:self.rightSwipeSquare];
    self.rightSwipeSquare.userInteractionEnabled = YES;
    
    
    // Red Square
    self.leftSwipeSquare = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.initialWidth - self.centeredScreen, self.initialHeight - (3 * self.quarterHeightForSquares))];
    self.leftSwipeSquare.backgroundColor = [UIColor redColor];
    self.leftSwipeSquare.center = self.leftSwipePosition;
    [self.view addSubview:self.leftSwipeSquare];
    self.leftSwipeSquare.userInteractionEnabled = YES;
    
    // Right Swipe Gesture
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe1Action:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.rightSwipeSquare addGestureRecognizer:rightSwipe];
    
    
    // Left Swipe Gesture
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe1Action:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.leftSwipeSquare addGestureRecognizer:leftSwipe];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fadeIn:(id)sender{
    [UIView animateWithDuration:2.5
                     animations:^{
                         self.swipeReference.alpha = 1.0;
                         self.swipeReference.layer.transform = CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 0.0f);
                     }];
    
}

-(void)fadeOut:(id)sender{
    [UIView animateWithDuration:1.5
                     animations:^{
                         self.swipeReference.alpha = 0.0;
                         self.swipeReference.layer.transform = CATransform3DMakeRotation(M_PI, 1.0f, 0.0f, 0.0f);
                     }];
    
}


-(void)sizeChange:(id)sender{
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.swipeReference.transform = CGAffineTransformMakeScale(1.5, 1.5);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                          animations:^{
                                              self.swipeReference.transform = CGAffineTransformIdentity;
                                              
                                          }];
                     }];
    
}




-(void)rightSwipe1Action:(UISwipeGestureRecognizer *)swipeGestureRecognizer{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.swipeCount ++;
    [self sizeChange:self];
    if (self.swipeCount == 0) {
        appDelegate.theModel.class3.selection = YES;
    }
    if (self.swipeCount == 1) {
        appDelegate.theModel.class3.selection = YES;
        
    }
    if (self.swipeCount == 2) {
        appDelegate.theModel.class3.selection = YES;
        
    }
    if (self.swipeCount == 3) {
        appDelegate.theModel.class4.selection = YES;
        
    }
    if (self.swipeCount == 4) {
        appDelegate.theModel.class5.selection = YES;
        
    }
    if (self.swipeCount == 5) {
        appDelegate.theModel.class6.selection = YES;
        
    }
    if (self.swipeCount == 6) {
        appDelegate.theModel.class7.selection = YES;
        
    }
    if (self.swipeCount == 7) {
        appDelegate.theModel.class8.selection = YES;
        
    }
    if (self.swipeCount == 8) {
        appDelegate.theModel.class9.selection = YES;
        
    }
    if (self.swipeCount == 9) {
        appDelegate.theModel.class10.selection = YES;
        
    }
    
    
    
    
    if (self.swipeCount == 0) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class1.name, appDelegate.theModel.class1.startTime, appDelegate.theModel.class1.finishTime, appDelegate.theModel.class1.day];
    }
    if (self.swipeCount == 1) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class2.name, appDelegate.theModel.class2.startTime, appDelegate.theModel.class2.finishTime, appDelegate.theModel.class2.day];
    }
    if (self.swipeCount == 2) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class3.name, appDelegate.theModel.class3.startTime, appDelegate.theModel.class3.finishTime, appDelegate.theModel.class3.day];
    }
    if (self.swipeCount == 3) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class4.name, appDelegate.theModel.class4.startTime, appDelegate.theModel.class4.finishTime, appDelegate.theModel.class4.day];
    }
    if (self.swipeCount == 4) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class5.name, appDelegate.theModel.class5.startTime, appDelegate.theModel.class5.finishTime, appDelegate.theModel.class5.day];
    }
    if (self.swipeCount == 5) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class6.name, appDelegate.theModel.class6.startTime, appDelegate.theModel.class6.finishTime, appDelegate.theModel.class6.day];
    }
    if (self.swipeCount == 6) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class7.name, appDelegate.theModel.class7.startTime, appDelegate.theModel.class7.finishTime, appDelegate.theModel.class7.day];
    }
    if (self.swipeCount == 7) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class8.name, appDelegate.theModel.class8.startTime, appDelegate.theModel.class8.finishTime, appDelegate.theModel.class8.day];
    }
    if (self.swipeCount == 8) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class9.name, appDelegate.theModel.class9.startTime, appDelegate.theModel.class9.finishTime, appDelegate.theModel.class9.day];
    }
    if (self.swipeCount == 9) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate.theModel.class10.name, appDelegate.theModel.class10.startTime, appDelegate.theModel.class10.finishTime, appDelegate.theModel.class10.day];
    }
    if (self.swipeCount >= 10) {
        self.swipeReference.text = [NSString stringWithFormat:@"No More Courses"];
    }

    
}

-(void)leftSwipe1Action:(UISwipeGestureRecognizer *)swipeGestureRecognizer{
    AppDelegate *appDelegate2 = [[UIApplication sharedApplication]delegate];
    self.swipeCount ++;
    [self fadeOut:self];
    if (self.swipeCount == 0) {
        appDelegate2.theModel.class3.selection = NO;
        
    }
    if (self.swipeCount == 1) {
        appDelegate2.theModel.class3.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 2) {
        appDelegate2.theModel.class3.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 3) {
        appDelegate2.theModel.class4.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 4) {
        appDelegate2.theModel.class5.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 5) {
        appDelegate2.theModel.class6.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 6) {
        appDelegate2.theModel.class7.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 7) {
        appDelegate2.theModel.class8.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 8) {
        appDelegate2.theModel.class9.selection = NO;
        [self fadeIn:self];
    }
    if (self.swipeCount == 9) {
        appDelegate2.theModel.class10.selection = NO;
        [self fadeIn:self];
    }
    
    
    
    
    if (self.swipeCount == 0) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class1.name, appDelegate2.theModel.class1.startTime, appDelegate2.theModel.class1.finishTime, appDelegate2.theModel.class1.day];
    }
    if (self.swipeCount == 1) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class2.name, appDelegate2.theModel.class2.startTime, appDelegate2.theModel.class2.finishTime, appDelegate2.theModel.class2.day];
    }
    if (self.swipeCount == 2) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class3.name, appDelegate2.theModel.class3.startTime, appDelegate2.theModel.class3.finishTime, appDelegate2.theModel.class3.day];
    }
    if (self.swipeCount == 3) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class4.name, appDelegate2.theModel.class4.startTime, appDelegate2.theModel.class4.finishTime, appDelegate2.theModel.class4.day];
    }
    if (self.swipeCount == 4) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class5.name, appDelegate2.theModel.class5.startTime, appDelegate2.theModel.class5.finishTime, appDelegate2.theModel.class5.day];
    }
    if (self.swipeCount == 5) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class6.name, appDelegate2.theModel.class6.startTime, appDelegate2.theModel.class6.finishTime, appDelegate2.theModel.class6.day];
    }
    if (self.swipeCount == 6) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class7.name, appDelegate2.theModel.class7.startTime, appDelegate2.theModel.class7.finishTime, appDelegate2.theModel.class7.day];
    }
    if (self.swipeCount == 7) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class8.name, appDelegate2.theModel.class8.startTime, appDelegate2.theModel.class8.finishTime, appDelegate2.theModel.class8.day];
    }
    if (self.swipeCount == 8) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class9.name, appDelegate2.theModel.class9.startTime, appDelegate2.theModel.class9.finishTime, appDelegate2.theModel.class9.day];
    }
    if (self.swipeCount == 9) {
        self.swipeReference.text = [NSString stringWithFormat:@"Name: %@\nStart %i\n Finish %i\n Day %i",appDelegate2.theModel.class10.name, appDelegate2.theModel.class10.startTime, appDelegate2.theModel.class10.finishTime, appDelegate2.theModel.class10.day];
    }
    if (self.swipeCount >= 10) {
        self.swipeReference.text = [NSString stringWithFormat:@"No More Courses"];
    }
    
}


@end
