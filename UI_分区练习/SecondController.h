//
//  SecondController.h
//  UI_分区练习
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondViewDelegate <NSObject>

- (void)textFieldOfchange:(NSMutableDictionary *) mdic;

@end


@interface SecondController : UIViewController

@property (nonatomic , assign) id<secondViewDelegate> delegate;

@property (nonatomic, retain) NSMutableDictionary *mdic;

@end
