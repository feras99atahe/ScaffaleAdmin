import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage_Admin
  {
    'ddipfzdy': {
      'en': 'Upload Request',
      'ar': 'طلب تحميل',
    },
    'toz49tj9': {
      'en': 'Last File',
      'ar': 'الملف الأخير',
    },
  },
  // Search
  {
    'wq1b4ars': {
      'en': 'Search...',
      'ar': '[بعض نص التلميح ...]',
    },
    'zh0yco7j': {
      'en': 'Search Result',
      'ar': '',
    },
  },
  // Upload
  {
    '17950i8f': {
      'en': 'Upload File',
      'ar': 'تحميل المستند',
    },
  },
  // upload_info
  {
    'mhy4ce43': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '9myhuerv': {
      'en': 'Author',
      'ar': 'مؤلف',
    },
    '40on4eqg': {
      'en': 'Department',
      'ar': 'قسم',
    },
    '0ufenesi': {
      'en': 'Option 1',
      'ar': '',
    },
    'serxxduy': {
      'en': 'Please select...',
      'ar': '',
    },
    'sktz13rt': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'uq69ks73': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'yvtkr5nj': {
      'en': 'Upload File',
      'ar': 'رفع ملف',
    },
    'wjfrvi52': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'rmf88iyw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // profile
  {
    '244e1ulh': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'hi6frn0s': {
      'en': 'Collage',
      'ar': 'بريد إلكتروني',
    },
    'zgby0xkr': {
      'en': 'Language',
      'ar': 'لغة',
    },
    'hkd9if7i': {
      'en': 'Notification',
      'ar': 'إشعار',
    },
    'c82tvn43': {
      'en': 'Dark Mode',
      'ar': 'الحكمة والسياسة',
    },
    'a9evqiye': {
      'en': 'Pravicy & policie',
      'ar': 'الحكمة والسياسة',
    },
    'lmtd7ptl': {
      'en': 'Log out',
      'ar': 'تسجيل خروج',
    },
    'zwfx7fr7': {
      'en': '',
      'ar': '',
    },
  },
  // review
  {
    '1t7hg84w': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '4uiht381': {
      'en': 'Author',
      'ar': 'مؤلف',
    },
    'mz0xjvgq': {
      'en': 'Department',
      'ar': 'قسم',
    },
    'tgduxko2': {
      'en': 'Collage',
      'ar': 'قسم',
    },
    'vq8cyc6a': {
      'en': 'Download',
      'ar': 'تحميل',
    },
    '20kncooi': {
      'en': 'Read',
      'ar': 'يقرأ',
    },
    '6fylytju': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // pdf_reader
  {
    '9ela9y2t': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // department
  {
    'h94vw13q': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // file_check_admin
  {
    'ng24mwf4': {
      'en': 'Read',
      'ar': 'يقرأ',
    },
    '38t12tp1': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xs800y5x': {
      'en': 'Department',
      'ar': 'قسم',
    },
    'uigsv0w0': {
      'en': 'Author',
      'ar': 'مؤلف',
    },
    't36p8jmd': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'q165fa8h': {
      'en': 'Next',
      'ar': '',
    },
    'vp8ur5os': {
      'en': 'Edit',
      'ar': '',
    },
    '2xm14d6s': {
      'en': 'Approved',
      'ar': '',
    },
    'tyux7afu': {
      'en': 'Reject',
      'ar': '',
    },
    'ccr42d5a': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Edit_file_Admine
  {
    'jqfdtwdt': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'xwv3qe2m': {
      'en': 'Author',
      'ar': 'مؤلف',
    },
    '0b3qej5j': {
      'en': 'Department',
      'ar': 'قسم',
    },
    'cclg5flf': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'sgofqhlx': {
      'en': 'Upload File',
      'ar': 'رفع ملف',
    },
    '8qihwiui': {
      'en': 'Append',
      'ar': 'ألحق',
    },
    'yj3t7qzc': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Final_Login
  {
    'w79lmpce': {
      'en': 'Welcom To Scaffale',
      'ar': '',
    },
    '6cp0ay72': {
      'en': 'Home',
      'ar': '',
    },
  },
  // final_Singup
  {
    'jj07mmy9': {
      'en': 'Make your\'s Account',
      'ar': '',
    },
    'vyskkr3r': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Scaffale
  {
    'lxtuc4in': {
      'en': 'Home',
      'ar': '',
    },
  },
  // final_Recoerpassword
  {
    'eoq9wgcy': {
      'en': 'Reset Password',
      'ar': '',
    },
    'k50mxy3s': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Scaffalefile
  {
    'w48e5ucq': {
      'en': 'Option 1',
      'ar': '',
    },
    '0nl85cms': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // deletwidget
  {
    'i1d48tdu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Privecy
  {
    '9eb6aq5r': {
      'en': 'Home',
      'ar': '',
    },
  },
  // view_book_info
  {
    '780klqpe': {
      'en': 'Download',
      'ar': '',
    },
    'ba61f7ph': {
      'en': 'More',
      'ar': '',
    },
  },
  // searchfilter
  {
    '6yj5vp2b': {
      'en': 'petroleum engineering',
      'ar': 'الخيار 1',
    },
    'fxqej6hn': {
      'en': 'chemical engineering',
      'ar': '',
    },
    'xfp2a5wn': {
      'en': 'civil engineering',
      'ar': '',
    },
    'cj4xwcrx': {
      'en': 'architectural engineering',
      'ar': '',
    },
    '6m126k9u': {
      'en': 'information technology engineering',
      'ar': '',
    },
    '111qntd5': {
      'en': 'mechanical engineering',
      'ar': '',
    },
    'b25rqght': {
      'en': 'environmental engineering',
      'ar': '',
    },
    'qmawgg9b': {
      'en': 'electrical engineering',
      'ar': '',
    },
  },
  // approved_reject_file
  {
    '988rdd1j': {
      'en': 'Approved',
      'ar': '',
    },
    'ojk1y3tb': {
      'en': 'Reject',
      'ar': '',
    },
  },
  // login_bottomsheet
  {
    'rlvczm24': {
      'en': 'Email',
      'ar': '',
    },
    't8uc8xn0': {
      'en': 'Password',
      'ar': '',
    },
    'kua48te5': {
      'en': 'Login',
      'ar': '',
    },
    'zeeu7xvr': {
      'en': 'Forget password?',
      'ar': '',
    },
    'wh0k6ac5': {
      'en': 'Create an account',
      'ar': '',
    },
    '7m2famxt': {
      'en': 'Use a social platform to continue',
      'ar': 'استخدم منصة اجتماعية للمتابعة',
    },
  },
  // signup_bottomsheet
  {
    'uu5d8ry5': {
      'en': 'Name',
      'ar': '',
    },
    'phtrl12n': {
      'en': 'Email',
      'ar': '',
    },
    'aza43hy4': {
      'en': 'Password',
      'ar': '',
    },
    'fruuovk4': {
      'en': 'Confirme Password',
      'ar': '',
    },
    'u3lpiv9w': {
      'en': 'Sign up',
      'ar': '',
    },
    'znxbtegi': {
      'en': 'I have Account',
      'ar': '',
    },
  },
  // passwordrecovery
  {
    '4nlydscd': {
      'en': 'Enter your Email',
      'ar': '',
    },
    '4zhuvxcw': {
      'en': 'Email',
      'ar': '',
    },
    '5x06t9e3': {
      'en': 'Send Link',
      'ar': '',
    },
  },
  // Edit_info
  {
    '7rg8wj9s': {
      'en': 'Name',
      'ar': '',
    },
    '5rk73vkg': {
      'en': 'Email',
      'ar': '',
    },
    '9biplg13': {
      'en': 'Save',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '3ob8p5h9': {
      'en': '',
      'ar': '',
    },
    'zwi45vci': {
      'en': '',
      'ar': '',
    },
    'ov706b6m': {
      'en': '',
      'ar': '',
    },
    'oq09xb4v': {
      'en': '',
      'ar': '',
    },
    'ktc1sl5a': {
      'en': '',
      'ar': '',
    },
    'ov1tj3h9': {
      'en': '',
      'ar': '',
    },
    'i1274h8r': {
      'en': '',
      'ar': '',
    },
    'rlt86933': {
      'en': '',
      'ar': '',
    },
    '8vkgvrjq': {
      'en': '',
      'ar': '',
    },
    '66jwxebj': {
      'en': '',
      'ar': '',
    },
    '0ra7nzfi': {
      'en': '',
      'ar': '',
    },
    'mi9ve9xi': {
      'en': '',
      'ar': '',
    },
    'hq4vakiw': {
      'en': '',
      'ar': '',
    },
    '3rj5kzq9': {
      'en': '',
      'ar': '',
    },
    'fh7onp7p': {
      'en': '',
      'ar': '',
    },
    'izuy8d3y': {
      'en': '',
      'ar': '',
    },
    'lmgfmcx4': {
      'en': '',
      'ar': '',
    },
    '67r3mr8l': {
      'en': '',
      'ar': '',
    },
    's4jdz2db': {
      'en': '',
      'ar': '',
    },
    '9v790tgp': {
      'en': '',
      'ar': '',
    },
    'm3x9z9uv': {
      'en': '',
      'ar': '',
    },
    'dtt2241c': {
      'en': '',
      'ar': '',
    },
    'hims7foz': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
