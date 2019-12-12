//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <firebase_core/FirebaseCorePlugin.h>
#import <geolocator/GeolocatorPlugin.h>
#import <google_api_availability/GoogleApiAvailabilityPlugin.h>
#import <google_maps_flutter/GoogleMapsPlugin.h>
#import <location/LocationPlugin.h>
#import <location_permissions/LocationPermissionsPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <sqflite/SqflitePlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [GoogleApiAvailabilityPlugin registerWithRegistrar:[registry registrarForPlugin:@"GoogleApiAvailabilityPlugin"]];
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [LocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPlugin"]];
  [LocationPermissionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPermissionsPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
