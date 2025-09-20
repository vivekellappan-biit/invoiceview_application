import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/invoice_bloc.dart';
import '../bloc/invoice_event.dart';
import '../bloc/invoice_state.dart';
import '../models/invoice.dart';
import '../widgets/app_header.dart';
import '../widgets/user_profile_widget.dart';
import '../widgets/menu_item_widget.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../utils/status_bar_utils.dart';
import 'invoice_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InvoiceBloc>().add(const LoadInvoices());
    StatusBarUtils.setDarkStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const AppHeader(title: AppStrings.appName),
            const UserProfileWidget(
              name: AppStrings.userName,
              email: AppStrings.userEmail,
              appVersion: AppStrings.appVersion,
            ),
            // Menu items
            Expanded(
              child: BlocBuilder<InvoiceBloc, InvoiceState>(
                builder: (context, state) {
                  if (state is InvoiceLoaded) {
                    return _buildMenuItems(context, state);
                  } else if (state is InvoiceLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is InvoiceError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, InvoiceLoaded state) {
    return ListView.builder(
      itemCount: 7,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.receipt_long,
                showBackground: false,
              ),
              title: AppStrings.unpaidInvoices,
              onTap: () => _navigateToInvoiceList(
                context,
                state.unpaidInvoices,
                AppStrings.unpaidInvoices,
                AppColors.red,
              ),
            );
          case 1:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.check_circle,
                showBackground: false,
              ),
              title: AppStrings.paidInvoices,
              onTap: () => _navigateToInvoiceList(
                context,
                state.paidInvoices,
                AppStrings.paidInvoices,
                AppColors.green,
              ),
            );
          case 2:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.settings,
                showBackground: false,
              ),
              title: AppStrings.settings,
              onTap: () => _showComingSoon(context),
            );
          case 3:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.phone,
                showBackground: false,
              ),
              title: AppStrings.callUsSupport,
              onTap: () => _showComingSoon(context),
            );
          case 4:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.email,
                showBackground: false,
              ),
              title: AppStrings.emailUsSupport,
              onTap: () => _showComingSoon(context),
            );
          case 5:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.logout,
                showBackground: false,
              ),
              title: AppStrings.logout,
              onTap: () => _showComingSoon(context),
            );
          case 6:
            return MenuItemWidget(
              icon: const MenuIconWidget(
                iconData: Icons.delete,
                color: AppColors.red,
                showBackground: false,
              ),
              title: AppStrings.deleteAccount,
              textColor: AppColors.red,
              onTap: () => _showComingSoon(context),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  void _navigateToInvoiceList(
    BuildContext context,
    List<Invoice> invoices,
    String title,
    Color accentColor,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InvoiceListScreen(
          invoices: invoices,
          title: title,
          accentColor: accentColor,
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.comingSoon),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
