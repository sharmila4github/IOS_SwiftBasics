//
//  audioProductAudioUnit.h
//  audioProduct
//
//  Created by Raghav Deo on 16/06/22.
//

#import <AudioToolbox/AudioToolbox.h>
#import "audioProductDSPKernelAdapter.h"

// Define parameter addresses.
extern const AudioUnitParameterID myParam1;

@interface audioProductAudioUnit : AUAudioUnit

@property (nonatomic, readonly) audioProductDSPKernelAdapter *kernelAdapter;
- (void)setupAudioBuses;
- (void)setupParameterTree;
- (void)setupParameterCallbacks;
@end
