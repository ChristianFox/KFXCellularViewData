
/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/




#import "KFXViewController.h"
// Cocoa Frameworks
@import MessageUI;

@interface KFXViewController (MFMessageComposer) <MFMessageComposeViewControllerDelegate>

-(void)presentSMSComposerWithSubject:(NSString*)subject message:(NSString*)message receipients:(NSArray<NSString*>*)recipients;


@end
