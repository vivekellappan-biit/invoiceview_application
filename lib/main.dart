import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/invoice_bloc.dart';
import 'repository/invoice_repository.dart';
import 'screens/home_screen.dart';
import 'constants/app_colors.dart';
import 'utils/status_bar_utils.dart';

void main() {
  runApp(const InvoiceApp());
  StatusBarUtils.setDarkStatusBar();
}

class InvoiceApp extends StatelessWidget {
  const InvoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceBloc(repository: InvoiceRepository()),
      child: MaterialApp(
        title: 'Invoice View Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.backgroundWhite,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: AppColors.white,
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
