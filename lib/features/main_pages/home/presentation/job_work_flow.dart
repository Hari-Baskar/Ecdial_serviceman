import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/confirm_arrival.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/customer_signature.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/extra_charges.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/images_after_work.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/images_before_work.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/job_timer.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow_pages/parts_used.dart';

class JobWorkflowScreen extends HookConsumerWidget {
  const JobWorkflowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer? _timer;
    final seconds = useState<int>(0);
    bool isRunning = false;
    final currentStep = useState<int>(1);
    const totalSteps = 7;

    void goNext() {
      if (currentStep.value < totalSteps) {
        currentStep.value++;
      }
    }

    void startTimer() {
      if (isRunning) return;

      isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        seconds.value++;
      });
    }

    void stopTimer() {
      _timer?.cancel();
      _timer = null;
      isRunning = false;
    }

    String formatTime(int sec) {
      final m = (sec ~/ 60).toString().padLeft(2, '0');
      final s = (sec % 60).toString().padLeft(2, '0');
      return "$m:$s";
    }

    return Scaffold(
      body: Column(
        children: [
          headers(
            context: context,
            currentStep: currentStep.value,
            totalSteps: totalSteps,
            seconds: formatTime(seconds.value),
          ),
          Expanded(
            child: Pages(
              step: currentStep.value,
              onNext: goNext,
              startTimer: startTimer,
              stopTimer: stopTimer,
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({
    required BuildContext context,
    required int currentStep,
    required int totalSteps,
    required dynamic seconds,
  }) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.zero,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(width: AppSpacing.w16),

                Text("Job Workflow", style: AppTextStyles.body(context)),
                Spacer(),
                Text(
                  seconds,
                  style: AppTextStyles.body(context, color: AppColors.green),
                ),
              ],
            ),
            StepIndicator(currentStep: currentStep, totalSteps: 7),
          ],
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final step = index + 1;
          final isActive = step == currentStep;
          final isCompleted = step < currentStep;

          return Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSize.width * 0.04,
                  backgroundColor: isActive || isCompleted
                      ? AppColors.orangetheme
                      : AppColors.lightGrey,
                  child: Text(
                    '$step',
                    style: AppTextStyles.body(
                      context,
                      color: isActive || isCompleted
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ),
                if (step != totalSteps)
                  Expanded(
                    child: Container(
                      height: 2.sp,
                      margin: EdgeInsets.symmetric(horizontal: AppSpacing.w4),
                      color: isCompleted
                          ? AppColors.orangetheme
                          : AppColors.lightGrey,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class Pages extends HookConsumerWidget {
  final int step;
  final VoidCallback onNext;
  final VoidCallback startTimer;
  final VoidCallback stopTimer;

  Pages({
    required this.step,
    required this.onNext,
    required this.startTimer,
    required this.stopTimer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (step) {
      case 1:
        return ConfirmArrivalStep(onConfirmed: onNext);

      case 2:
        return ImagesBeforeWork(onStarted: onNext);

      case 3:
        return JobTimer(onConfirmed: onNext, startTimer: startTimer);

      case 4:
        return PartsUsed(onConfirmed: onNext);

      // case 4:
      //   return WorkInProgressStep(onContinue: onNext);

      case 5:
        return ExtraCharges(onConfirmed: onNext);

      case 6:
        return ImagesAfterWork(onConfirmed: onNext);

      case 7:
        return CustomerSignature(onConfirmed: onNext);

      default:
        return const SizedBox.shrink();
    }
  }
}
