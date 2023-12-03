import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/src/presentation/blocs/blocs.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<DetailsCubit>().getByName(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailsHasData) {
            final pokemon = state.pokemon;
            return Column(
              children: [
                Text('Name: ${pokemon.name}'),
                Text('Height: ${pokemon.height}'),
                Text('Base Experience: ${pokemon.baseExperience}'),
                Text('Order: ${pokemon.order}'),
                Text('ID: ${pokemon.id}'),
                Text(
                    'Location Area Encounters: ${pokemon.locationAreaEncounters}'),
              ],
            );
          } else if (state is DetailsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
