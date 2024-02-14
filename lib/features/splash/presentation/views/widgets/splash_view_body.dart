import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trail/core/utilities/assets.dart';
import 'package:trail/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  //lazm yeb2a const ahsan
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    //ana hna m3ndeesh aktr mn haga ana bs bstad3yy w da => Single responsibility principle and refactor code
    initSlidingAnimation();
    navigateHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
          height: 100,
        ),
        const SizedBox(height: 10),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {});
  }

  void navigateHome() {
    Future.delayed(const Duration(seconds: 2), () {
      //  MagicRouter.navigateTo(const HomeView());
      GoRouter.of(context).push('/homeview');
      // Get.to(()=> const HomeView() , transition:Transition.fade,duration:kTransitionDuration );
    });
  }
}
