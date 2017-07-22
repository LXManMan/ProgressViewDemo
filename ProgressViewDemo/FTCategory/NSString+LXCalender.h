//
//  NSString+LXCalender.h
//  button
//
//  Created by zhongzhi on 2017/5/25.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXCalender)
/** 每周第一天 */
+(NSString *)getWeekFirstDay;
/**每月第一天  */

+(NSString *)getMonthFirstDay;
/** 现在 */

+(NSString *)getNow;
@end
