//
//  ViewController2.m
//  SamEsseryLeftRightSwipe
//
//  Created by Sam Essery on 2015-03-30.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import "ViewController2.h"

#define STARTING_X 0
#define STARTING_Y 0
#define SIZE_TO_FIT 0
#define BUTTON_WIDTH 350
#define BUTTON_HEIGHT 55
#define NUMBER_OF_TAPS 1
#define NUMBER_OF_LINES 12
#define FONT_SIZE 28
#define REGISTER_MEASURMENT 100
#define WIDTH 225

@interface ViewController2 ()

@property UIScrollView *detailScrollView;

@property CGFloat initialHeight;
@property CGFloat initialWidth;
@property CGFloat quarterHeightForSquares;
@property CGFloat swipeCenter;
@property CGFloat centeredScreen;
@property CGFloat threeQuarterHeight;
@property CGFloat quarterWidth;

@property UILabel *infoDisplay;
@property UILabel *selectionDisplay;
@property UILabel *registerButton;
@property UILabel *registerProcessSuccess;

@property NSMutableURLRequest *request;
@property NSURLConnection *urlConnection;
@property NSString *post;

@property NSData *dataResponse;

@end

@implementation ViewController2

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
    
    // Determining Screen Size
    self.initialHeight = self.view.frame.size.height;
    self.initialWidth = self.view.frame.size.width;
    self.quarterHeightForSquares = self.initialHeight/4;
    self.swipeCenter = self.initialWidth/4;
    self.centeredScreen = self.initialWidth/2;
    self.threeQuarterHeight = self.quarterHeightForSquares * 3;
    self.quarterWidth = self.initialWidth/4;

    //Create Scrool View
    self.detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(STARTING_X, STARTING_Y, self.initialWidth, self.threeQuarterHeight)];
    
    //CREATE THE CONTENT SIZE OF THE SCROLLER
    self.detailScrollView.contentSize = CGSizeMake(self.initialWidth, self.threeQuarterHeight);
    
    // SET COLOR ETC
    [self.detailScrollView setBackgroundColor:[UIColor grayColor]];
    [self.detailScrollView setScrollEnabled:YES];
    
    // ADD TO PARENT VIEW
    [self.view addSubview:self.detailScrollView];
    
    // Create Label and Display Information
    self.infoDisplay = [[UILabel alloc] initWithFrame:CGRectMake(STARTING_X, STARTING_Y + BUTTON_HEIGHT + 10, SIZE_TO_FIT, SIZE_TO_FIT)];
    self.infoDisplay.numberOfLines = NUMBER_OF_LINES;
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    appDelegate.theModel.courseStorage = [appDelegate.theModel.courseArray objectAtIndex:self.Position];
    self.infoDisplay.text = [NSString stringWithFormat:@"Name: %@\nStart: %i\nFinish: %i\nDay(s): %i\nProf: %@\nLab Time: %i\nLab Day: %i\nCredits Earned: %i\nCourse Code: %@",appDelegate.theModel.courseStorage.name, appDelegate.theModel.courseStorage.startTime, appDelegate.theModel.courseStorage.finishTime, appDelegate.theModel.courseStorage.day, appDelegate.theModel.courseStorage.courseTeacherName, appDelegate.theModel.courseStorage.labTime, appDelegate.theModel.courseStorage.labDay, appDelegate.theModel.courseStorage.totalCredits, appDelegate.theModel.courseStorage.courseCode];
    [self.infoDisplay setFont: [UIFont fontWithName:@"Times New Roman" size:FONT_SIZE]];
    [self.infoDisplay sizeToFit];
    self.infoDisplay.textColor = [UIColor whiteColor];
    [self.detailScrollView addSubview:self.infoDisplay];
    
    // Create Selected Label
    self.selectionDisplay = [[UILabel alloc] initWithFrame:CGRectMake(STARTING_X, STARTING_Y, BUTTON_WIDTH, BUTTON_HEIGHT)];
    if (appDelegate.theModel.courseStorage.selection == YES) {
        self.selectionDisplay.text =[NSString stringWithFormat:@"Selected: Yes"];
    }else {
        self.selectionDisplay.text = [NSString stringWithFormat:@"Selected: No"];
    }
    [self.selectionDisplay setFont: [UIFont fontWithName:@"Times New Roman" size:FONT_SIZE]];
    self.selectionDisplay.textColor = [UIColor whiteColor];
    [self.detailScrollView addSubview:self.selectionDisplay];
    
    // IF statement for Registering
    if (appDelegate.theModel.courseStorage.selection == YES) {
        [self.registerButton setHidden:YES];
        [self.registerProcessSuccess setHidden:YES];
    }else {
        return;
    }
    
    // Create Register Button
    self.registerButton = [[UILabel alloc] initWithFrame:CGRectMake(STARTING_X, self.initialHeight - REGISTER_MEASURMENT, REGISTER_MEASURMENT, BUTTON_HEIGHT)];
    self.registerButton.backgroundColor = [UIColor redColor];
    self.registerButton.text = @"Register";
    self.registerButton.textAlignment = NSTextAlignmentCenter;
    [self.registerButton setFont:[UIFont fontWithName:@"Times New Roman" size:FONT_SIZE]];
    [self.view addSubview:self.registerButton];
    UITapGestureRecognizer *registerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registerTapAction:)];
    registerTap.numberOfTapsRequired = NUMBER_OF_TAPS;
    self.registerButton.userInteractionEnabled = YES; 
    [self.registerButton addGestureRecognizer:registerTap];
    
    // Create Register Status Button
    self.registerProcessSuccess = [[UILabel alloc] initWithFrame:CGRectMake(STARTING_X, self.initialHeight - BUTTON_HEIGHT, self.initialWidth, BUTTON_HEIGHT)];
    self.registerProcessSuccess.backgroundColor = [UIColor whiteColor];
    self.registerProcessSuccess.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.registerProcessSuccess];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerTapAction:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self postRequest];
}


// Built in Method
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Received Response");
    self.dataResponse = [[NSMutableData alloc] init];
}

// Built in Method
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    self.dataResponse = data;
}

// Built in Method
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *responseString = [[NSString alloc] initWithData:self.dataResponse encoding:NSUTF8StringEncoding];
    self.registerProcessSuccess.text = responseString;
    
}



// Built in Method
-(void)postRequest{
    NSLog(@"Post Called");
    //create url request
    self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://cs330.bucsclub.ca/Register.aspx"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    // Set HTTP as POST
    [self.request setHTTPMethod:@"POST"];
    
    self.registerProcessSuccess.text = @"Wait for Response";
    
    //Course ID to Post
    AppDelegate *appDelegate2 = [[UIApplication sharedApplication]delegate];
    NSString *postString = [NSString stringWithFormat:@"course_id=%@", appDelegate2.theModel.courseStorage.courseCode];;
    // turn string into data for HTML
    [self.request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog (@"COURSE Tamie %@", postString);
    
    [self makeAConnection];
    
}

-(void)makeAConnection{
    NSLog(@"Make a Connection");
    
    //creat a connection
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:self.request delegate:self];
}



@end
