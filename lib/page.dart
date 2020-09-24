import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'main.dart';

final boolScopedProvider = ScopedProvider<bool>((watch) {
  final fromAnotherScoped = watch(usedByTextScopedProvider);
  final fromARoot = watch(isZeroProvider(fromAnotherScoped));

  return fromARoot;
});

final usedByTextScopedProvider = ScopedProvider<int>((_) => null);

class PageScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final boolScoped = useProvider(boolScopedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Throws when going back to main'),
      ),
      body: Center(
        child: Text('Scoped 0 is 0: $boolScoped'),
      ),
    );
  }
}
