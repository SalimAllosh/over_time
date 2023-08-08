import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:over_time/Features/Authentication/blocs/bio_auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<BioAuthCubit>(
        create: (_) => BioAuthCubit()..authFun(),
        child: BlocBuilder<BioAuthCubit, BioAuthState>(
          builder: (context, state) {
            if (state is BioAuthWaitingState) {
              return Container(
                  child: Center(
                child: Image(
                  image: AssetImage("Assets/Images/Lock.png"),
                  fit: BoxFit.fill,
                ),
              ));
            }

            if (state is BioNotExistingState) {
              return Center(child: Container(child: Text(state.message)));
            }
            if (state is BioNotAvailableState) {
              return Center(child: Container(child: Text(state.message)));
            }
            if (state is BioAuthenticatedState) {
              return Center(
                  child: Container(child: Text("BioAuthenticatedState")));
            } else {
              return Container(
                child: Text("data"),
              );
            }
          },
        ),
      ),
    );
  }
}
