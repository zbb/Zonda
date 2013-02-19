#!/bin/bash

case $1 in
  # 初始化一个新项目
  init)
    cd ../
    mkdir assets # 前端资源根目录
    cd ./assets
    mkdir vendor
    mkdir src
    mkdir etc
    mkdir dist
    mkdir test
    mkdir tool
    mkdir css
    mkdir images

    cp -r ./Zonda ./assets/vendor

    dev: html:
      css: /assets/dist/dist-版本号.css
      script: /assets/dist/dist-版本号.js
      script: /assets/dist/frameworks-版本号.js
  ;;
  # 初始化lib目录
  config)
    node ./unit/config.js
  ;;
  # 打包项目
  prod)

    cd ../
    echo 开始打包Zonda

    echo 清除HOME目录下的Zonda模块缓存，重新从源服务器下载
    rm -rf ~/.spm/sources/*

    #修改init.js中的线上版本为开发版本
    sed -i "s/app_version_type='\w*'/app_version_type='prod'/g" ./init.js

    #模拟spm标准目录
    mkdir src
    cp -r app/* src/

    #spm 打包
    spm build -v

    #删除打包临时源文件
    rm -rf src/

    #显示指明需要调用的模块ID
    echo 'seajs.use("#app/app");' >> dist/app.js

    echo Zonda-App打包完成
  ;;
  # 开发模式
  dev)
    cd ../

    #替换init.js中Zonda的状态为开发版本
    sed -i "s/app_version_type='\w*'/app_version_type='dev'/g" ./init.js

    echo Zonda切换至开发模式
  ;;
  test)
    cd ../
    #替换init.js中Zonda的状态为开发版本
    sed -i "s/app_version_type='\w*';/app_version_type='test';/g" ./init.js

    echo Zonda切换至测试模式

    #echo 开启测试模式Node服务，测试完成之前请勿关闭此进程!

    #cd tool/unit
    #node case.js
  ;;
  *)
    echo $1 ? 没有选项 =。=
  ;;
esac
