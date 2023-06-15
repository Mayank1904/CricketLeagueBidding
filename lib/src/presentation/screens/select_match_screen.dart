import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/responses/card.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../cubits/selectContest/select_contest_cubit.dart';
import 'create_team_screen.dart';
import 'widgets/chip.dart';
import 'widgets/contest_tile.dart';

@RoutePage()
class SelectMatchScreen extends StatefulWidget {
  final Cards? card;
  const SelectMatchScreen({super.key, this.card});

  @override
  State<SelectMatchScreen> createState() => _SelectMatchScreenState();
}

class _SelectMatchScreenState extends State<SelectMatchScreen> {
  late SelectContestCubit selectContestCubit;

  @override
  void initState() {
    super.initState();
    selectContestCubit = BlocProvider.of<SelectContestCubit>(context);
    selectContestCubit.loadContestList();
  }

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: widget.card?.shortName,
        subTitle: '1h 51m left',
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: BlocConsumer<SelectContestCubit, SelectContestState>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is SelectContestLoading)
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: <Widget>[
                            chip('Contests', true),
                            chip('My Contests (0)', false),
                            chip('My Team (0)', false),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Mega Contest",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Graphik",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left,
                              ),
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: Color(0xffb5b5b5),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Graphik",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    text: "Sort By: "),
                                TextSpan(
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Graphik",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    text: "Entry")
                              ]))
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.contestList?.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreateTeamScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: ContestTile(state.contestList![index]),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
