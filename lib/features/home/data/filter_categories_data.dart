import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/features/home/data/models/filter_category.dart';

final List<FilterCategory> filterCategories = [
  const FilterCategory(
    id: 'all',
    title: 'View All',
    unSelctedIcon: MyIcons.dashboardStroke,
    selctedIcon: MyIcons.dashboardSolid,
    isViewAll: true,
  ),
  const FilterCategory(
    id: 'home_service',
    title: 'Home Service',
    unSelctedIcon: MyIcons.homeServiceStroke,
    selctedIcon: MyIcons.homeServiceSolid,
    apiCategory: 'HomeServices',
  ),
  const FilterCategory(
    id: 'errands',
    title: 'Errands',
    unSelctedIcon: MyIcons.cartStroke,
    selctedIcon: MyIcons.cartSolid,
    apiCategory: 'Errands',
  ),
  const FilterCategory(
    id: 'repairs',
    title: 'Repairs',
    unSelctedIcon: MyIcons.miningStroke,
    selctedIcon: MyIcons.miningSolid,
    apiCategory: 'Repairs',
  ),
  const FilterCategory(
    id: 'teaching',
    title: 'Tutroing',
    unSelctedIcon: MyIcons.teachingStroke,
    selctedIcon: MyIcons.teachingSolid,
    apiCategory: 'Tutoring',
  ),
  const FilterCategory(
    id: 'pet',
    title: 'Pet Care',
    unSelctedIcon: MyIcons.petStroke,
    selctedIcon: MyIcons.petSolid,
    apiCategory: 'PetCare',
  ),
  const FilterCategory(
    id: 'delivery',
    title: 'Transportation',
    unSelctedIcon: MyIcons.carStroke,
    selctedIcon: MyIcons.carSolid,
    apiCategory: 'Transportation',
  ),
];
