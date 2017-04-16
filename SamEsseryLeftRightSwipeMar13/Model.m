//
//  Model.m
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import "Model.h"
#import "AppDelegate.h"
#import "CourseClass.h"

@implementation Model


-(id)init {
    
    self.courseStorage =[CourseClass new];
    self.courseArray = [NSMutableArray array];
    
    self.class1 = [CourseClass new];
    [self.class1 defineCourse:@"Foundations of CS" Begins:830 Ends:1000 Day:24 Prof:@"Madjid" isThereLab:YES LabT:830 LabD:5 Credits:4 Code:@"CS 201" Pic:[UIImage imageNamed:@"Blue-square.jpg"]];
    [self.courseArray addObject:self.class1];
    
    self.class2 =[CourseClass new];
    [self.class2 defineCourse:@"Web Page Dev" Begins:1130 Ends:1300 Day:135 Prof:@"Lin" isThereLab:YES LabT:1330 LabD:1 Credits:4 Code:@"CS203" Pic:[UIImage imageNamed:@"Blue-square.jpg"]];
    [self.courseArray addObject:self.class2];
    
    self.class3 = [CourseClass new];
    [self.class3 defineCourse:@"Intro to Programming" Begins:1130 Ends:1300 Day:24 Prof:@"Nelly" isThereLab:YES LabT:1300 LabD:4 Credits:4 Code:@"CS 211" Pic:[UIImage imageNamed:@"Blue-square.jpg"]];
    [self.courseArray addObject:self.class3];
    
    self.class4 = [CourseClass new];
    [self.class4 defineCourse:@"Mobile Apps" Begins:1000 Ends:1130 Day:13 Prof:@"Salter" isThereLab:YES LabT:1330 LabD:5 Credits:4 Code:@"CS 230" Pic:[UIImage imageNamed:@"Blue-square.jpg"]];
    [self.courseArray addObject:self.class4];
    
    self.class5 = [CourseClass new];
    [self.class5 defineCourse:@"Databases" Begins:1130 Ends:1300 Day:13 Prof:@"Lin" isThereLab:YES LabT:1330 LabD:3 Credits:4 Code:@"CS 307" Pic:[UIImage imageNamed:@"Red-Square.gif"]];
    [self.courseArray addObject:self.class5];
    
    self.class6 = [CourseClass new];
    [self.class6 defineCourse:@"Specifications" Begins:1330 Ends:1500 Day:13 Prof:@"Stefan" isThereLab:NO LabT:0 LabD:0 Credits:3 Code:@"CS 310" Pic:[UIImage imageNamed:@"Red-Square.gif"]];
    [self.courseArray addObject:self.class6];
    
    self.class7 = [CourseClass new];
    [self.class7 defineCourse:@"Algorithms" Begins:830 Ends:1000 Day:24 Prof:@"Nelly" isThereLab:NO LabT:0 LabD:0 Credits:3 Code:@"CS 317" Pic:[UIImage imageNamed:@"Red-Square.gif"]];
    [self.courseArray addObject:self.class7];
    
    self.class8 = [CourseClass new];
    [self.class8 defineCourse:@"Principle Prog Lang" Begins:1300 Ends:1430 Day:24 Prof:@"?" isThereLab:NO LabT:0 LabD:0 Credits:3 Code:@"CS 403" Pic:[UIImage imageNamed:@"purple-square.png"]];
    [self.courseArray addObject:self.class8];
    
    self.class9 = [CourseClass new];
    [self.class9 defineCourse:@"Theory" Begins:1000 Ends:1130 Day:24 Prof:@"Stefan" isThereLab:NO LabT:0 LabD:0 Credits:3 Code:@"CS 455" Pic:[UIImage imageNamed:@"purple-square.png"]];
    [self.courseArray addObject:self.class9];
    
    self.class10 = [CourseClass new];
    [self.class10 defineCourse:@"Grad Seminar" Begins:1330 Ends:1500 Day:5 Prof:@"None" isThereLab:NO LabT:0 LabD:0 Credits:3 Code:@"CS 597f01" Pic:[UIImage imageNamed:@"purple-square.png"]];
    [self.courseArray addObject:self.class10];
    
    NSLog(@"Length %i", self.courseArray.count);
    
    return self;
}






@end
