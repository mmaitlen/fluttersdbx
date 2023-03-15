import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdbx/core/base_view_model.dart';


// Based on Stacked architecture
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
  }) : super(key: key);

  
  final Function(T)? onModelReady;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = Provider.of<T>(context, listen: false);

    if (widget.onModelReady != null) {
      widget.onModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
