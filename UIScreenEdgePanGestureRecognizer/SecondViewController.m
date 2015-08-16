//
//  SecondViewController.m
//  UIScreenEdgePanGestureRecognizer
//
//  Created by je_ffy on 15/8/16.
//  Copyright (c) 2015年 je_ffy. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIGestureRecognizerDelegate> {
    UIView *redView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = self.view.frame;
    [self.view addSubview:redView];
    
    UIScreenEdgePanGestureRecognizer *leftPan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(leftPan:)];
    leftPan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:leftPan];
    
}


- (void)leftPan:(UIScreenEdgePanGestureRecognizer *)gesture {
    UIView *localView = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    
    
    NSLog(@" TouchView = %@",localView);
    
    if (gesture.state == UIGestureRecognizerStateBegan ||
        gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:gesture.view];
        
        redView.center = CGPointMake(self.view.frame.size.width/2 +translation.x,
                                     self.view.frame.size.height/2);
        
    }else {
        [UIView animateWithDuration:0.33 animations:^{
            redView.center = CGPointMake(self.view.frame.size.width/2,
                                         self.view.frame.size.height/2);
        }];
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}
/*
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
}
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
