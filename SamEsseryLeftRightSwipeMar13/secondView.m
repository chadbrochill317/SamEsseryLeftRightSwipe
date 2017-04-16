//
//  secondView.m
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import "secondView.h"
#define LABEL_WIDTH 250
#define LABEL_HEIGHT 150

@interface secondView ()

@property CGFloat initialHeight;
@property CGFloat initialWidth;
@property CGFloat quarterHeightForSquares;
@property CGFloat swipeCenter;
@property CGFloat centeredScreen;

@property CGPoint label1;
@property CGPoint label2;
@property CGPoint label3;

@property UILabel *courseLabel1;
@property UILabel *courseLabel2;
@property UILabel *courseLabel3;

@end

@implementation secondView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Determining Screen Size and Label Position
    self.initialHeight = self.view.frame.size.height;
    self.initialWidth = self.view.frame.size.width;
    self.quarterHeightForSquares = self.initialHeight/4;
    self.swipeCenter = self.initialWidth/4;
    self.centeredScreen = self.initialWidth/2;
    self.label1 = CGPointMake(self.centeredScreen, self.quarterHeightForSquares);
    self.label2 = CGPointMake(self.centeredScreen, self.quarterHeightForSquares * 2);
    self.label3 = CGPointMake(self.centeredScreen, self.quarterHeightForSquares *3);
    
    
    //Label 1
    self.courseLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.centeredScreen, self.initialHeight, LABEL_WIDTH, LABEL_HEIGHT)];
    self.courseLabel1.numberOfLines = 4;
    self.courseLabel1.layer.borderColor = [[UIColor grayColor] CGColor];
    self.courseLabel1.layer.borderWidth = 5;
    self.courseLabel1.center = self.label1;
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.courseLabel1.text = [NSString stringWithFormat:@"%@",appDelegate.theModel.class1];
    [self.view addSubview:self.courseLabel1];
    
    //Label 2
    self.courseLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(self.centeredScreen, self.initialHeight, LABEL_WIDTH, LABEL_HEIGHT)];
    self.courseLabel2.layer.borderColor = [[UIColor grayColor] CGColor];
    self.courseLabel2.layer.borderWidth = 5;
    self.courseLabel2.center = self.label2;
    self.courseLabel2.numberOfLines = 4;
    AppDelegate *appDelegate2 = [[UIApplication sharedApplication]delegate];
    self.courseLabel2.text = [NSString stringWithFormat:@"%@",appDelegate2.theModel.class2];
    [self.view addSubview:self.courseLabel2];
    
    //Label 3
    self.courseLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(self.centeredScreen, self.initialHeight, LABEL_WIDTH, LABEL_HEIGHT)];
    self.courseLabel3.layer.borderColor = [[UIColor grayColor] CGColor];
    self.courseLabel3.layer.borderWidth = 5;
    self.courseLabel3.center = self.label3;
    self.courseLabel3.numberOfLines = 4;
    AppDelegate *appDelegate3 = [[UIApplication sharedApplication]delegate];
    self.courseLabel3.text = [NSString stringWithFormat:@"%@",appDelegate3.theModel.class3];
    [self.view addSubview:self.courseLabel3];
      
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
