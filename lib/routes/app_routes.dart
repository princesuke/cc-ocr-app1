import '../screens/ocr_page.dart';
import '../screens/autofill_form_page.dart';

class AppRoutes {
  static const String ocr = '/ocr';
  static const String autofillForm = '/autofill_form';

  static final routes = {
    ocr: (context) => const OcrPage(),
    autofillForm: (context) => const AutofillFormPage(),
  };
}
