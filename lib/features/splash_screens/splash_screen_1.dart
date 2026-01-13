import 'package:flutter/material.dart';
import 'package:jobs_app/core/Widgets/button.dart';
import 'package:jobs_app/core/Widgets/screen_size.dart';
import 'package:jobs_app/core/Widgets/spacing_size.dart';
import 'package:jobs_app/core/Widgets/text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));

      if (!mounted) return false;

      _currentPage = (_currentPage + 1) % 3;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return true;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.height * 0.15, width: AppSize.width),
            Flexible(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  SplashContent(
                    image: "assets/splash/splash1.png",
                    title: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome to ",
                            style: AppTextStyles.splashHeading(context),
                          ),
                          TextSpan(
                            text: "EC ",
                            style: AppTextStyles.splashHeading(
                              context,
                              color: AppColors.orangetheme,
                            ),
                          ),
                          TextSpan(
                            text: "DIAL",
                            style: AppTextStyles.splashHeading(
                              context,
                              color: AppColors.orangetheme,
                            ),
                          ),
                        ],
                      ),
                    ),
                    content:
                        """A dedicated platform for AC installation, service, and repair professionals. Get consistent AC jobs and grow your income with ease.""",
                  ),
                  SplashContent(
                    image: "assets/splash/splash1.png",
                    title: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Offer Your ",
                            style: AppTextStyles.splashHeading(context),
                          ),
                          TextSpan(
                            text: "AC Expertise ",
                            style: AppTextStyles.splashHeading(
                              context,
                              color: AppColors.orangetheme,
                            ),
                          ),
                        ],
                      ),
                    ),
                    content:
                        """Provide Split AC, Window AC, and Inverter AC services. Installation, gas refilling, repairs, and regular maintenance—all in one app.""",
                  ),
                  SplashContent(
                    image: "assets/splash/splash1.png",
                    title: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Get ",
                            style: AppTextStyles.splashHeading(context),
                          ),
                          TextSpan(
                            text: "Jobs ",
                            style: AppTextStyles.splashHeading(
                              context,
                              color: AppColors.orangetheme,
                            ),
                          ),
                          TextSpan(
                            text: "Near You",
                            style: AppTextStyles.splashHeading(context),
                          ),
                        ],
                      ),
                    ),
                    content:
                        """Receive AC service requests from customers in your area. Less travel, faster work, and better daily productivity.""",
                  ),
                ],
              ),
            ),
            _buildDots(),
            SizedBox(height: AppSize.height * 0.12),
            AppButton(
              onTap: () {},
              content: Text(
                "Let's Get Started",
                style: AppTextStyles.body(context),
              ),
              width: AppSize.width * 0.8,
            ),
            SizedBox(height: AppSpacing.h16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: AppTextStyles.body(context),
                  ),
                  TextSpan(
                    text: "Login",
                    style: AppTextStyles.subtitle(
                      context,

                      color: AppColors.bluetheme,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.h12),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 20 : 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.orangetheme
                : AppColors.orangetheme.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String image;
  final Widget title;
  final String content;

  const SplashContent({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, height: AppSize.height * 0.3),
        SizedBox(height: AppSpacing.h24),

        title,
        SizedBox(height: AppSpacing.h12),
        Text(
          content,
          textAlign: TextAlign.center,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }
}
