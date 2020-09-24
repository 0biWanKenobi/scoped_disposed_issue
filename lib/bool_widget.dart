import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'main.dart';
import 'main.dart';

class BoolWidget extends HookWidget {
  const BoolWidget();

  @override
  Widget build(BuildContext context) {
    final isZero = useProvider(isZeroProvider(0));
    return Text('0 is 0: $isZero');
  }
}
