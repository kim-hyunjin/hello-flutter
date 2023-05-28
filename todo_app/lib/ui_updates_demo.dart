import 'package:flutter/material.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  // flutter call this method to create the element for this widget
  // if widget stay in the ui, doesn't call anymore
  @override
  StatefulElement createElement() {
    print('UIUpdatesDemo CREATEELEMENT called');
    return super.createElement();
  }

  @override
  State<UIUpdatesDemo> createState() {
    return _UIUpdatesDemo();
  }
}

class _UIUpdatesDemo extends State<UIUpdatesDemo> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('UIUpdatesDemo BUILD called');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // build method called after setState call everytime
                    setState(() {
                      _isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
            if (_isUnderstood) const AwesomeText(),
          ],
        ),
      ),
    );
  }
}

// 위에서 버튼을 눌러 이 위젯을 사라지게하고 나타나게 함
class AwesomeText extends StatelessWidget {
  const AwesomeText({super.key});

  // tree에서 사라졌다가 다시 나타날때마다 호출됨.
  // build 메소드 이전에 호출됨.
  @override
  StatelessElement createElement() {
    print('AwesomeText createElement called');
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print('AwesomeText build called');
    return const Text('Awesome!');
  }
}
