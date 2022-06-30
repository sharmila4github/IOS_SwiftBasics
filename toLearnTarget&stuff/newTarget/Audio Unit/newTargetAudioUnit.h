//
//  newTargetAudioUnit.h
//  newTarget
//
//  Created by Raghav Deo on 16/06/22.
//

#import <AudioToolbox/AudioToolbox.h>
#import "newTargetDSPKernelAdapter.h"

// Define parameter addresses.
extern const AudioUnitParameterID myParam1;

@interface newTargetAudioUnit : AUAudioUnit

@property (nonatomic, readonly) newTargetDSPKernelAdapter *kernelAdapter;
- (void)setupAudioBuses;
- (void)setupParameterTree;
- (void)setupParameterCallbacks;
@end
