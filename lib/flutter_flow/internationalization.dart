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
      'ar': '[بحث ...]',
    },
    'zh0yco7j': {
      'en': 'Search Result',
      'ar': 'نتائج البحث',
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
      'ar': 'الاسم',
    },
    '9myhuerv': {
      'en': 'Author',
      'ar': 'المؤلف',
    },
    '40on4eqg': {
      'en': 'Department',
      'ar': 'القسم',
    },
    '0ufenesi': {
      'en': 'Option 1',
      'ar': '',
    },
    'serxxduy': {
      'en': 'Please select...',
      'ar': 'رجاء اختار',
    },
    'sktz13rt': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر',
    },
    'uq69ks73': {
      'en': 'Description',
      'ar': 'الوصف',
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
      'ar': 'الرئيسية',
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
      'ar': 'الكلية ',
    },
    'zgby0xkr': {
      'en': 'Language',
      'ar': 'اللغة',
    },
    'hkd9if7i': {
      'en': 'Notification',
      'ar': 'الإشعارات',
    },
    'c82tvn43': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
    },
    'a9evqiye': {
      'en': 'Pravicy & policie',
      'ar': ' سياسة الخصوصية',
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
      'ar': 'العنوان',
    },
    '4uiht381': {
      'en': 'Author',
      'ar': 'المؤلف',
    },
    'mz0xjvgq': {
      'en': 'Department',
      'ar': 'القسم',
    },
    'tgduxko2': {
      'en': 'Collage',
      'ar': 'الكلية',
    },
    'vq8cyc6a': {
      'en': 'Download',
      'ar': 'تحميل',
    },
    '20kncooi': {
      'en': 'Read',
      'ar': 'قراءة',
    },
    '6fylytju': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // pdf_reader
  {
    '9ela9y2t': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // department
  {
    'h94vw13q': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // file_check_admin
  {
    'ng24mwf4': {
      'en': 'Read',
      'ar': 'قراءة',
    },
    '38t12tp1': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xs800y5x': {
      'en': 'Publication Data',
      'ar': 'تاريخ النشر',
    },
    'uigsv0w0': {
      'en': 'Author',
      'ar': 'المؤلف',
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
      'ar': 'الرئيسية',
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
      'ar': 'الرئيسية',
    },
  },
  // Final_Login
  {
    'w79lmpce': {
      'en': 'Welcom To Scaffale',
      'ar': 'مرحبًا بك في سكافالي',
    },
    '6cp0ay72': {
      'en': 'Home',
      'ar': 'الرئيسية',
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
      'ar': 'الرئيسية',
    },
  },
  // Scaffale
  {
    'lxtuc4in': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // final_Recoerpassword
  {
    'eoq9wgcy': {
      'en': 'Reset Password',
      'ar': 'استعادة كلمة المرور',
    },
    'k50mxy3s': {
      'en': 'Home',
      'ar': 'الرئيسية',
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
      'ar': 'الرئيسية',
    },
  },
  // deletwidget
  {
    'i1d48tdu': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Privecy
  {
    '9eb6aq5r': {
      'en': 'ىخ',
      'ar': 'الرئيسية',
    },
  },
  // view_book_info
  {
    '780klqpe': {
      'en': 'Download',
      'ar': 'تحميل',
    },
    'ba61f7ph': {
      'en': 'More',
      'ar': 'المزيد',
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
      'ar': 'البريد الالكتروني',
    },
    't8uc8xn0': {
      'en': 'Password',
      'ar': ' كلمة المرور',
    },
    'kua48te5': {
      'en': 'Login',
      'ar': '',
    },
    'zeeu7xvr': {
      'en': 'Forget password?',
      'ar': 'هل نسيت كلمة المرور؟',
    },
    'wh0k6ac5': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
    },
    '7m2famxt': {
      'en': 'Or Login with',
      'ar': 'أو سجل عن طريق',
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
      'ar': 'اكتب بريدك الالكتروني',
    },
    '4zhuvxcw': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    '5x06t9e3': {
      'en': 'Send Link',
      'ar': 'ارسل الرابط',
    },
  },
  // Edit_info
  {
    '7rg8wj9s': {
      'en': 'Name',
      'ar': ' الاسم',
    },
    '5rk73vkg': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    '9biplg13': {
      'en': 'Save',
      'ar': 'حفظ',
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
    '045o7j94': {
      'en': 'Approved ',
      'ar': ' قبول',
    },
    'fn2bx930': {
      'en': 'Reject  ',
      'ar': ' رفض',
    },
    'zus0qf56': {
      'en': 'Projects   ',
      'ar': ' مشاريع',
    },
    'i9m9va9w': {
      'en': 'Books',
      'ar': ' كتب',
    },
    'ryat4t2f': {
      'en': 'Papers',
      'ar': ' أوراق بحثية',
    },
    '6a0alnxk': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    'k8inalu2': {
      'en': 'Authors',
      'ar': ' المؤلف',
    },
    '7m4w0leu': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    '1f5sde4e': {
      'en': 'Pages ',
      'ar': ' الأوراق',
    },
    '8pluh12z': {
      'en': 'Publisher',
      'ar': ' الناشر',
    },
    'odhituo2': {
      'en': 'Volume ',
      'ar': ' العدد',
    },
    '7pf9au2q': {
      'en': 'Department',
      'ar': ' القسم',
    },
    'epmnub3o': {
      'en': 'Append',
      'ar': 'قبول',
    },
    'j9autzn2': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    '7jmgco7f': {
      'en': 'Authors',
      'ar': ' المؤلف',
    },
    '79dg78sx': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    '2rahq2fc': {
      'en': 'Journal',
      'ar': ' المجلة',
    },
    'w83x2i90': {
      'en': 'Pages',
      'ar': ' الأوراق',
    },
    '7k2r9ti0': {
      'en': 'Publisher',
      'ar': ' الناشر',
    },
    'wycphekx': {
      'en': 'Volume',
      'ar': ' العدد',
    },
    'sk0igf7a': {
      'en': 'Department',
      'ar': ' القسم',
    },
    '7gbltvse': {
      'en': 'Append',
      'ar': ' قبول',
    },
    'kkccbky8': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    'iryfrw2e': {
      'en': 'Authors',
      'ar': ' المؤلفون',
    },
    '89jtm08r': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    'dvatfg0c': {
      'en': 'Pages',
      'ar': ' الأوراق',
    },
    't3sqy00q': {
      'en': 'Thesis',
      'ar': ' الرسالة العلمية',
    },
    '5vxhyykx': {
      'en': 'BSC',
      'ar': ' بكالوريس',
    },
    'rpeh1stq': {
      'en': 'MSc',
      'ar': ' ماجستير',
    },
    '5dj5twu1': {
      'en': 'PHD',
      'ar': ' دكتوراة',
    },
    'md3tlsak': {
      'en': 'Department',
      'ar': ' القسم',
    },
    '8s93w3wt': {
      'en': 'Append',
      'ar': ' قبول',
    },
    'a1jzijvi': {
      'en': 'Pages',
      'ar': ' الأوراق',
    },
    'offkyx3f': {
      'en': 'Publisher',
      'ar': ' الناشر',
    },
    'sg8tbbez': {
      'en': 'Volume',
      'ar': 'العدد',
    },
    'lbecf24u': {
      'en': 'Department',
      'ar': 'القسم',
    },
    'q3ztwn2f': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '7s3l28np': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    'bleh1rse': {
      'en': 'Approved',
      'ar': 'مقبول',
    },
    'bin5q4cs': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    '3lpgjbin': {
      'en': 'Read',
      'ar': 'قراءة',
    },
    'v5aig0lz': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'hvbmaksq': {
      'en': 'Author',
      'ar': 'المؤلف',
    },
    'l54a9yfx': {
      'en': 'Publication Data',
      'ar': 'تاريخ النشر',
    },
    'n82kcyqc': {
      'en': 'Journal',
      'ar': 'المجلة',
    },
    '9cmjaht7': {
      'en': 'Pages',
      'ar': 'الأوراق',
    },
    'bihjjc4u': {
      'en': 'Publisher',
      'ar': 'الناشر',
    },
    'd43270t3': {
      'en': 'Volume',
      'ar': 'العدد',
    },
    'l172mxev': {
      'en': 'Department',
      'ar': 'القسم',
    },
    '3izqhegk': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'ep3emytv': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    '3z5mj4sz': {
      'en': 'Approved',
      'ar': 'مقبول',
    },
    '1fr6wrv2': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'zj0bodv9': {
      'en': 'Read',
      'ar': 'قراءة',
    },
    'wbkbr17n': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'hjlmondb': {
      'en': 'Author',
      'ar': 'المؤلف',
    },
    'd69m174c': {
      'en': 'Publication Data',
      'ar': 'تاريخ النشر',
    },
    '6du2l4az': {
      'en': 'Thesis',
      'ar': ' الرسالة العلمية',
    },
    'corqnqrp': {
      'en': 'Pages',
      'ar': 'الأوراق',
    },
    'y5wv6276': {
      'en': 'Department',
      'ar': 'القسم',
    },
    'bowhy4g3': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'posxmk8e': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    'c2eiglxa': {
      'en': 'Approved',
      'ar': 'مقبول',
    },
    'w3v57v65': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'kwtzw5aj': {
      'en': 'Upload Request',
      'ar': 'رفع الطلب',
    },
    'ei0d8h9h': {
      'en': 'Recently Added',
      'ar': 'أضيف حديثا',
    },
    'kmtmz81x': {
      'en': 'Department',
      'ar': 'القسم',
    },
    'xl6xlw67': {
      'en': 'Books',
      'ar': 'كتب',
    },
    'asebmfc1': {
      'en': 'Papers',
      'ar': 'أوراق بحثية',
    },
    'qr5rwgyq': {
      'en': 'Thesis',
      'ar': 'رسائل علمية',
    },
    'l4ew3f2u': {
      'en': 'Book',
      'ar': 'كتاب',
    },
    '9uau8n1i': {
      'en': 'paper',
      'ar': 'ورقة بحثية',
    },
    '3rh7bawh': {
      'en': 'Thesis',
      'ar': 'رسالة علمية',
    },
    'taepfbel': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    'c4zls8cj': {
      'en': 'Authors',
      'ar': ' المؤلف',
    },
    'upiw8yh2': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    '3ekdafe5': {
      'en': ' Select the Date ',
      'ar': ' اختر تاريخ النشر',
    },
    'gbl4bu68': {
      'en': 'Pages ',
      'ar': ' الأوراق',
    },
    'tfedwezq': {
      'en': 'Publisher',
      'ar': ' الناشر',
    },
    '0gzx837g': {
      'en': 'Volume ',
      'ar': ' العدد',
    },
    'zzsif9qy': {
      'en': 'Department',
      'ar': ' القسم',
    },
    'a44qtl0q': {
      'en': 'Please select...',
      'ar': 'من فضلك اختر....',
    },
    '5qm21dm8': {
      'en': 'Upload File',
      'ar': 'رفع ملف',
    },
    '6l7rmotl': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'vro7mn6v': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    '1pqbt49n': {
      'en': 'Authors',
      'ar': ' المؤلف',
    },
    'sz0zhmp6': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    'p3x1lymb': {
      'en': ' Select the Date ',
      'ar': ' اختر تاريخ النشر',
    },
    'slehosdx': {
      'en': 'Journal',
      'ar': ' المجلة',
    },
    'ja5fo1b2': {
      'en': 'Pages',
      'ar': ' الأوراق',
    },
    '7rvw3j0h': {
      'en': 'Publisher',
      'ar': ' الناشر',
    },
    'nea7vmqf': {
      'en': 'Volume',
      'ar': ' العدد',
    },
    '1j5eip5n': {
      'en': 'Department',
      'ar': ' القسم',
    },
    'fwxn6zrq': {
      'en': 'Please select...',
      'ar': 'من فضلك اختر....',
    },
    'tzdu0ilx': {
      'en': 'Upload File',
      'ar': 'رفع ملف',
    },
    'te75x7s8': {
      'en': 'Upload',
      'ar': 'رفع',
    },

    'l9qsiudz': {
      'en': 'Title',
      'ar': ' العنوان',
    },
    'uhph41fl': {
      'en': 'Authors',
      'ar': ' المؤلفون',
    },
    '0mllwez3': {
      'en': 'Publication date',
      'ar': ' تاريخ النشر',
    },
    'c0r8rwe1': {
      'en': ' Select the Date ',
      'ar': ' اختر تاريخ النشر',
    },
    '1xrzk0mm': {
      'en': 'Pages',
      'ar': ' الأوراق',
    },
    'sdph5214': {
      'en': 'Thesis',
      'ar': ' الرسالة العلمية',
    },
    'z3us6nvl': {
      'en': 'BSC',
      'ar': ' بكالوريس',
    },
    '6rhwy7k1': {
      'en': 'MSc',
      'ar': ' ماجستير',
    },
    'bcbcprrm': {
      'en': 'PHD',
      'ar': ' دكتوراة',
    },
    '7vlgkbvm': {
      'en': 'Department',
      'ar': ' القسم',
    },
    'nyxphru7': {
      'en': 'Please select...',
      'ar': 'من فضلك اختر....',
    },
    '95imld7a': {
      'en': 'Upload File',
      'ar': 'رفع ملف',
    },
    '1ej1xn3n': {
      'en': 'Upload',
      'ar': 'رفع',
    },

  },
].reduce((a, b) => a..addAll(b));
