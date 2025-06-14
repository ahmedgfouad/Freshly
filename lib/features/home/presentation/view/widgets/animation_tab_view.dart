import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:store/features/home/presentation/manager/home_cubit/home_state.dart';

class AnimatedTabView extends StatefulWidget {
  final Widget child;
  final int tabIndex;
  final Duration duration;
  final Curve curve;

  const AnimatedTabView({
    super.key,
    required this.child,
    required this.tabIndex,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  });

  @override
  State<AnimatedTabView> createState() => _AnimatedTabViewState();
}

class _AnimatedTabViewState extends State<AnimatedTabView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerAnimationIfVisible(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    if (cubit.currentIndex == widget.tabIndex) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, curr) => curr is BottomNavState,
      listener: (context, state) => _triggerAnimationIfVisible(context),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
