import 'package:contactcars_app_retail/core/utils/assets_manager.dart';

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: AppImages.CCLogoMore,
    title: 'حوّل عملاتك بسهولة',
    description:
        'اختر العملة التي تريد التحويل منها وإليها، وادخل المبلغ لتحصل على القيمة بسرعة ودقة.',
  ),
  Onboard(
    image: AppImages.CCLogoMore,
    title: "تابع تغيرات العملة",
    description:
        "اعرف بيانات التغير التاريخية للعملة خلال آخر 7 أيام بسهولة لتبقى على اطلاع دائم.",
  ),
  Onboard(
    image: AppImages.CCLogoMore,
    title: "استخدم التطبيق بدون إنترنت",
    description:
        "بيانات العملات والأعلام يتم تخزينها محليًا، لتتمكن من استخدامها في أي وقت حتى لو كنت غير متصل بالإنترنت.",
  )
];

