import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CountryCode', () {
    CountryCode createSubject({
      String code = 'PH',
      String dialCode = '+63',
      String name = 'Philippines',
      int? nationalSignificantNumber = 10,
    }) {
      return CountryCode(
        code: code,
        dialCode: dialCode,
        name: name,
        nationalSignificantNumber: nationalSignificantNumber,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('flagUri', () {
      test('returns the correct flag image uri from asset', () {
        final countryCode = createSubject();
        const directory = 'assets/flags/ph.png';
        expect(
          countryCode.flagUri,
          equals(directory),
        );
      });
    });

    group('flagImagePackage', () {
      testWidgets('can be used at Image widget', (tester) async {
        final countryCode = createSubject();
        final flagUri = countryCode.flagUri;
        final package = countryCode.flagImagePackage;
        final widget = Image.asset(flagUri, package: package);
        await tester.pumpWidget(widget);
        expect(find.byWidget(widget), findsOneWidget);
      });
    });

    group('fromMap', () {
      test('works correctly', () {
        expect(
          CountryCode.fromMap(const <String, dynamic>{
            'name': 'Philippines',
            'code': 'PH',
            'dial_code': '+63',
            'national_significant_number': 10,
          }),
          equals(createSubject()),
        );
      });
    });

    group('fromDialCode', () {
      test('returns the correct country code model with + sign', () {
        expect(
          CountryCode.fromDialCode('+63'),
          equals(createSubject()),
        );
      });

      test('returns the correct country code model without + sign', () {
        expect(
          CountryCode.fromDialCode('63'),
          equals(createSubject()),
        );
      });

      test('returns null if dial code does not exists', () {
        expect(
          CountryCode.fromDialCode('z'),
          equals(null),
        );
      });
    });

    group('fromCode', () {
      test(
          'returns the correct country code model '
          'from the given country code', () {
        expect(
          CountryCode.fromCode('PH'),
          equals(createSubject()),
        );
      });

      test('returns null if country code does not exists', () {
        expect(
          CountryCode.fromCode('z'),
          equals(null),
        );
      });
    });

    group('fromName', () {
      test(
          'returns the correct country code model '
          'from the given country name', () {
        expect(
          CountryCode.fromName('Philippines'),
          equals(createSubject()),
        );
      });

      test('returns null if country name does not exists', () {
        expect(
          CountryCode.fromName('z'),
          equals(null),
        );
      });
    });

    group('equality', () {
      test('should return true if instance is the same', () {
        final main = createSubject();
        expect(main == main, true);
      });
      test('should return true if value is the same but instance is different',
          () {
        final main = createSubject();
        final other = createSubject();
        expect(main == other, true);
        expect(main.hashCode == other.hashCode, true);
      });

      test('should return false if names are different', () {
        final main = createSubject().copyWith(name: 'test');
        final other = createSubject();
        expect(main.hashCode == other.hashCode, false);
      });

      test('should return false if codes are different', () {
        final main = createSubject().copyWith(code: 'test');
        final other = createSubject();
        expect(main.hashCode == other.hashCode, false);
      });

      test('should return false if dialCode are different', () {
        final main = createSubject().copyWith(dialCode: 'test');
        final other = createSubject();
        expect(main.hashCode == other.hashCode, false);
      });

      test('should return false if NSN are different', () {
        final main = createSubject().copyWith(nationalSignificantNumber: 99999);
        final other = createSubject();
        expect(main.hashCode == other.hashCode, false);
      });
    });

    group('flagImage', () {
      final countryCode = createSubject();

      testWidgets('shows flag image', (tester) async {
        await tester.pumpWidget(countryCode.flagImage());
        expect(find.byType(Image), findsOneWidget);
      });
    });

    group('copyWith', () {
      test('returns the same object if arguments are not provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('replaces every parameter', () {
        expect(
          createSubject().copyWith(
            code: 'test',
            dialCode: 'test',
            name: 'test',
          ),
          equals(
            createSubject(
              code: 'test',
              dialCode: 'test',
              name: 'test',
            ),
          ),
        );
      });
    });
  });
}
