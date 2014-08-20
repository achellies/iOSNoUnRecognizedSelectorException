//
//  NoUnrecognizedSelectorViewController.m
//  NoUnrecognizedSelectorException
//
//  Created by achellies on 14-8-19.
//  Copyright (c) 2014年 achellies. All rights reserved.
//

#import "NoUnrecognizedSelectorViewController.h"
#import "NoUnrecognizedSelectorMacro.h"
#import "UIButton+NoUnrecognizedSelector.h"

@interface NoUnrecognizedSelectorViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnCategory;
@end

@implementation NoUnrecognizedSelectorViewController

NO_UNRECOGNIZED_SELECTOR

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)customClassAction:(id)sender {
    [self performSelector:@selector(unrecognizedSelector)];
    [self performSelector:@selector(unrecognizedSelector:) withObject:@0];
}

- (IBAction)categoryClassAction:(id)sender {
    [self.btnCategory performSelector:@selector(unrecognizedSelector)];
    [self.btnCategory performSelector:@selector(unrecognizedSelector:) withObject:@0];
}

- (IBAction)nsobjectCategoryAction:(id)sender {
    [self performSelector:@selector(unrecognizedSelector:withObject:) withObject:@0 withObject:@0];
}

@end
