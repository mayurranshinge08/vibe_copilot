import 'package:flutter/material.dart';

class CommentLogSwitcher extends StatefulWidget {
  @override
  _CommentLogSwitcherState createState() => _CommentLogSwitcherState();
}

class _CommentLogSwitcherState extends State<CommentLogSwitcher> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1D8DC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 70.0),
              child: Text(
                "1. Frame alignment not properly",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFE0E5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Comments Tab
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedTab == 0
                                  ? Colors.white
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Comments',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    _selectedTab == 0
                                        ? Colors.black
                                        : Colors.grey,
                              ),
                            ),
                            if (_selectedTab == 0)
                              Icon(
                                Icons.chat_bubble,
                                size: 16,
                                color: Colors.grey,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Logs Tab
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              _selectedTab == 1
                                  ? Colors.white
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Logs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _selectedTab == 1
                                      ? Colors.black
                                      : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Content Switcher
            Expanded(
              child: _selectedTab == 0 ? _buildComments() : _buildLogs(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _commentController,
                          decoration: const InputDecoration(
                            hintText: 'Type a Comment',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.attach_file, color: Colors.grey, size: 30),
                    Icon(Icons.camera_alt, color: Colors.grey, size: 30),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _commentController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(Icons.send, color: Colors.white, size: 15),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        _commentRow(
          "Prakash Joshi",
          "Door is not working properly.",
          "17/12/2024 17:48",
          Colors.blue,
          'https://randomuser.me/api/portraits/men/32.jpg',
        ),
        _commentRow(
          "",
          "Door lock is not working.",
          "17/12/2024 17:48",
          Colors.transparent,
          "",
        ),
        _commentRow(
          "Sushil Agarwal",
          "Now it’s working fine.",
          "17/12/2024 17:48",
          Colors.pink,
          'https://randomuser.me/api/portraits/men/36.jpg',
        ),
        _rightComment(
          "Arvind",
          "This is done...",
          "17/12/2024 17:48",
          Colors.green,
          'https://randomuser.me/api/portraits/men/38.jpg',
        ),
        _commentRow(
          "Ramesh Bhatia",
          "This is done, Good...",
          "17/12/2024 17:48",
          Colors.red,
          'https://randomuser.me/api/portraits/men/40.jpg',
        ),
      ],
    );
  }

  Widget _buildLogs() {
    return Center(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),

          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _commentRow(
    String name,
    String message,
    String date,
    Color nameColor,
    String avatarUrl,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (avatarUrl.isNotEmpty)
            CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 18)
          else
            SizedBox(width: 36), // Empty space if no avatar

          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name.isNotEmpty)
                  Text(
                    name,
                    style: TextStyle(
                      color: nameColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(message, style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(width: 10),
                      Text(
                        date,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightComment(
    String name,
    String message,
    String date,
    Color nameColor,
    String avatarUrl,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: TextStyle(color: nameColor, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message),
                    SizedBox(width: 10),
                    Text(
                      date,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 18),
        ],
      ),
    );
  }
}
