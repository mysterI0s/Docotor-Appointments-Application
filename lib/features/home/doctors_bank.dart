import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/constants/app_strings.dart';
import 'package:final_project/features/home/recent_visit_model.dart';

class DoctorsBank {
  List<Map<String, String>> specialties = [
    {"image": AppImages.specialty_0, "name": AppStrings.dentist.tr()},
    {"image": AppImages.specialty_1, "name": AppStrings.cardiologist.tr()},
    {"image": AppImages.specialty_2, "name": AppStrings.psychologist.tr()},
  ];

  List<RecentVisit> recentVisits = [
    RecentVisit(
      name: AppStrings.drNourSrour.tr(),
      specialty: AppStrings.cardiologist.tr(),
      rating: "4.9",
      price: "\$30/hr",
      image: AppImages.doc1,
      isFavorite: false,
    ),
    RecentVisit(
      name: AppStrings.drAssaedHanash.tr(),
      specialty: AppStrings.psychologist.tr(),
      rating: "4.8",
      price: "\$25/hr",
      image: AppImages.doc2,
      isFavorite: false,
    ),
    RecentVisit(
      name: AppStrings.drAmaniAlbij.tr(),
      specialty: AppStrings.dentist.tr(),
      rating: "4.7",
      price: "\$20/hr",
      image: AppImages.doc3,
      isFavorite: false,
    ),
  ];
}
