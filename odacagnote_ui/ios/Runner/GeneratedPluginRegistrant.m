//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<bs_flutter_selectbox/BsFlutterSelectboxPlugin.h>)
#import <bs_flutter_selectbox/BsFlutterSelectboxPlugin.h>
#else
@import bs_flutter_selectbox;
#endif

#if __has_include(<bs_flutter_utils/BsFlutterUtilsPlugin.h>)
#import <bs_flutter_utils/BsFlutterUtilsPlugin.h>
#else
@import bs_flutter_utils;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BsFlutterSelectboxPlugin registerWithRegistrar:[registry registrarForPlugin:@"BsFlutterSelectboxPlugin"]];
  [BsFlutterUtilsPlugin registerWithRegistrar:[registry registrarForPlugin:@"BsFlutterUtilsPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
}

@end
