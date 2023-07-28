import 'package:flutter/material.dart';

enum SortOrder {
  ascending,
  descending,
}

class Player {
  String name;
  String role;
  bool isCaptain;
  bool isViceCaptain;

  Player(this.name, this.role, this.isCaptain, this.isViceCaptain);
}

class SampleScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SampleScreen> {
  final List<Player> players = [
    Player('Player 1', 'Batsman', false, false),
    Player('Player 2', 'Bowler', false, false),
    Player('Player 3', 'All-Rounder', false, false),
    // Add more players as needed
  ];

  int _sortColumnIndex = 0;
  SortOrder _sortOrder = SortOrder.ascending;

  void _sort<T>(Comparable<T> Function(Player player) getField, int columnIndex,
      bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortOrder = ascending ? SortOrder.ascending : SortOrder.descending;
      players.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  void _selectCaptain(int index) {
    setState(() {
      for (var i = 0; i < players.length; i++) {
        players[i].isCaptain = (i == index);
        if (players[i].isCaptain) {
          players[i].isViceCaptain = false;
        }
      }
    });
  }

  void _selectViceCaptain(int index) {
    setState(() {
      for (var i = 0; i < players.length; i++) {
        players[i].isViceCaptain = (i == index);
        if (players[i].isViceCaptain) {
          players[i].isCaptain = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fantasy Cricket App'),
        ),
        body: DataTable(
          sortAscending: _sortOrder == SortOrder.ascending,
          sortColumnIndex: _sortColumnIndex,
          columns: [
            DataColumn(
              label: const Text('Player Name'),
              onSort: (columnIndex, ascending) {
                _sort<String>((player) => player.name, columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Role'),
              onSort: (columnIndex, ascending) {
                _sort<String>((player) => player.role, columnIndex, ascending);
              },
            ),
            const DataColumn(
              label: Text('Captain'),
            ),
            const DataColumn(label: Text('Vice Captain')),
          ],
          rows: players.map<DataRow>((player) {
            return DataRow(
              cells: [
                DataCell(Text(player.name)),
                DataCell(Text(player.role)),
                DataCell(
                  GestureDetector(
                    onTap: () => _selectCaptain(players.indexOf(player)),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color:
                              player.isCaptain ? Colors.blueGrey : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            player.isCaptain ? Colors.blueGrey : Colors.white,
                        child: Text(
                          player.isCaptain == false ? 'C' : '2X',
                          style: TextStyle(
                              color: player.isCaptain
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                DataCell(
                  GestureDetector(
                    onTap: () => _selectViceCaptain(players.indexOf(player)),
                    child: CircleAvatar(
                      backgroundColor: player.isViceCaptain
                          ? Colors.blue
                          : Colors.transparent,
                      child: Icon(Icons.check,
                          color: player.isViceCaptain
                              ? Colors.white
                              : Colors.grey),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
