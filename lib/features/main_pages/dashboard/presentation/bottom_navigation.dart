import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/features/main_pages/create_job/presentation/create_job.dart';
import 'package:jobs_app/features/main_pages/home/presentation/home.dart';
import 'package:jobs_app/features/main_pages/jobs/presentation/jobs.dart';
import 'package:jobs_app/features/main_pages/more/presentation/more.dart';
import 'package:jobs_app/features/main_pages/wallet.dart';

class DashBoard extends HookConsumerWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List pages = [
      const Home(),
      const Jobs(),
      const CreateJob(),
      const Wallet(),
      const More(),
    ];
    final currentPage = useState<int>(0);
    return Scaffold(
      body: pages[currentPage.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage.value,
        onTap: (index) {
          currentPage.value = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.bluetheme,
      ),
    );
  }
}
