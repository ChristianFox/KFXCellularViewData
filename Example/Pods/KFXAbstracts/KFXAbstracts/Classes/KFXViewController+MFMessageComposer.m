/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/





#import "KFXViewController+MFMessageComposer.h"

// Pods
#import <KFXAdditions/UIViewController+KFXAdditions.h>



@implementation KFXViewController (MFMessageComposer)

-(void)presentSMSComposerWithSubject:(NSString *)subject message:(NSString *)message receipients:(NSArray<NSString*>*)recipients{
    
    if (![MFMessageComposeViewController canSendText]) {
        
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"It is not possible to send SMS from this device.", @"")];
        
    }else{
        
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setBody:message];
        [messageController setSubject:subject];
        [messageController setRecipients:recipients];
        
        [self presentViewController:messageController animated:YES completion:NULL];
    }
    
}



//======================================================
#pragma mark - ** Protocols **
//======================================================
//--------------------------------------------------------
#pragma mark - MFMessageComposeViewControllerDelegate
//--------------------------------------------------------
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Mail sent failure");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultFailed) {
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"The SMS failed to send.", @"")];
    }
    
}




@end
