# scoped_disposed_issue

This is a sample project to demonstrate an issue with the package [RiverPod](https://pub.dev/packages/riverpod).

Using RiverPod v. 0.11.0, a ScopedProvider causes an exception in this scenario:
- We have two routes, the origin with an AutoDisposeProviderFamily and the destination with a ScopedProvider
- the ScopedProvider references the AutoDisposeProviderFamily
- the user pops the destination to get back

# Usage
1) Pull the repo with git, run in emulator;
2) Tap the button in the main screen;
3) Navigate back to main screen.

You should get the following exception:

    E/flutter ( 9517): [ERROR:flutter/lib/ui/ui_dart_state.cc(166)] Unhandled Exception: Bad state: Tried to read a provider from a ProviderContainer that was already disposed
    E/flutter ( 9517): #0      ProviderContainer.readProviderElement 
    package:riverpod/…/framework/container.dart:279
    E/flutter ( 9517): #1      ProviderContainer._disposeProvider 
    package:riverpod/…/framework/container.dart:184
    E/flutter ( 9517): #2      _AutoDisposer._performDispose 
    package:riverpod/…/framework/auto_dispose.dart:134
    E/flutter ( 9517): #3      _AutoDisposer.scheduleDispose.<anonymous closure> 
    package:riverpod/…/framework/auto_dispose.dart:113
    E/flutter ( 9517): #4      new Future.microtask.<anonymous closure>  (dart:async/future.dart:201:37)
    E/flutter ( 9517): #5      _rootRun  (dart:async/zone.dart:1182:47)
    E/flutter ( 9517): #6      _CustomZone.run  (dart:async/zone.dart:1093:19)
