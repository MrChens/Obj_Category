// NSDate+CupertinoYankee.m
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
#import "NSDate+JLCBeginAndEndDate.h"

@implementation NSDate (MCTBeginAndEndDate)
- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfDay] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:self];
    
    NSInteger offset = [components weekday] - (NSInteger)[calendar firstWeekday];
    [components setDay:[components day] - offset];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfMonth:1];
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfWeek] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:1];
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfMonth] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self];
    
    return [calendar dateFromComponents:components];
}
#pragma mark -

- (NSDate *)endOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:1];
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark - 

-(NSString *)weekDayOfThisDate{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSInteger weekDay = [components weekday];
    switch (weekDay) {
        case 1:
//            return @"Sunday";
            return @"星期天";
            break;
        case 2:
//            return @"Monday";
            return @"星期一";
            break;
        case 3:
//            return @"Tuesday";
            return @"星期二";
            break;
        case 4:
//            return @"Wednesday";
            return @"星期三";
            break;
        case 5:
//            return @"Thursday";
            return @"星期四";
            break;
        case 6:
//            return @"Friday";
            return @"星期五";
            break;
        case 7:
//            return @"Saturday";
            return @"星期六";
            break;
        default:
            break;
    }
    return nil;
}
#pragma mark -

-(NSDate *)dateByAddingDays:(NSInteger)numberOfDays{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:numberOfDays];
    
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:[self beginningOfDay] options:0];
    return newDate;
}
#pragma mark -
-(NSDate *)dateByAddingMonths:(NSInteger)numberOfMonths{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:numberOfMonths];
    
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:[self beginningOfMonth] options:0];
    
    return newDate;
}

#pragma mark -
-(NSDate *)dateByAddingYears:(NSInteger)numberOfYears{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:numberOfYears];
    
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0];
    
    return newDate;
}

#pragma mark - 
-(NSInteger)calculatingDaysBetweenBeginDate:(NSDate *)aStartDay andEndDate:(NSDate *)aEndDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    components = [calendar components:NSCalendarUnitDay fromDate:[aStartDay beginningOfDay] toDate:[aEndDay endOfDay] options:0];
    return components.day;
}
@end
