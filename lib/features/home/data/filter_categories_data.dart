import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/features/home/data/models/filter_category.dart';

final List<FilterCategory> filterCategories = [
  const FilterCategory(
    id: 'all',
    title: 'View All',
    icon: MyIcons.dashboardStroke,
    isViewAll: true,
  ),
  const FilterCategory(
    id: 'errands',
    title: 'Errands',
    icon: MyIcons.cartStroke,
  ),
  const FilterCategory(
    id: 'repairs',
    title: 'Repairs',
    icon: MyIcons.miningStroke,
  ),
  const FilterCategory(
    id: 'teaching',
    title: 'Tutroing',
    icon: MyIcons.teachingStroke,
  ),
  const FilterCategory(id: 'pet', title: 'Pet Care', icon: MyIcons.petStroke),
  const FilterCategory(
    id: 'delivery',
    title: 'Transportation',
    icon: MyIcons.carStroke,
  ),
  const FilterCategory(
    id: 'home_service',
    title: 'Home Service',
    icon: MyIcons.homeServiceStroke,
  ),
];
