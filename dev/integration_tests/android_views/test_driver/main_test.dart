// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart' hide TypeMatcher, isInstanceOf;

Future<void> main() async {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver.close();
  });

  group('MotionEvents tests ', () {
    test('recomposition', () async {
      final SerializableFinder motionEventsListTile =
      find.byValueKey('MotionEventsListTile');
      await driver.tap(motionEventsListTile);
      await driver.waitFor(find.byValueKey('PlatformView'));
      final String errorMessage = await driver.requestData('run test');
      expect(errorMessage, '');
    },
    // TODO(amirh): enable this test https://github.com/flutter/flutter/issues/54022
    skip: true);
  });
}
