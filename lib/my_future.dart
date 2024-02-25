// import 'package:flutter/material.dart';

// abstract class IState {}

// class LoadingState extends IState {}

// class IdleState extends IState {}

// class SuccessState extends IState {}

// class MyFuture extends StatefulWidget {
//   MyFuture({
//     super.key,
//     required this.future,
//     required this.build,
//   });
//   final Future<bool>? future;
//   final Widget Function(IState state) build;
//   IState state = IdleState();
//   @override
//   State<MyFuture> createState() => _MyFutureState();
// }

// class _MyFutureState extends State<MyFuture> {
//   @override
//   void initState() {
//     super.initState();
//     subscribe();
//   }

//   @override
//   void didUpdateWidget(covariant MyFuture oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }

//   void subscribe() {
//     if (widget.future != null) {
//       widget.state = LoadingState();
//       widget.future!.then((value) {
//         print("oi");
//         setState(() {
//           widget.state = SuccessState();
//         });
//       });
//     } else {
//       setState(() {
//         widget.state = SuccessState();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.build(widget.state);
//   }
// }
