abstract class DataUtils {
  static String getUserImage(String username) {
    if (username == 'si') {
      return 'https://images.unsplash.com/photo-1584385002340-d886f3a0f097?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGZ1dHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500';
    }
    return _getImageUrl(username);
  }

  static String getChannelImage() =>
      _getImageUrl('https://ui-avatars.com/api/?name=no&background=random');

  static String _getImageUrl(String value) =>
      'https://ui-avatars.com/api/?name=$value&background=random';
}
