// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:footballapp_2/constants/constant.dart';
import '../widgets/BuildLeagueCard.dart';
import '../views/StandingView.dart';

class LigList extends StatefulWidget {
  const LigList({Key? key}) : super(key: key);

  @override
  State<LigList> createState() => _LigListState();
}

class _LigListState extends State<LigList> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward(from: 0.0);
  }

  void _reverseAnimation() {
    _animationController.reverse(from: 3.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ligler",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: constant.mavi1,
      ),
      body: Container(
        color: constant.mavi4,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTapDown: (_) => _startAnimation(),
              onTapCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'PD')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/laliga.png"),
              ),
            ),
            GestureDetector(
              onLongPressDown: (_) => _startAnimation(),
              onLongPressCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'PL')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/pl.png"),
              ),
            ),
            GestureDetector(
              onLongPressDown: (_) => _startAnimation(),
              onLongPressCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'SA')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/seria.png"),
              ),
            ),
            GestureDetector(
              onLongPressDown: (_) => _startAnimation(),
              onLongPressCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'FL1')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/lig1.png"),
              ),
            ),
            GestureDetector(
              onLongPressDown: (_) => _startAnimation(),
              onLongPressCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'BL1')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/bundesliga.png"),
              ),
            ),
            GestureDetector(
              onLongPressDown: (_) => _startAnimation(),
              onLongPressCancel: () => _reverseAnimation(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StandingView(code: 'DED')),
                );
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: buildleaguecard("assets/images/erdivise.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
