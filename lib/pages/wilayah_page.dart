import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:area_api/models/wilayah_model.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  State<WilayahPage> createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {
  final WilayahBloc _areaBloc = WilayahBloc();

  @override
  void initState() {
    _areaBloc.add(GetWilayahList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wilayah Indonesia'),
      ),
      body: _buildListWilayah(),
    );
  }

  Widget _buildListWilayah() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _areaBloc,
        child: BlocListener<WilayahBloc, WilayahState>(
          listener: (context, state) {
            if (state is WilayahError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<WilayahBloc, WilayahState>(
            builder: (context, state) {
              if (state is WilayahInitial) {
                return _buildLoading();
              } else if (state is WilayahLoading) {
                return _buildLoading();
              } else if (state is WilayahLoaded) {
                return _buildCard(context, state.wilayahModel);
              } else if (state is WilayahError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, WilayahModel model) {
    return ListView.builder(
        itemCount: model.values!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Counttry: ${model.values![index].name}"),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
