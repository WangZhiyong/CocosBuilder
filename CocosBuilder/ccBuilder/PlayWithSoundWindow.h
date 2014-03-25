//
//  PlayWithSoundWindow.h
//  CocosBuilder
//
//  Created by Wang Zhiyong on 14-3-25.
//
//

#import "CCBModalSheetController.h"

@interface PlayWithSoundWindow : CCBModalSheetController {

	NSString *ccbFilePath;
	NSString *soundResoucesPath;
	NSString *soundFilePath;
	
	IBOutlet NSTextField* soundResoucesPathTextField;
}

@property (nonatomic,assign) NSString *ccbFilePath;
@property (nonatomic,assign) NSString *soundResoucesPath;
@property (nonatomic,assign) NSString *soundFilePath;

- (IBAction)playWithSound:(id)sender;
- (void)smartUpdatePathWithPath:(NSString*)soundResPath;

@end
