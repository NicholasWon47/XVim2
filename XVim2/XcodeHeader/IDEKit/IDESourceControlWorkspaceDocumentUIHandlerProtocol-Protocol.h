//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jun  6 2019 20:12:56).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <IDEKit/DVTInvalidation-Protocol.h>
#import <IDEKit/IDESourceControlWorkspaceUIHandlerProtocol-Protocol.h>

@class DVTFilePath, IDESourceControlWorkspaceMonitor, IDEWorkspaceDocument, NSWindow;

@protocol IDESourceControlWorkspaceDocumentUIHandlerProtocol <IDESourceControlWorkspaceUIHandlerProtocol, DVTInvalidation>
@property(copy) CDUnknownBlockType sourceControlCommandContinuationBlock;
- (void)shouldCreateLocalRepository:(BOOL)arg1 atFilePath:(DVTFilePath *)arg2;
- (void)displayWaitingOnInitialWorkspaceScanAlertInWindow:(NSWindow *)arg1 withContinuationBlock:(void (^)(NSError *))arg2;
- (void)setWorkspaceDocument:(IDEWorkspaceDocument *)arg1;
- (void)addWindowController:(id)arg1;
- (void)initialWorkspaceScanIsFinished:(IDESourceControlWorkspaceMonitor *)arg1;
@end

