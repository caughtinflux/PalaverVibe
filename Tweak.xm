#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface IRCQuery : NSObject
{
	NSString   *_name;
    NSUInteger  _unreadMentions;
}
@property (nonatomic, copy) NSString *name; // @synthesize name=_name;
@property (assign) NSUInteger unreadMentions; // @synthesize unreadMentions=_unreadMentions;
@end


%hook IRCQuery
static NSUInteger prevCount;
- (void)setUnreadMentions:(NSUInteger)mentions
{
	%orig(mentions);
	if (mentions > prevCount) {
#ifdef DEBUG		
		NSLog(@"Previous count: %i mentions: %i for channel %@", prevCount, mentions, self.name);
#endif	
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	}
	prevCount = mentions;
}
%end
