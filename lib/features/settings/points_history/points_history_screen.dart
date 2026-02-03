import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_filter_dropdown.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/settings/points_history/data/models/points_transaction.dart';
import 'package:tascom/features/settings/points_history/data/points_history_mock_data.dart';
import 'package:tascom/features/settings/points_history/widgets/points_balance_card.dart';
import 'package:tascom/features/settings/points_history/widgets/points_transaction_tile.dart';

class PointsHistoryScreen extends StatefulWidget {
  const PointsHistoryScreen({super.key});

  @override
  State<PointsHistoryScreen> createState() => _PointsHistoryScreenState();
}

class _PointsHistoryScreenState extends State<PointsHistoryScreen> {
  TransactionStatus? _selectedFilter;

  List<PointsTransaction> get _filteredTransactions {
    if (_selectedFilter == null) {
      return PointsHistoryData.transactions;
    }
    return PointsHistoryData.transactions
        .where((t) => t.status == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const VerticalSpace(16),
                const PointsBalanceCard(
                  balance: PointsHistoryData.totalBalance,
                ),
                const VerticalSpace(24),
                _buildHistoryHeader(),
                const VerticalSpace(12),
                ..._filteredTransactions.map(
                  (transaction) => PointsTransactionTile(
                    transaction: transaction,
                  ),
                ),
                const VerticalSpace(24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return MyAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            MyIcons.arrowBack,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Center(
        child: Text(
          'Points History',
          style: MyTextStyles.heading.h22.copyWith(
            color: MyColors.text.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'History',
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          MyFilterDropdown<TransactionStatus>(
            items: TransactionStatus.values,
            selectedValue: _selectedFilter,
            labelBuilder: (status) => status.displayName,
            allOptionLabel: 'All',
            onChanged: (status) {
              setState(() => _selectedFilter = status);
            },
          ),
        ],
      ),
    );
  }
}
