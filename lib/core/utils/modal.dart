part of deep_linking.core.utils;

mixin LoadingDisplayer {
  BuildContext? _context;

  void showLoadingModal(BuildContext context) {
    _context = context;
    showDialog(
      barrierDismissible: false,
      context: _context!,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void closeModal() {
    Navigator.of(_context!).pop();
  }
}
