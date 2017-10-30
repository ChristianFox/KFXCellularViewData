/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/





#import "KFXViewController+MFMailComposer.h"

// Pods
#import <KFXAdditions/UIViewController+KFXAdditions.h>


@implementation KFXViewController (MFMailComposer)

-(void)presentEmailComposerWithSubject:(NSString *)subject message:(NSString *)message messageIsHTML:(BOOL)isHTML receipients:(NSArray<NSString*>*)recipients{
    
    if (![MFMailComposeViewController canSendMail]) {
        
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"It is not possible to send email from this device.", @"")];
        
    }else{

        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc]init];
        [mailVC setMailComposeDelegate:self];
        [mailVC setSubject:subject];
        [mailVC setMessageBody:message isHTML:isHTML];
        [mailVC setToRecipients:recipients];
            [self presentViewController:mailVC animated:YES completion:NULL];
    }

}



//======================================================
#pragma mark - ** Protocols **
//======================================================
//--------------------------------------------------------
#pragma mark - MFMailComposeViewControllerDelegate
//--------------------------------------------------------
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:{
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            
            break;
        }
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultFailed) {
        
        [self kfx_showErrorAlertWithMessage:[NSString stringWithFormat:NSLocalizedString(@"The email failed to send with the following error: %@", @""),error.localizedDescription]];
    }
}

@end
