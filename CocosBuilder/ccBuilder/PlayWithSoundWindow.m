//
//  PlayWithSoundWindow.m
//  CocosBuilder
//
//  Created by Wang Zhiyong on 14-3-25.
//
//

#import "PlayWithSoundWindow.h"
#import "SequencerSequence.h"
#import "SequencerHandler.h"

@interface PlayWithSoundWindow ()

@end

@implementation PlayWithSoundWindow

@synthesize soundFilePath, ccbFilePath, soundResoucesPath;

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

- (IBAction)playWithSound:(id)sender {
	
	bool onlyUpdate = (!self.soundFilePath || [self.soundFilePath length] == 0);
	
	if ((!self.soundFilePath || [self.soundFilePath length] == 0) && (self.soundResoucesPath && [self.soundResoucesPath length] > 0))
		[self smartUpdatePathWithPath:self.soundResoucesPath];
	
	if (onlyUpdate)
		return;
	
	//	dismiss sheet
	[NSApp stopModalWithCode:1];
}

- (void)smartUpdatePathWithPath:(NSString*)soundResPath {
	
	//	auto-match sound file
	NSArray *pathComp = [self.ccbFilePath pathComponents];
	int segNum = [pathComp count];
	SequencerSequence* seq = [SequencerHandler sharedHandler].currentSequence;
	
	NSString *currentSequenceName = [seq name];
	NSString *ccbName = [pathComp lastObject];
	NSString *sfxName = [[ccbName stringByDeletingPathExtension] stringByAppendingPathExtension:@"mp3"];
	
	if (segNum >= 2 && [(NSString*)[pathComp objectAtIndex:segNum - 2] compare:@"char"] == NSOrderedSame && [currentSequenceName compare:@"attacked"] == NSOrderedSame) {
		
		self.soundFilePath = [soundResPath stringByAppendingPathComponent:@"attacked"];
		self.soundFilePath = [self.soundFilePath stringByAppendingPathComponent:sfxName];
	}
	else if (segNum >= 2 && [(NSString*)[pathComp objectAtIndex:segNum - 2] compare:@"sfx"] == NSOrderedSame) {
		
		self.soundFilePath = [soundResPath stringByAppendingPathComponent:@"skill"];
		self.soundFilePath = [self.soundFilePath stringByAppendingPathComponent:sfxName];
	}
}

@end
