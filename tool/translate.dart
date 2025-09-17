import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart tool/translate.dart <language_code_1> <language_code_2> ...');
    print('Example: dart tool/translate.dart es fr de');
    return;
  }

  final sourceFile = File('lib/l10n/app_en.arb');
  if (!sourceFile.existsSync()) {
    print('Error: lib/l10n/app_en.arb not found.');
    return;
  }

  final sourceContent = sourceFile.readAsStringSync();
  final Map<String, dynamic> sourceArb = json.decode(sourceContent);

  final keysToTranslate = sourceArb.keys.where((key) => !key.startsWith('@')).toList();

  for (final langCode in arguments) {
    final targetFile = File('lib/l10n/app_$langCode.arb');
    final Map<String, dynamic> targetArb = {
      '@@locale': langCode,
    };

    print('\n--- Translating to $langCode ---');
    print('File created: ${targetFile.path}');
    print('Copy the translations from the links below:\n');

    for (final key in keysToTranslate) {
      final value = sourceArb[key];
      targetArb[key] = '__TRANSLATE_ME__';
      final encodedValue = Uri.encodeComponent(value);
      print('$key: https://translate.google.com/?sl=en&tl=$langCode&text=$encodedValue&op=translate');
    }

    final encoder = JsonEncoder.withIndent('  ');
    targetFile.writeAsStringSync(encoder.convert(targetArb));

    print('\nFinished generating files for $langCode. Please translate the values in ${targetFile.path}.');
  }
}
