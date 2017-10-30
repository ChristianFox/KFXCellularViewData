/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/



#import "UIViewController+KFXProgressHUD.h"
//#import <MRProgress/MRProgress.h>
#import <SVProgressHUD/SVProgressHUD.h>


@implementation UIViewController (KFXProgressHUD)



//--------------------------------------------------------
#pragma mark Progress HUD
//--------------------------------------------------------
-(void)kfx_showProgressHUDWithTitle:(NSString *)title{
//	NSLog(@"%s, NOT IMPLEMENTED",__PRETTY_FUNCTION__);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSString *safeTitle = title;
//        if (safeTitle == nil) {
//            safeTitle = @"";
//        }
//        [MRProgressOverlayView showOverlayAddedTo:self.view title:safeTitle mode:MRProgressOverlayViewModeIndeterminate animated:YES];
//    });
	
	[SVProgressHUD showWithStatus:title];
}

-(void)kfx_showProgressHUDWithTitle:(NSString *)title addedToView:(UIView *)view{
//	NSLog(@"%s, NOT IMPLEMENTED",__PRETTY_FUNCTION__);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSString *safeTitle = title;
//        if (safeTitle == nil) {
//            safeTitle = @"";
//        }
//        [MRProgressOverlayView showOverlayAddedTo:view title:safeTitle mode:MRProgressOverlayViewModeIndeterminateSmall animated:YES];
//    });
	[self kfx_showProgressHUDWithTitle:title];
}



-(void)kfx_dismissAllProgressHUDs{
    
    [self kfx_dismissAllProgressHUDsForView:self.view];
}

-(void)kfx_dismissAllProgressHUDsForView:(UIView *)view{
//	NSLog(@"%s, NOT IMPLEMENTED",__PRETTY_FUNCTION__);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [MRProgressOverlayView dismissAllOverlaysForView:view
//                                                animated:YES];
//    });
	[SVProgressHUD dismiss];
}




@end
