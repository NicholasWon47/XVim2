//
//  XVimReplacePromptEvaluator.h
//  XVim
//
//  Created by Jeff Pearce on 2/19/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XVimReplacePromptEvaluator.h"
#import "XVimSearch.h"
#import "XVimWindow.h"
#import "XVim.h"

@implementation XVimReplacePromptEvaluator

- (instancetype)initWithWindow:(XVimWindow *)window replacementString:(NSString*)replacementString
{
    if (self = [super initWithWindow:window]) {
        self.replaceModeString = [NSString stringWithFormat:@"replace with %@ (y/n/a/q/l/^E/^Y)?", replacementString];
    }
    return self;
}

- (XVimEvaluator*)a{
    XVimSearch *searcher = [XVIM searcher];

    [searcher replaceCurrentToEndInWindow:self.window];

    return nil;
}

- (XVimEvaluator*)C_e{
#ifdef TODO
    if (self.window.sourceView.currentLineNumber > (long long)[self.window.sourceView xvim_lineNumberFromTop:1]) {
        [self.window.sourceView xvim_scrollLineForward:1];
    }
#endif
    return self;
}

- (XVimEvaluator*)l{
    XVimSearch *searcher = [XVIM searcher];

    [searcher replaceCurrentInWindow:self.window findNext:NO];
    return nil;
}

- (XVimEvaluator*)n{
    XVimSearch *searcher = [XVIM searcher];

    [searcher skipCurrentInWindow:self.window];
    if (searcher.lastFoundRange.location == NSNotFound) {
        return nil;
    }
    return self;
}

- (XVimEvaluator*)q{
    return nil;
}

- (XVimEvaluator*)y{
    XVimSearch *searcher = [XVIM searcher];

    [searcher replaceCurrentInWindow:self.window findNext:YES];

    if (searcher.lastFoundRange.location == NSNotFound) {
        return nil;
    }
    return self;
}

- (XVimEvaluator*)C_y{
#ifdef TODO
    if (self.window.sourceView.currentLineNumber < (long long)[self.window.sourceView xvim_lineNumberFromBottom:1]) {
        [self.window.sourceView xvim_scrollLineBackward:1];
    }
#endif
    return self;
}

- (XVimEvaluator*)defaultNextEvaluator{
    return self;
}
- (NSString*)modeString{
    return self.replaceModeString;
}

- (XVIM_MODE)mode{
    return XVIM_MODE_NORMAL;
}

@end