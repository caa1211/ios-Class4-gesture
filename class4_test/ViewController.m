//
//  ViewController.m
//  class4_test
//
//  Created by Carter Chang on 7/3/15.
//  Copyright (c) 2015 Carter Chang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *monkeyPanGR;
@property (weak, nonatomic) IBOutlet UIImageView *monkeyImage;
@property (assign, nonatomic) CGPoint monkeyOffsetPos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.monkeyImage.alpha = 0.3;
    
    self.monkeyPanGR.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    

    return YES;
}


- (IBAction)onMonkeyLongPress:(UILongPressGestureRecognizer *)sender {
    
      if(sender.state == UIGestureRecognizerStateBegan){
          
          [UIView animateWithDuration:0.2 animations:^{
              self.monkeyImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
          }];
          
      }else if(sender.state == UIGestureRecognizerStateEnded){
          
          [UIView animateWithDuration:0.2 animations:^{
              self.monkeyImage.transform = CGAffineTransformMakeScale(1.0, 1.0);
          }];
          
      }
    
}

- (IBAction)onMonkeyPinch:(UIPinchGestureRecognizer *)sender {
    self.monkeyImage.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);

    
}

- (IBAction)onMonkeyDrag:(UIPanGestureRecognizer *)sender {
    CGPoint loc = [sender locationInView:self.view];
    
    if(sender.state == UIGestureRecognizerStateBegan){
        self.monkeyOffsetPos = CGPointMake(self.monkeyImage.center.x - loc.x, self.monkeyImage.center.y - loc.y);
    
        
    }else if(sender.state == UIGestureRecognizerStateChanged){
        self.monkeyImage.center = CGPointMake(self.monkeyOffsetPos.x + loc.x, self.monkeyOffsetPos.y + loc.y);
    }
    
//    else if(sender.state == UIGestureRecognizerStateEnded){
//        
//        [UIView animateWithDuration:0.2 animations:^{
//            self.monkeyImage.transform = CGAffineTransformMakeScale(1.0, 1.0);
//        }];
//        
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onViewTap:(UITapGestureRecognizer *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"hahaha" message:@"You miss me" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAuction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAuction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (IBAction)onMonkeyTap:(UITapGestureRecognizer *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ouch" message:@"You got me" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAuction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAuction];
    
    [self presentViewController:alertController animated:YES completion:nil];

    
}

- (IBAction)onGoTouchUp:(id)sender {

    // Damping
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.1 initialSpringVelocity:0.0 options:nil animations:^{
        self.monkeyImage.center = CGPointMake(self.monkeyImage.center.x, self.monkeyImage.center.y +300);
        self.monkeyImage.alpha = 1.0;
        self.monkeyImage.transform = CGAffineTransformMakeScale(1.5, 1.5);

    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse
                         |UIViewAnimationOptionAllowUserInteraction animations:^{
            
            self.monkeyImage.transform = CGAffineTransformRotate(self.monkeyImage.transform, M_PI_4);
            
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hee" message:@"having a great time" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAuction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [alertController addAction:okAuction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            
        } completion:nil];
        
        
    }];
    
    
    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.monkeyImage.center = CGPointMake(self.monkeyImage.center.x, self.monkeyImage.center.y +300);
//        self.monkeyImage.alpha = 1.0;
//        self.monkeyImage.transform = CGAffineTransformMakeScale(1.5, 1.5);
//        // self.monkeyImage.transform = CGAffineTransformRotate(self.monkeyImage.transform, M_PI_4);
//    } completion:^(BOOL finished) {
//        
//        
//         [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
//             
//             self.monkeyImage.transform = CGAffineTransformRotate(self.monkeyImage.transform, M_PI_4);
//             
//             
//             UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hee" message:@"having a great time" preferredStyle:UIAlertControllerStyleAlert];
//             
//             UIAlertAction *okAuction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//                 [alertController dismissViewControllerAnimated:YES completion:nil];
//             }];
//             
//             [alertController addAction:okAuction];
//             
//             [self presentViewController:alertController animated:YES completion:nil];
//
//             
//         } completion:nil];
//        
//        
//
//
//    }];
    
    
}

@end
