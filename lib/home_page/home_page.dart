import 'package:flutter/material.dart';
import 'package:my_superheroes/home_page/home_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {
  final HomeBloc bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bloc,
      child: const Scaffold(
        body: SafeArea(child: HomePageContent()),
      ),
    );
  }
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return Column(
      children: [
        const Spacer(),
        const Center(child: Text('Hello')),
        StreamBuilder<PageState>(
          stream: bloc.observe(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final state = snapshot.requireData;
            return Center(child: Text('$state'));
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => bloc.onPressedTest1(),
          child: const Text('Test 1'),
        ),
        const Spacer(),
      ],
    );
  }
}
