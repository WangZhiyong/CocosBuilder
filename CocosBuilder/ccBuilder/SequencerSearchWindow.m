//
//  SequencerSearchWindow.m
//  CocosBuilder
//
//  Created by Wang Zhiyong on 14-1-26.
//
//

#import "SequencerSearchWindow.h"
#import "CocosBuilderAppDelegate.h"
#import "SequencerHandler.h"
#import "CocosScene.h"

@interface SequencerSearchWindow ()

@end

@implementation SequencerSearchWindow

@synthesize searchString;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)searchNodesPath:(id)sender {
	
}

- (IBAction)searchPictureName:(id)sender {
	
	if ([searchString length] == 0)
		return;
	
	//	dismiss
	[self cancelSheet:nil];
	
	CocosBuilderAppDelegate *delegate = (CocosBuilderAppDelegate *)[[NSApplication sharedApplication] delegate];
	NSArray *arraryResult = [delegate searchNodeThatReferredPictureNamed:searchString];
	if ([arraryResult count] == 0) {
		
		NSAlert *alert = [NSAlert alertWithMessageText:@"Info" defaultButton:@"OK" alternateButton:nil otherButton:nil
			informativeTextWithFormat:@"Picture name [%@] not found.", searchString];
		[alert runModal];
	}
	else {
			
		NSString *strResultList = [NSString string];
		for (NSString *str in arraryResult) {
			
			NSArray *array = [str componentsSeparatedByString:@":"];
			NSString *item = [NSString stringWithFormat:@"[%@] %@\n    loc:%@\n",
							  [array objectAtIndex:1], [array objectAtIndex:0], [array objectAtIndex:2]];
			strResultList = [strResultList stringByAppendingString:item];
		}
		
		NSAlert *alert = [NSAlert alertWithMessageText:[NSString stringWithFormat:@"total %ld result:", [arraryResult count]]
										 defaultButton:nil
									   alternateButton:nil
										   otherButton:nil
							 informativeTextWithFormat:@"%@", strResultList];
		[alert runModal];
	}
}

@end
