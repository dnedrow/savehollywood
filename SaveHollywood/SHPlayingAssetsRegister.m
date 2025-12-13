#import "SHPlayingAssetsRegister.h"

@interface SHPlayingAssetsRegister ()
{
    NSMutableSet * _playingAssetsSet;

    dispatch_queue_t _syncQueue;
}

@end

@implementation SHPlayingAssetsRegister

+ (SHPlayingAssetsRegister *)sharedRegister
{
    static SHPlayingAssetsRegister * sPlayingAssetsRegister=nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sPlayingAssetsRegister=[SHPlayingAssetsRegister new];
    });
    
    return sPlayingAssetsRegister;
}

- (instancetype)init
{
    self=[super init];

    if (self!=nil)
    {
        _playingAssetsSet=[[NSMutableSet alloc] init];

        _syncQueue=dispatch_queue_create("com.whitebox.savehollywood.playingassetsregister", DISPATCH_QUEUE_SERIAL);
    }

    return self;
}

#pragma mark -

- (NSArray *)allPlayingAssets
{
    __block NSArray * tAllPlayingAssets;

    dispatch_sync(_syncQueue, ^{
        tAllPlayingAssets=[_playingAssetsSet allObjects];
    });

    return tAllPlayingAssets;
}

#pragma mark -

- (BOOL)isPlayingAsset:(id)inAsset
{
    if (inAsset==nil)
        return NO;

    __block BOOL tIsPlaying=NO;

    dispatch_sync(_syncQueue, ^{
        tIsPlaying=[_playingAssetsSet containsObject:inAsset];
    });

    return tIsPlaying;
}

- (void)addAsset:(id)inAsset
{
    if (inAsset==nil)
        return;

    dispatch_async(_syncQueue, ^{
        [_playingAssetsSet addObject:inAsset];
    });
}

- (void)removeAsset:(id)inAsset
{
    if (inAsset==nil)
        return;

    dispatch_async(_syncQueue, ^{
        [_playingAssetsSet removeObject:inAsset];
    });
}

@end
