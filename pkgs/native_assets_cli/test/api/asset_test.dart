// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:native_assets_cli/code_assets.dart';
import 'package:native_assets_cli/data_assets.dart';
import 'package:test/test.dart';

void main() {
  test('Asset constructors', () async {
    final assets = [
      CodeAsset(
        package: 'my_package',
        name: 'foo',
        file: Uri.file('path/to/libfoo.so'),
        linkMode: DynamicLoadingBundled(),
        os: OS.android,
        architecture: Architecture.x64,
      ),
      CodeAsset(
        package: 'my_package',
        name: 'foo3',
        linkMode: DynamicLoadingSystem(Uri(path: 'libfoo3.so')),
        os: OS.android,
        architecture: Architecture.x64,
      ),
      CodeAsset(
        package: 'my_package',
        name: 'foo4',
        linkMode: LookupInExecutable(),
        os: OS.android,
        architecture: Architecture.x64,
      ),
      CodeAsset(
        package: 'my_package',
        name: 'foo5',
        linkMode: LookupInProcess(),
        os: OS.android,
        architecture: Architecture.x64,
      ),
      CodeAsset(
        package: 'my_package',
        name: 'bar',
        file: Uri(path: 'path/to/libbar.a'),
        os: OS.linux,
        architecture: Architecture.arm64,
        linkMode: StaticLinking(),
      ),
      CodeAsset(
        package: 'my_package',
        name: 'bla',
        file: Uri(path: 'path/with spaces/bla.dll'),
        linkMode: DynamicLoadingBundled(),
        os: OS.windows,
        architecture: Architecture.x64,
      ),
      DataAsset(
        package: 'my_package',
        name: 'data/some_text.txt',
        file: Uri(path: 'data/some_text.txt'),
      ),
    ];
    assets.toString();
  });

  test('toString', () {
    StaticLinking().toString();
    DynamicLoadingBundled().toString();
    DynamicLoadingSystem(Uri.file('foo.so')).toString();
    LookupInProcess().toString();
    LookupInExecutable().toString();
  });
}
