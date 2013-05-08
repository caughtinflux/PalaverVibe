#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface IRCQuery : NSObject
{
    NSUInteger _unreadMentions;
}
@property (nonatomic, copy) NSString *name;
@property (assign) NSUInteger unreadMentions; // @synthesize unreadMentions=_unreadMentions;
@end


%hook IRCQuery
static NSUInteger prevCount;
- (void)setUnreadMentions:(NSUInteger)mentions
{
	%orig(mentions);
	if (mentions > prevCount) {
		NSLog(@"Previous count: %i mentions: %i for channel %@", prevCount, mentions, self.name);
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	}
	prevCount = mentions;
}
%end
