//
//  SequencerSearchWindow.h
//  CocosBuilder
//
//  Created by Wang Zhiyong on 14-1-26.
//
//

#import "CCBModalSheetController.h"

@interface SequencerSearchWindow : CCBModalSheetController {
	
	NSString *searchString;
}

@property (nonatomic,assign) NSString *searchString;

- (IBAction)searchNodesPath:(id)sender;
- (IBAction)searchPictureName:(id)sender;

@end
