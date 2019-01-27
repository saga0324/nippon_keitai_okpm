@echo off
title OneKeyPackageManager v1.1

:readme
echo 请先确定机型和软件版本！
echo 品牌:MONO(ZTE)
echo 型号:MO-01K
echo 运营商:docomo
echo 软件版本:DCM_JP_MO-01K_OV1.0.0B23
echo 安卓版本:8.0.0
pause

:readme2
cls.
echo 本精简将屏蔽
echo DOCOMO框架大部分软件，仅保留基本框架以保证系统更新正常进行
echo 并会安装Lawnchair桌面以替代DOCOMO Live UX
echo 并且去掉WIFI和信号标志的x
echo 推荐恢复出厂设置后再继续
echo 可选精简Google服务或程序
echo 任意键开始
pause

:adb_progress
cls.
TASKKILL /F /IM adb.exe
adb.exe start-server

:new_shell_install
cls.
adb.exe install %TEMP%\Lawnchair.apk

:captive_url_change
cls.
adb.exe shell "settings put global captive_portal_https_url https://www.google.cn/generate_204"
adb.exe shell "settings put global captive_portal_http_url http://www.google.cn/generate_204"

:preinstall_apps_uninstall
cls.
adb.exe uninstall com.nttdocomo.android.cloudstorageservice
adb.exe uninstall jp.co.nttdocomo.dbook
adb.exe uninstall jp.dmapnavi.navi02
adb.exe uninstall com.rsupport.rs.activity.ntt
adb.exe uninstall com.nttdocomo.android.dpoint
adb.exe uninstall com.nttdocomo.android.voicetranslation
adb.exe uninstall com.ztej.mo01k.manual
adb.exe uninstall com.nttdocomo.android.moneyrecord
adb.exe uninstall com.nttdocomo.android.mydocomo
adb.exe uninstall com.nttdocomo.android.photocollection
adb.exe uninstall com.nttdocomo.android.toruca
adb.exe uninstall com.mcafee.vsm_android_dcm
echo 预装可卸载软件卸载完毕
ping 127.0.0.1 -n 3 >nul
goto block_app

:block_app
cls.
adb.exe shell pm disable-user com.nttdocomo.android.atf
adb.exe shell pm disable-user jp.co.nttdocomo.lcsappsub
adb.exe shell pm disable-user com.nttdocomo.android.accountwipe
adb.exe shell pm disable-user com.nttdocomo.android.pf.dcmippushaggregator
adb.exe shell pm disable-user com.nttdocomo.android.dcmvoicerecognition
adb.exe shell pm disable-user com.nttdocomo.android.accountauthenticator
adb.exe shell pm disable-user com.nttdocomo.android.initialization
adb.exe shell pm disable-user com.nttdocomo.android.lac
adb.exe shell pm disable-user com.nttdocomo.android.settings.lac
adb.exe shell pm disable-user com.nttdocomo.android.iconcier
adb.exe shell pm disable-user com.nttdocomo.android.iconcier_contents
adb.exe shell pm disable-user com.nextbit.app
adb.exe shell pm disable-user com.nttdocomo.android.screenlockservice
adb.exe shell pm disable-user com.nttdocomo.android.store
adb.exe shell pm disable-user com.nttdocomo.android.voiceeditor
adb.exe shell pm disable-user jp.co.nttdocomo.anshinmode
adb.exe shell pm disable-user com.nttdocomo.android.apnsw
adb.exe shell pm disable-user com.nttdocomo.android.bugreport
adb.exe shell pm disable-user com.nttdocomo.android.areamail
adb.exe shell pm disable-user com.nttdocomo.android.cloudset
adb.exe shell pm disable-user com.nttdocomo.android.databackup
adb.exe shell pm disable-user jp.co.nttdocomo.lcsapp
adb.exe shell pm disable-user com.nttdocomo.android.pf.dcmwappush
adb.exe shell pm disable-user com.nttdocomo.android.devicehelp
adb.exe shell pm disable-user com.nttdocomo.android.dmenu2
adb.exe shell pm disable-user com.nttdocomo.android.remotelock
adb.exe shell pm disable-user jp.co.nttdocomo.carriermail
adb.exe shell pm disable-user com.nttdocomo.android.wipe
adb.exe shell pm disable-user com.nttdocomo.android.epshome
adb.exe shell pm disable-user com.nttdocomo.android.epsmodecontrol
adb.exe shell pm disable-user com.nttdocomo.android.kittingmanager
adb.exe shell pm disable-user com.nttdocomo.android.dhome
adb.exe shell pm disable-user com.nttdocomo.android.mascot
adb.exe shell pm disable-user com.nttdocomo.android.gs.utility_sha2
adb.exe shell pm disable-user com.nttdocomo.android.phonemotion ges
adb.exe shell pm disable-user jp.co.nttdocomo.saigaiban
adb.exe shell pm disable-user com.nttdocomo.android.schedulememo
adb.exe shell pm disable-user com.nttdocomo.android.sdcardbackup
echo 系统软件屏蔽完毕
ping 127.0.0.1 -n 3 >nul
goto google_tf

:google_tf
cls.
echo 请选择Google系软件屏蔽方案
echo 1.完全屏蔽
echo 2.屏蔽谷歌应用，保留基本框架
echo 3.不屏蔽
echo 请输入1，2，3
set /p op="输入："

if "%op%" == "1" (
goto google_all
) 

if "%op%" == "2" (
goto google_basic
) 

if "%op%" == "3" (
goto reboot
) 

:google_all
cls.
adb.exe shell pm disable-user com.google.android.calendar
adb.exe shell pm disable-user com.android.chrome
adb.exe shell pm disable-user com.google.android.apps.docs
adb.exe shell pm disable-user com.google.android.apps.tachyon
adb.exe shell pm disable-user com.google.android.gm
adb.exe shell pm disable-user com.google.android.tts
adb.exe shell pm disable-user com.google.android.apps.maps
adb.exe shell pm disable-user com.google.android.music
adb.exe shell pm disable-user com.google.android.apps.photos
adb.exe shell pm disable-user com.google.android.videos
adb.exe shell pm disable-user com.google.android.youtube
adb.exe shell pm disable-user com.google.android.printservice.recommendation
adb.exe shell pm disable-user com.google.android.googlequicksearchbox
adb.exe shell pm disable-user com.google.android.syncadapters.contacts
adb.exe shell pm disable-user com.google.android.gms
adb.exe shell pm disable-user com.google.android.backuptransport
adb.exe shell pm disable-user com.google.android.feedback
adb.exe shell pm disable-user com.google.android.onetimeinitializer
adb.exe shell pm disable-user com.google.android.partnersetup
adb.exe shell pm disable-user com.google.android.gsf
adb.exe shell pm disable-user com.android.vending
echo Google完全屏蔽完成
ping 127.0.0.1 -n 3 >nul
goto reboot

:google_basic
cls.
adb.exe shell pm disable-user com.google.android.calendar
adb.exe shell pm disable-user com.android.chrome
adb.exe shell pm disable-user com.google.android.apps.docs
adb.exe shell pm disable-user com.google.android.apps.tachyon
adb.exe shell pm disable-user com.google.android.gm
adb.exe shell pm disable-user com.google.android.tts
adb.exe shell pm disable-user com.google.android.apps.maps
adb.exe shell pm disable-user com.google.android.music
adb.exe shell pm disable-user com.google.android.apps.photos
adb.exe shell pm disable-user com.google.android.videos
adb.exe shell pm disable-user com.google.android.youtube
adb.exe shell pm disable-user com.google.android.printservice.recommendation
adb.exe shell pm disable-user com.google.android.googlequicksearchbox
echo Google应用屏蔽完成
ping 127.0.0.1 -n 3 >nul
goto reboot

:reboot
cls.
echo 设备将在3s后重启
ping 127.0.0.1 -n 3 >nul
adb shell reboot
goto thanks


:thanks
adb.exe kill-server
cls.
echo 感谢你的使用！
echo Bug反馈请去https://github.com/saga0324/nippon_keitai_onekey_pm提issues!
echo 3s后退出
ping 127.0.0.1 -n 3 >nul
exit
