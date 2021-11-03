import 'dart:io';

String fixture(String name) => File('test/resources/$name').readAsStringSync();
