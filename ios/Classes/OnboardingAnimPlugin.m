#import "OnboardingAnimPlugin.h"
#import <onboarding_anim/onboarding_anim-Swift.h>

@implementation OnboardingAnimPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOnboardingAnimPlugin registerWithRegistrar:registrar];
}
@end
