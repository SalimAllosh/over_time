import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:over_time/Features/Authentication/blocs/bio_auth_cubit.dart';
import 'package:over_time/Public/HomePage/home_page.dart';

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage("Assets/Images/Lock.png"),
                    fit: BoxFit.fill,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BioAuthCubit>(context, listen: false)
                            .authFun();
                      },
                      child: Text("Verify"))
                ],
              );
            }

            if (state is BioNotExistingState) {
              return Center(child: Text(state.message));
            }
            if (state is BioNotAvailableState) {
              return Center(child: Text(state.message));
            }
            if (state is BioAuthenticatedState) {
              return const HomePage();
            } else {
              return const Text("data");
            }
          },
        ),
      ),
    );
  }
}
