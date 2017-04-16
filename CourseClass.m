//
//  CourseClass.m
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import "CourseClass.h"

@implementation CourseClass



-(void)defineCourse:(NSString*) theName Begins:(int)start Ends:(int)end Day:(int)dayOfWeek Prof:(NSString *)profName isThereLab:(BOOL)labisthere LabT:(int)labTimeOfDay LabD:(int)labDayOfWeek Credits:(int)creditsEarned Code:(NSString *)BUCourseCode Pic:(UIImage *)colorSquare{
    self.name = theName;
    self.startTime = start;
    self.finishTime = end;
    self.day = dayOfWeek;
    self.courseTeacherName = profName;
    self.lab = labisthere;
    self.labTime = labTimeOfDay;
    self.labDay = labDayOfWeek;
    self.totalCredits = creditsEarned;
    self.courseCode = BUCourseCode;
    self.thumbnail = colorSquare;
    

}

-(NSString *)description {
    return [NSString stringWithFormat:@"Name %@\nStart %i, Finish %i\n Day %i\n Selected %i\n Prof %@\n Lab Time %i Lab Day %i\n Credits Earned %i\n Course Code %@",self.name, self.startTime, self.finishTime, self.day, self.selection, self.courseTeacherName, self.labTime, self.labDay, self.totalCredits, self.courseCode];
}

@end
