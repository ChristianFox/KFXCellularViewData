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
#import <KFXAdditions/UICollectionViewController+KFXAdditions.h>
#import "UIViewController+KFXProgressHUD.h"
// Protocols
#import "KFXViewControllerNavigationDelegate.h"

@interface KFXCollectionViewController : UICollectionViewController

// Delegate
@property (weak, nonatomic) id<KFXViewControllerNavigationDelegate> navigationDelegate;
// Flags
@property (nonatomic,getter=isVisible) BOOL visible;

+(instancetype)initiliseWithFlowLayout;

@end
