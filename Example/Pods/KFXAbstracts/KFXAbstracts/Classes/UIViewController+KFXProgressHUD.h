
/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/



#import <UIKit/UIKit.h>

@interface UIViewController (KFXProgressHUD)


//--------------------------------------------------------
#pragma mark Progress HUD
//--------------------------------------------------------
-(void)kfx_showProgressHUDWithTitle:(NSString*)title;
-(void)kfx_showProgressHUDWithTitle:(NSString*)title addedToView:(UIView*)view;
-(void)kfx_dismissAllProgressHUDs;
-(void)kfx_dismissAllProgressHUDsForView:(UIView*)view;


@end
