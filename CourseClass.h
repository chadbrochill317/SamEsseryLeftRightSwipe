//
//  CourseClass.h
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseClass : NSObject

@property NSString *name;
@property int startTime;
@property int finishTime;
@property int day;
@property BOOL selection;
@property NSString *courseTeacherName;
@property BOOL lab;
@property int labTime;
@property int labDay;
@property int totalCredits;
@property NSString *courseCode;
@property UIImage *thumbnail;

-(void)defineCourse:(NSString*) theName Begins:(int)start Ends:(int)end Day:(int)dayOfWeek Prof:(NSString *)profName isThereLab:(BOOL)labisthere LabT:(int)labTimeOfDay LabD:(int)labDayOfWeek Credits:(int)creditsEarned Code:(NSString *)BUCourseCode Pic:(UIImage *)colorSquare;



@end
