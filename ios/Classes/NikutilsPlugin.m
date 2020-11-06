#import "NikutilsPlugin.h"
#if __has_include(<nikutils/nikutils-Swift.h>)
#import <nikutils/nikutils-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nikutils-Swift.h"
#endif

@implementation NikutilsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNikutilsPlugin registerWithRegistrar:registrar];
}
@end
