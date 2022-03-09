class Api {
  Api._();

  /// 登陆
  static const String login = '/user/login';

  /// 注册
  static const String register = '/user/register';

  /// 获取注册验证码
  static const String verify = '/file/getVerify';

  /// 刷新token
  static const String refreshToken = '/user/refreshToken';

  ///  查询小说是否已加入书架
  static const String queryIsInShelf = '/user/queryIsInShelf';

  ///  加入书架
  static const String addToBookShelf = '/user/addToBookShelf';

  ///  移出书架 removeFromBookShelf/{id}
  static const String removeFromBookShelf = '/user/removeFromBookShelf';

  ///  分页查询书架
  static const String listBookShelfByPage = '/user/listBookShelfByPage';

  ///  分页查询阅读记录
  static const String listReadHistoryByPage = '/user/listReadHistoryByPage';

  ///  添加反馈
  static const String addFeedBack = '/user/addFeedBack';

  ///  查询个人信息
  static const String userInfo = '/user/userInfo';

  ///  查询个人信息
  static const String updateUserInfo = '/user/updateUserInfo';

  ///  查询个人信息
  static const String updatePassword = '/user/updatePassword';

  ///  分页查询用户书评
  static const String listCommentByPage = '/user/listCommentByPage';

  ///  添加阅读记录
  static const String addReadHistory = '/user/addReadHistory';

  /// 查询首页新书榜单数据
  static const String queryNewRank = '/book/listNewRank';

  /// 查询首页点击榜单数据
  static const String queryClickRank = '/book/listClickRank';

  /// 查询首页更新榜单数据
  static const String queryUpdateRank = '/book/listUpdateRank';

  /// 查询小说分类列表
  static const String queryBookCategory = '/book/listBookCategory';

  /// 分页搜索
  static const String searchByPage = '/book/searchByPage';

  /// 查询小说详情信息 /book/queryBookDetail/${id}
  static const String queryBookDetail = '/book/queryBookDetail';

  /// 查询小说排行信息
  static const String queryListRank = '/book/queryBookDetail';

  /// 增加点击次数
  static const String addVisitCount = '/book/addVisitCount';

  /// 查询章节相关信息
  static const String queryBookIndexAbout = '/book/queryBookIndexAbout';

  /// 根据分类id查询同类推荐书籍
  static const String queryListRecBookByCatId = '/book/listRecBookByCatId';

  /// 分页查询书籍评论列表
  static const String queryListCommentByPage = '/book/listCommentByPage';

  /// 新增评价
  static const String addBookComment = '/book/addBookComment';

  /// 根据小说ID查询小说前十条最新更新目录集合
  static const String queryNewIndexList = '/book/queryNewIndexList';

  /// 目录页
  static const String queryIndexList = '/book/queryIndexList';
}
