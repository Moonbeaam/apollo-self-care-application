import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    Key key,
    @required this.label,
    @required this.onPressed,
    @required this.isLoading,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundContinueButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class SignInBar extends StatelessWidget {
  const SignInBar({
    Key key,
    @required this.label,
    @required this.onPressed,
    @required this.isLoading,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundContinueButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key key,
    @required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _RoundContinueButton extends StatelessWidget {
  const _RoundContinueButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Color(0xffad75f7),
      splashColor: Color(0xFFff6fb0),
      padding: const EdgeInsets.all(22.0),
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.longArrowAltRight,
        color: Color(0xFFFFFFFF),
        size: 24.0,
      ),
    );
  }
}
