import 'package:cbbit_flutter/cubit/Internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet lost'),
                backgroundColor: Colors.red,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Loading'),
                ),
              );
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state == InternetState.gained) {
              return Text('Internet Connected');
            } else if (state == InternetState.lost) {
              return Text('Internet Lost');
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
