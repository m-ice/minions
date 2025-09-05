import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

/**
 * @injectable → 普通可注入类
 * @singleton → 单例
 * @lazySingleton → 延迟单例
 * @module → 第三方库模块
 * @Named、@Environment → 区分实例/环境
 * @InjectableInit() → 初始化入口
 */
@InjectableInit()
void configureDependencies() => getIt.init();