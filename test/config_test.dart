// Copyright (c) 2017, Anatoly Pulyaevskiy. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// @dart=2.9

import 'dart:convert';

import 'package:node_http/node_http.dart' as http;
@TestOn('node')
import 'package:test/test.dart';

import 'setup_admin.dart';

void main() {
  group('Config', () {
    test('read config', () async {
      var baseUrl = env['FIREBASE_HTTP_BASE_URL'] + '/httpsTests';
      var response = await http.get('$baseUrl/config');
      expect(response.statusCode, 200);
      final Map result = json.decode(response.body);
      expect(result['key'], '123456');
      expect(result['url'], 'https://example.com');
      expect(result['enabled'], 'true');
      expect(result['noSuchKey'], isNull);
    });
  });
}
