
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SHMovieScaling)
{
	SHMovieScaleProportionallyUpOrDown=0,		// Scale movie to maximum possible dimensions while (1) staying within destination area (2) preserving aspect ratio
	SHMovieScaleAxesIndependently,				// Scale each dimension to exactly fit destination. Do not preserve aspect ratio.
	SHMovieScaleNone,							// Do not scale.
};

enum {
	kMovieFrameShowMetadataAtStart=0,
	kMovieFrameShowMetadataPeriodically
};

typedef NS_ENUM(NSUInteger, SHMovieAudioVolumeMode)
{
	SHMovieAudioVolumeNormal=0,
	SHMovieAudioVolumeMute,
	SHMovieAudioVolumeCustom
};

#define SHUserDefaultsFrameShowMetadataPeriodMinimumValue   15
#define SHUserDefaultsFrameShowMetadataPeriodMaximumValue   60

NS_ASSUME_NONNULL_BEGIN

@interface SHSettings : NSObject

@property BOOL randomOrder;
@property BOOL startWhereLeftOff;

@property (strong) NSMutableArray<NSURL *> *assets;

@property SHMovieScaling scaling;
@property BOOL randomPosition;

@property BOOL drawBorder;
@property BOOL showMetadata;
@property NSInteger showMetadataMode;
@property NSInteger showMetadataPeriod;

@property (copy) NSColor *backgroundColor;

@property BOOL audioMainScreenOnly;
@property SHMovieAudioVolumeMode audioMode;
@property CGFloat audioVolume;

@property BOOL mainDisplayOnly;

+ (nonnull SHSettings *)settings;

+ (BOOL)isConfigurationLocked;

- (nullable instancetype)initWithDictionaryRepresentation:(nonnull NSDictionary *)inDictionary;

- (nonnull NSDictionary *)dictionaryRepresentation;

- (void)resetSettings;



@end

NS_ASSUME_NONNULL_END
