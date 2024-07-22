import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../bloc/property_bloc.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});
  @override
  State<PropertyScreen> createState() => _PropertyState();
}

class _PropertyState extends State<PropertyScreen> {
  late PropertyBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PropertyBloc>();
    _bloc.add(PropertyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(PropertyState state) {
    if (state is PropertyLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PropertyLoaded) {
      return Placeholder(); // Replace with your actual widget
    } else if (state is PropertyError) {
      return Center(
        child: Text('Error: '),
      );
    } else {
      return Container();
    }
  }
}
      