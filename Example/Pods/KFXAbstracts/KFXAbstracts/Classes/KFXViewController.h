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
// Categories
#import <KFXAdditions/UIViewController+KFXAdditions.h>
#import "UIViewController+KFXProgressHUD.h"
// Protocols
#import "KFXViewControllerNavigationDelegate.h"

//@class KFXViewController;
//@protocol KFXViewControllerNavigationDelegate <NSObject>
//
//-(void)viewController:(KFXViewController*)presentingViewController
//willNavigateToViewController:(UIViewController*)destinationViewController;
//
//@end

@interface KFXViewController : UIViewController

// Delegate
@property (weak, nonatomic) id<KFXViewControllerNavigationDelegate> navigationDelegate;
// Flags
@property (nonatomic,getter=isVisible) BOOL visible;

@end
