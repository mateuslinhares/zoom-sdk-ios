//
//  SDKAuthPresenter+authDelegate.m
//  MobileRTCSample
//
//  Created by Zoom Video Communications on 2018/11/21.
//  Copyright © 2018 Zoom Video Communications, Inc. All rights reserved.
//

#import "SDKAuthPresenter+AuthDelegate.h"

@implementation SDKAuthPresenter (AuthDelegate)

- (void)onMobileRTCAuthReturn:(MobileRTCAuthError)returnValue
{
    NSLog(@"onMobileRTCAuthReturn %@", @(returnValue));
    
    if (returnValue != MobileRTCAuthError_Success)
    {
        NSString *message = [NSString stringWithFormat:NSLocalizedString(@"SDK authentication failed, error code: %zd", @""), returnValue];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:NSLocalizedString(@"Retry", @""), nil];
        [alert show];
    }
}

- (void)onMobileRTCLoginReturn:(NSInteger)returnValue
{
    NSLog(@"onMobileRTCLoginReturn result=%zd", returnValue);
    
    if (returnValue == 0) {
        MobileRTCAccountInfo *accoutInfo = [[[MobileRTC sharedRTC] getAuthService] getAccountInfo];
        NSLog(@"MobileRTCAccountInfo-->\ngetEmailAddress:%@ ,\ngetUserName:%@ ,\ngetPMIVanityURL:%@, \nisTelephoneOnlySupported:%@, \nisTelephoneAndVoipSupported:%@, \nis3rdPartyAudioSupported:%@ \nget3rdPartyAudioInfo:%@, \ngetDefaultAudioInfo:%@, \nonlyAllowSignedInUserJoinMeeting:%@ \ngetCanScheduleForUsersList:%@ \nisLocalRecordingSupported:%@ \nisCloudRecordingSupported:%@ \ngetDefaultAutoRecordType:%@ \nisSpecifiedDomainCanJoinFeatureOn:%@ \ngetDefaultCanJoinUserSpecifiedDomains:%@", accoutInfo.getEmailAddress, accoutInfo.getUserName, accoutInfo.getPMIVanityURL, @(accoutInfo.isTelephoneOnlySupported), @(accoutInfo.isTelephoneAndVoipSupported), @(accoutInfo.is3rdPartyAudioSupported), accoutInfo.get3rdPartyAudioInfo, @(accoutInfo.getDefaultAudioInfo), @(accoutInfo.onlyAllowSignedInUserJoinMeeting), accoutInfo.getCanScheduleForUsersList, @(accoutInfo.isLocalRecordingSupported), @(accoutInfo.isCloudRecordingSupported), @(accoutInfo.getDefaultAutoRecordType), @(accoutInfo.isSpecifiedDomainCanJoinFeatureOn),accoutInfo.getDefaultCanJoinUserSpecifiedDomains);
    }
    
    MobileRTCPremeetingService *service = [[MobileRTC sharedRTC] getPreMeetingService];
    if (service)
    {
        service.delegate = self;
    }
}

- (void)onMobileRTCLogoutReturn:(NSInteger)returnValue
{
    NSLog(@"onMobileRTCLogoutReturn result=%zd", returnValue);
}

@end
