//
//  ANEmailPresenter.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/23/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@import MessageUI;

#import "ANEmailWireframe.h"
#import "ANMessageDomainModel.h"

@interface ANEmailWireframe ()
<
    MFMailComposeViewControllerDelegate,
    MFMessageComposeViewControllerDelegate,
    UINavigationControllerDelegate
>

@property (nonatomic, copy) ANCodeBlock completion;

@end

@implementation ANEmailWireframe

- (void)presentEmailControllerFromViewController:(UIViewController*)vc
                                       withModel:(ANMessageDomainModel*)model
                                      completion:(ANCodeBlock)completion
{
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail])
    {
        if (!ANIsEmpty(model.recipients))
        {
            [composer setToRecipients:model.recipients];
        }
        if (!ANIsEmpty(model.title))
        {
            [composer setSubject:model.title];
        }
        
        if (!ANIsEmpty(model.message))
        {
            [composer setMessageBody:model.message isHTML:model.isHTMLMessage];
        }
        
        if (!ANIsEmpty(model.image))
        {
            NSData* imageData = UIImagePNGRepresentation(model.image);
            [composer addAttachmentData:imageData mimeType:@"png" fileName:@"image"];
        }
        
        composer.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        composer.navigationBar.tintColor = [UIColor whiteColor];
        [vc presentViewController:composer animated:YES completion:nil];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"common.error", nil)
                                    message:NSLocalizedString(@"error.mail.no-avariable-email-client", nil)
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"common.ok", nil)
                          otherButtonTitles:nil, nil] show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError*)error
{
    if (self.completion)
    {
        self.completion();
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController*)controller
                 didFinishWithResult:(MessageComposeResult)result
{
    if (self.completion)
    {
        self.completion();
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
