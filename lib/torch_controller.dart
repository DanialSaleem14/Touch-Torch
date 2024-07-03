import 'package:torch_light/torch_light.dart';

class TorchController {
  bool _isInitialized = false;

  void initialize() {
    _isInitialized = true;
  }

  Future<bool> hasTorch() async {
    if (!_isInitialized) return false;
    try {
      return await TorchLight.isTorchAvailable();
    } catch (e) {
      print('Error checking torch availability: $e');
      return false;
    }
  }

  Future<void> toggleTorch({required bool isActive}) async {
    if (!_isInitialized) return;
    try {
      if (isActive) {
        await TorchLight.enableTorch();
      } else {
        await TorchLight.disableTorch();
      }
    } catch (e) {
      print('Error toggling torch: $e');
    }
  }
}
