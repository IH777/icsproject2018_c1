# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
# RECOG_MODIFY|CHANGE_CONF|(config file name)
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    11   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\mei\mei.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\hinocampus.bmp
15   16   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16   17   <eps>                               TIMER_START|bootscreen|1.5
17   2    TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 Hello

1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|ハロー             SYNTH_START|mei|mei_voice_normal|ハロー。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41  RECOG_EVENT_STOP|はじめまして       SYNTH_START|mei|mei_voice_happy|はじめまして、メイと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|図書館への案内、今日の占い、観光サイトの紹介、BGMの再生などができます。よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|70
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|70
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|70
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|70
1    61   RECOG_EVENT_STOP|おっぱい           VALUE_EVAL|random|LE|70
61   62   VALUE_EVENT_EVAL|random|LE|70|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|70|FALSE SYNTH_START|mei|mei_voice_normal|知ってるわ。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0090 Guide

1    71   RECOG_EVENT_STOP|図書館             MODEL_DELETE|menu
71   72   <eps>                               MODEL_ADD|panel|Accessory\map\map_library.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
72   73   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73   74   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|首都大学東京の図書館は、正門から見ると、右側にあります。建物に入って階段を下りてください。
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76   77   <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
77   78   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78   79   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79   80   <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
80   81   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
81   82   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
82   83   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>

# 0101-0110 Calender

1    101  RECOG_EVENT_STOP|カレンダー         EXECUTE|http://www.kisokyo.tmu.ac.jp/kyomu/gakunen/index.html
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|首都大学東京のカレンダーを表示します。
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  2    SYNTH_EVENT_STOP|mei                <eps>


# 0131-0140 Bad

1    131   RECOG_EVENT_STOP|だめ              SYNTH_START|mei|mei_voice_normal|ごめんなさい。
1    131   RECOG_EVENT_STOP|ダメ              SYNTH_START|mei|mei_voice_normal|ごめんなさい。
131  132   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
132   2    SYNTH_EVENT_STOP|mei                <eps>


#0141-150 

1    141   RECOG_EVENT_STOP|天気            EXECUTE|http://weathernews.jp/
141  142   <eps>                            SYNTH_START|mei|mei_voice_normal|天気予報のウェブページを開きます。
142   2    SYNTH_EVENT_STOP|mei                <eps>


# 0151-0160 Food2

1    151   RECOG_EVENT_STOP|食べ物             VALUE_EVAL|random|LE|50
151  152   VALUE_EVENT_EVAL|random|LE|50|TRUE  MODEL_ADD|panel|Accessory\food\ra-men.bmp|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
152  154   <eps>                               SYNTH_START|mei|mei_voice_normal|深夜のラーメンです。
151  153   VALUE_EVENT_EVAL|random|LE|50|FALSE MODEL_ADD|panel|Accessory\food\curry.bmp|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
153  154   <eps>                               SYNTH_START|mei|mei_voice_normal|二日目のカレーです。
154  155   SYNTH_EVENT_STOP|mei                 MODEL_DELETE|panel
155  156   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
156   2    SYNTH_EVENT_STOP|mei                <eps>


#0161-170 北海道

1    161   RECOG_EVENT_STOP|北海道          SYNTH_START|mei|mei_voice_normal|おばんです。
161  162   <eps>                            SYNTH_START|mei|mei_voice_normal|北海道の観光サイトを開きます。
162  163   <eps>                            EXECUTE|https://www.visit-hokkaido.jp/
163   2    SYNTH_EVENT_STOP|mei                <eps>


#0171-180 青森

1    171   RECOG_EVENT_STOP|青森           SYNTH_START|mei|mei_voice_normal|おはようごすー。
171  172   <eps>                           SYNTH_START|mei|mei_voice_normal|青森の観光サイトを開きます。
172  173   <eps>                           EXECUTE|https://www.aptinet.jp/index.html
173   2    SYNTH_EVENT_STOP|mei                <eps>

#0181-190 新潟

1    181   RECOG_EVENT_STOP|新潟          SYNTH_START|mei|mei_voice_normal|なじら。
181  182   <eps>                           SYNTH_START|mei|mei_voice_normal|新潟県の観光サイトを開きます。
182  183   <eps>                           EXECUTE|https://www.niigata-kankou.or.jp/
183   2    SYNTH_EVENT_STOP|mei                <eps>


#0191-200 岐阜

1    191   RECOG_EVENT_STOP|岐阜            SYNTH_START|mei|mei_voice_normal|おいでんさい。
191  192   <eps>                            SYNTH_START|mei|mei_voice_normal|岐阜県の観光サイトを開きます。
192  193   <eps>                            EXECUTE|https://www.pref.gifu.lg.jp/
193  193   RECOG_EVENT_STOP|観光地             SYNTH_START|mei|mei_voice_normal|下呂温泉や白川郷が有名ですね。
193  193   RECOG_EVENT_STOP|名物      SYNTH_START|mei|mei_voice_normal|飛騨牛や牡丹鍋といった肉料理がおすすめです。
193  194   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
194   2    SYNTH_EVENT_STOP|mei                <eps>


#0201-210 群馬

1    201   RECOG_EVENT_STOP|群馬          SYNTH_START|mei|mei_voice_normal|群馬県へようこそ。
201  202   <eps>                            SYNTH_START|mei|mei_voice_normal|群馬県の観光サイトを開きます。
202  203   <eps>                            EXECUTE|https://gunma-dc.net/
203  203  RECOG_EVENT_STOP|観光地             SYNTH_START|mei|mei_voice_normal|尾瀬沼や富岡製糸場が観光におすすめですよ。
203  203  RECOG_EVENT_STOP|名物               SYNTH_START|mei|mei_voice_normal|焼きまんじゅうやおっきりこみがおいしいです。
203  204  RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
204   2    SYNTH_EVENT_STOP|mei                <eps>


#0211-220 京都

1    211   RECOG_EVENT_STOP|京都           SYNTH_START|mei|mei_voice_normal|おこしやす。
211  212   <eps>                           SYNTH_START|mei|mei_voice_normal|京都府の観光サイトを開きます。
212  213   <eps>                           EXECUTE|http://kanko.city.kyoto.lg.jp/
213  213  RECOG_EVENT_STOP|観光地          SYNTH_START|mei|mei_voice_normal|金閣寺、平等院鳳凰堂、清水寺に行くのはどうでしょう？
213  213  RECOG_EVENT_STOP|名物            SYNTH_START|mei|mei_voice_normal|宇治金時や宇治抹茶を食べに行きましょう。
213  214   RECOG_EVENT_STOP|ありがとう     SYNTH_START|mei|mei_voice_normal|どういたしまして。
213    2     SYNTH_EVENT_STOP|mei          <eps>

#0221-0230 鳥取

1    221   RECOG_EVENT_STOP|鳥取             SYNTH_START|mei|mei_voice_normal|おはようございましてなあ。
221  222   <eps>                             SYNTH_START|mei|mei_voice_normal|鳥取県の観光サイトを開きます。
222  223   <eps>                             EXECUTE|https://www.tottori-guide.jp/
223  223   RECOG_EVENT_STOP|観光地           SYNTH_START|mei|mei_voice_normal|砂の美術館や鳥取砂丘に行くのはどうでしょう？
223  223   RECOG_EVENT_STOP|名物             SYNTH_START|mei|mei_voice_normal|カニを食べに行きましょう。
223  224   RECOG_EVENT_STOP|ありがとう       SYNTH_START|mei|mei_voice_normal|どういたしまして。
223  2     SYNTH_EVENT_STOP|mei              <eps>


#0231-0240 愛媛

1    231   RECOG_EVENT_STOP|愛媛          SYNTH_START|mei|mei_voice_normal|愛媛県へようこそ。
231  232   <eps>                            SYNTH_START|mei|mei_voice_normal|愛媛県の観光サイトを開きます。
232  233   <eps>                            EXECUTE|https://www.iyokannet.jp/
323   2    SYNTH_EVENT_STOP|mei                <eps>


#0241-250 福岡

1    241   RECOG_EVENT_STOP|福岡               SYNTH_START|mei|mei_voice_normal|よう来たね。
241  242   <eps>                               SYNTH_START|mei|mei_voice_normal|福岡県の観光サイトを開きます。
242  243   <eps>                               EXECUTE|https://www.crossroadfukuoka.jp/
243  243  RECOG_EVENT_STOP|観光地              SYNTH_START|mei|mei_voice_normal|学問で有名な太宰府天満宮がおすすめです。
243  243  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|屋台でとんこつラーメンを食べることができます。
243  244  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
244    2  YNTH_EVENT_STOP|mei                  <eps>


#0251-260 沖縄
1    251   RECOG_EVENT_STOP|沖縄               SYNTH_START|mei|mei_voice_slow|めんそーれ。
1    251   RECOG_EVENT_STOP|めんそーれ         SYNTH_START|mei|mei_voice_slow|めんそーれ。
251  252   <eps>                               SYNTH_START|mei|mei_voice_normal|沖縄県の観光サイトを開きます。
252  253   <eps>                               EXECUTE|https://www.okinawastory.jp/
253  253   RECOG_EVENT_STOP|観光地             SYNTH_START|mei|mei_voice_normal|ダイビングやシュノーケリング、首里城観光ができます。
253  253   RECOG_EVENT_STOP|名物               SYNTH_START|mei|mei_voice_normal|沖縄そばやサーターアンダギーが有名です。
253  254   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
254    2   SYNTH_EVENT_STOP|mei                <eps>


#0261-270 長野

1    261   RECOG_EVENT_STOP|長野              SYNTH_START|mei|mei_voice_normal|おいでなんし。
261  262   <eps>                              SYNTH_START|mei|mei_voice_normal|長野県の観光サイトを開きます。
262  263   <eps>                              EXECUTE|https://www.nagano-tabi.net/
263  263  RECOG_EVENT_STOP|観光地             SYNTH_START|mei|mei_voice_normal|善光寺や松本城といった歴史的建造物がありますよ。
263  263  RECOG_EVENT_STOP|名物               SYNTH_START|mei|mei_voice_normal|山賊焼きや鯉料理が有名です。
264  264  RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
264   2    SYNTH_EVENT_STOP|mei                <eps>


#0271-280 山口

1    271   RECOG_EVENT_STOP|山口                SYNTH_START|mei|mei_voice_normal|おいでませ。
271  272   <eps>                                SYNTH_START|mei|mei_voice_normal|山口県の観光サイトを開きます。
272  273   <eps>                                EXECUTE|http://www.oidemase.or.jp/tourism-spot
273    2   SYNTH_EVENT_STOP|mei                <eps>

#0281-290 佐賀

1    281   RECOG_EVENT_STOP|佐賀                SYNTH_START|mei|mei_voice_normal|佐賀県へようこそ。
281  282   <eps>                                SYNTH_START|mei|mei_voice_normal|佐賀県の観光サイトを開きます。
282  283   <eps>                                EXECUTE|https://www.asobo-saga.jp/search/
283   2    SYNTH_EVENT_STOP|mei                 <eps>


# 0291-0300 占い

1    291   RECOG_EVENT_STOP|占い                VALUE_EVAL|random|LE|50
1    291   RECOG_EVENT_STOP|うらない            VALUE_EVAL|random|LE|50
1    291   RECOG_EVENT_STOP|いらない            VALUE_EVAL|random|LE|50
1    291   RECOG_EVENT_STOP|いら,ない           VALUE_EVAL|random|LE|50
1    291   RECOG_EVENT_STOP|占って              VALUE_EVAL|random|LE|50
1    291   RECOG_EVENT_STOP|運勢                VALUE_EVAL|random|LE|50

291  292   VALUE_EVENT_EVAL|random|LE|50|TRUE   SYNTH_START|mei|mei_voice_happy|今日はハッピーデー！
292  293   <eps>                                VALUE_EVAL|random|LE|50
293  297   VALUE_EVENT_EVAL|random|LE|50|TRUE   SYNTH_START|mei|mei_voice_normal|ラッキーアイテムはきらきらしたものです！
293  297   VALUE_EVENT_EVAL|random|LE|50|FALSE  SYNTH_START|mei|mei_voice_normal|ラッキーパーソンは背の高い人です。

291  295   VALUE_EVENT_EVAL|random|LE|50|FALSE  SYNTH_START|mei|mei_voice_normal|今日の運勢はいまいち。忘れ物に気をつけて。
295  296   <eps>                                VALUE_EVAL|random|LE|50
296  297   VALUE_EVENT_EVAL|random|LE|50|TRUE   SYNTH_START|mei|mei_voice_normal|ラッキーアイテムは眼鏡です。
296  297   VALUE_EVENT_EVAL|random|LE|50|FALSE  SYNTH_START|mei|mei_voice_normal|ラッキーアイテムはイヤホンです。

297  298   <eps>                                SYNTH_START|mei|mei_voice_normal|今日も一日がんばりましょう！
298  299   <eps>                                MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
299    2   SYNTH_EVENT_STOP|mei                <eps>


# 0301-0310 お店

1    301   RECOG_EVENT_STOP|蛤                  SYNTH_START|mei|mei_voice_normal|中華、和食、インド料理、カフェ、麺類、フレンチ、どれにしますか。
1    301   RECOG_EVENT_STOP|ハンガリー          SYNTH_START|mei|mei_voice_normal|中華、和食、インド料理、カフェ、麺類、フレンチ、どれにしますか。
1    301   RECOG_EVENT_STOP|ハングリー          SYNTH_START|mei|mei_voice_normal|中華、和食、インド料理、カフェ、麺類、フレンチ、どれにしますか。
1    301   RECOG_EVENT_STOP|おなかへった        SYNTH_START|mei|mei_voice_normal|中華、和食、インド料理、カフェ、麺類、フレンチ、どれにしますか。
1    301   RECOG_EVENT_STOP|はらへり            SYNTH_START|mei|mei_voice_normal|中華、和食、インド料理、カフェ、麺類、フレンチ、どれにしますか。
301  302   RECOG_EVENT_STOP|中華                SYNTH_START|mei|mei_voice_normal|すいとんぽうがおすすめです。ウェブサイトを表示します。
302  308   <eps>                                EXECUTE|https://r.gnavi.co.jp/plan/gazd600/plan-reserve/plan/plan_list/?sc_cid=google_kg_reserve
301  303   RECOG_EVENT_STOP|和食                SYNTH_START|mei|mei_voice_normal|里やまがおすすめです。ウェブサイトを表示します。
303  308   <eps>                                EXECUTE|https://tabelog.com/tokyo/A1329/A132903/13106866/
301  304   RECOG_EVENT_STOP|インド              SYNTH_START|mei|mei_voice_normal|インドレストランデルコスがおすすめです。ウェブサイトを表示します。
304  308   <eps>                                EXECUTE|https://r.gnavi.co.jp/e670600/
301  305   RECOG_EVENT_STOP|カフェ              SYNTH_START|mei|mei_voice_normal|バーゼル高倉店がおすすめです。ウェブサイトを表示します。
305  308   <eps>                                EXECUTE|http://www.basel.co.jp/takakura.html
301  306   RECOG_EVENT_STOP|麺類                SYNTH_START|mei|mei_voice_normal|中華そば専門店みんみんがおすすめです。ウェブサイトを表示します。
306  308   <eps>                                EXECUTE|https://tabelog.com/tokyo/A1329/A132903/13205812/
301  307   RECOG_EVENT_STOP|フィレンツェ        SYNTH_START|mei|mei_voice_normal|ルミエルがおすすめです。ウェブサイトを表示します。
301  307   RECOG_EVENT_STOP|フレンチ            SYNTH_START|mei|mei_voice_normal|ルミエルがおすすめです。ウェブサイトを表示します。
307  308   <eps>                                EXECUTE|https://tabelog.com/tokyo/A1329/A132903/13053198/
308   2    SYNTH_EVENT_STOP|mei                <eps>

# 0311-0320 呼びかけ
1    311   RECOG_EVENT_STOP|メイちゃん         SYNTH_START|mei|何でしょう。
1    311   RECOG_EVENT_STOP|メイちゃん         SYNTH_START|mei|何かお困りですか。
1    311   RECOG_EVENT_STOP|ねえねえ           SYNTH_START|mei|何かお困りですか。
1    311   RECOG_EVENT_STOP|ねえ               SYNTH_START|mei|何かお困りですか。
311    2   SYNTH_EVENT_STOP|mei                <eps>


# 0321-   旅行会話
1    321   RECOG_EVENT_STOP|旅行               SYNTH_START|mei|mei_voice_normal|良いですね。西日本と東日本、どちらに行きたいですか？
1    321   RECOG_EVENT_STOP|旅                 SYNTH_START|mei|mei_voice_normal|良いですね。西日本と東日本、どちらに行きたいですか？
321  322   RECOG_EVENT_STOP|東日本             SYNTH_START|mei|mei_voice_normal|東日本ですね。北海道、東北地方と関東、中部地方、どちらに行きたいですか？
321  322   RECOG_EVENT_STOP|東             SYNTH_START|mei|mei_voice_normal|東日本ですね。北海道、東北地方と関東、中部地方、どちらに行きたいですか？
321  324   RECOG_EVENT_STOP|西日本             SYNTH_START|mei|mei_voice_normal|西日本ですね。近畿、中国、四国地方と九州、沖縄地方、どちらに行きたいですか？
321  324   RECOG_EVENT_STOP|西             SYNTH_START|mei|mei_voice_normal|西日本ですね。近畿、中国、四国地方と九州、沖縄地方、どちらに行きたいですか？
322  500   RECOG_EVENT_STOP|北海道             SYNTH_START|mei|mei_voice_normal|北海道、東北地方ですね。
322  500   RECOG_EVENT_STOP|東北               SYNTH_START|mei|mei_voice_normal|北海道、東北地方ですね。
322  601   RECOG_EVENT_STOP|関東               SYNTH_START|mei|mei_voice_normal|関東、中部地方ですね。
322  601   RECOG_EVENT_STOP|中部               SYNTH_START|mei|mei_voice_normal|関東、中部地方ですね
324  400   RECOG_EVENT_STOP|近畿               SYNTH_START|mei|mei_voice_normal|近畿、中国、四国地方ですね。
324  400   RECOG_EVENT_STOP|中国               SYNTH_START|mei|mei_voice_normal|近畿、中国、四国地方ですね。
324  400   RECOG_EVENT_STOP|四国               SYNTH_START|mei|mei_voice_normal|近畿、中国、四国地方ですね。
324  701   RECOG_EVENT_STOP|九州               SYNTH_START|mei|mei_voice_normal|九州、沖縄地方ですね。
324  701   RECOG_EVENT_STOP|沖縄               SYNTH_START|mei|mei_voice_normal|九州、沖縄地方ですね。



#高橋分(近畿・中国・四国)
400  401  <eps>                                 SYNTH_START|mei|mei_voice_normal|観光よりもグルメを楽しみたいよね？
401  402  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|自然がだいすきですか？
402  403  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|あなたはロマンチストですか？
403  461  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|そんなあなたに百万ドルの夜景の神戸のある兵庫がおすすめです。
403  221  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|広大な砂丘がある鳥取がおすすめだよ！

402  405  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|建造物がが好き？
405  431  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|白塗り壁の蔵の街並みの倉敷がある岡山いいかも！
405  406  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|世界遺産に興味はありますか？
406  407  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|アクセスが良いほうがいいかな？
406  441  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|伊勢神宮がある三重県に行ってみてはどうでしょう？
407  451  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|ちょっとアクセス悪いけど一度は行ってみたい熊野古道のある和歌山県はどうですか？
407  211  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|世界遺産のお寺や神社のたくさんある京都県に行ってみるのはいかがですか？

401  408  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|海鮮などのおいしいものよりもがっつりグルメを食べたいですか？
408  409  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|粉ものよりも麺類が好きですか？
409  410  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|うどんよりも蕎麦食べたいなあ？
410  465  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|そんなあなたに出雲そばで有名な島根がおすすめだよ！
410  471  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|問答無用で讃岐うどんを食べに香川県に行こう！ちなみに日本で一番小さい都道府県らしいですよ！
409  421  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|じぶん、こなもんが好きやったら、ぜひ大阪まできたってや！

408  411  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|魚より貝食べたいですか？
411  491  RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|広島の牡蠣小屋に行って牡蠣を食べらんじゃけ？
411  481  RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|カツオのたたきで有名な高知に行ってみてはどうでしょう？

#大阪府
1   421   RECOG_EVENT_STOP|大阪                 SYNTH_START|mei|mei_voice_normal|大阪府の観光サイトを開きます。
421 422   <eps>                                 EXECUTE|https://osaka-info.jp/
422 422   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|USJや大阪城といった観光スポットがありますよ。
422 422   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|たこ焼きやお好み焼きが有名です。
422 423   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
423 2     SYNTH_EVENT_STOP|mei                  <eps>
#岡山県
1   431   RECOG_EVENT_STOP|岡山                 SYNTH_START|mei|mei_voice_normal|岡山県の観光サイトを開きます。
431 432   <eps>                                 EXECUTE|https://okayama-kanko.net/sightseeing/model_course.php
432 432   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|倉敷や吉備津神社などの大河ドラマ軍師官兵衛のゆかりの地があります。
432 432   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|デミカツ丼や鰆が有名です。
432 433   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
433 2     SYNTH_EVENT_STOP|mei                  <eps>
#三重県
1   441   RECOG_EVENT_STOP|三重                 SYNTH_START|mei|mei_voice_normal|三重県の観光サイトを開きます。
441 442   <eps>                                 EXECUTE|https://www.kankomie.or.jp/index.html
442 442   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|伊勢神宮やナガシマスパーランドに行くのはどうでしょう？
442 442   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|伊勢海老や松坂牛を食べに行きましょう。
442 443   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
443 2     SYNTH_EVENT_STOP|mei                  <eps>
#和歌山県
1   451   RECOG_EVENT_STOP|和歌山               SYNTH_START|mei|mei_voice_normal|和歌山県の観光サイトを開きます。
451 452   <eps>                                 EXECUTE|https://www.wakayama-kanko.or.jp/
452 452   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|高野山熊野古道は有名ですね。
452 452   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|マグロや和歌山ラーメンを食べるのはどうでしょう？
452 453   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
453 2     SYNTH_EVENT_STOP|mei                  <eps>
#兵庫県
1   461   RECOG_EVENT_STOP|兵庫                 SYNTH_START|mei|mei_voice_normal|兵庫県の観光サイトを開きます。
461 462   <eps>                                 EXECUTE|http://www.hyogo-tourism.jp/
462 462   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|神戸の百万ドルの夜景や姫路城は楽しめると思います。
462 462   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|明石焼きやホルモン焼きそばがお勧めです。
462 463   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
463 2     SYNTH_EVENT_STOP|mei                  <eps>


#島根県
1   465   RECOG_EVENT_STOP|島根                 SYNTH_START|mei|mei_voice_normal|島根県の観光サイトを開きます。
465 466   <eps>                                 EXECUTE|https://www.kankou-shimane.com/
466 466   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|出雲大社や石見銀山や松江城に行くのはどうでしょう？
466 466   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|出雲そばやこおりぜんざいを食べに行きましょう。
466 467   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
467 2     SYNTH_EVENT_STOP|mei                  <eps>
#香川県
1   471   RECOG_EVENT_STOP|香川                 SYNTH_START|mei|mei_voice_normal|香川県の観光サイトを開きます。
471 472   <eps>                                 EXECUTE|https://www.my-kagawa.jp/
472 472   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|瀬戸大橋やエンジェルロードが有名です！お兄さん、トレンディーだね。うーん、トレンディーエンジェル。
472 472   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|うどんやうどんやうどんを食べるのはどうでしょう？
472 473   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
473 2     SYNTH_EVENT_STOP|mei                  <eps>
#高知県
1   481   RECOG_EVENT_STOP|高知                 SYNTH_START|mei|mei_voice_normal|高知県の観光サイトを開きます。
481 482   <eps>                                 EXECUTE|https://www.attaka.or.jp/
482 482   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|竜馬ゆかりの地土佐の桂浜や高知城はどうでしょう。
482 482   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|鰹のたたきやサバの姿寿司などの海鮮がお勧めです。
482 483   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
483 2     SYNTH_EVENT_STOP|mei                 <eps>

#広島県
1   491   RECOG_EVENT_STOP|広島                 SYNTH_START|mei|mei_voice_normal|広島県の観光サイトを開きます。
491 492   <eps>                                 EXECUTE|https://www.hiroshima-kankou.com/
492 492   RECOG_EVENT_STOP|観光                 SYNTH_START|mei|mei_voice_normal|原爆ドームや宮島の厳島神社に行きましょう。
492 492   RECOG_EVENT_STOP|名物                 SYNTH_START|mei|mei_voice_normal|牡蠣やもみじ饅頭がお勧めです。
492 493   RECOG_EVENT_STOP|ありがとう           SYNTH_START|mei|mei_voice_normal|どういたしまして。
493 2     SYNTH_EVENT_STOP|mei                  <eps>
#ここまで（高橋分）

#北海道・東北
500  501  <eps>                                  SYNTH_START|mei|mei_voice_normal|自然はお好きですか？
501  502  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|牛はお好きですか？
502  510  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|宮城県の松島がおすすめですよ。
502  520  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|青森県から秋田県にかけて広がる白神山地はどうでしょう？
501  504  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|羊はお好きですか？
504  505  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|動物はお好きですか？
505  530  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|岩手県にある小岩井農場がおすすめですよ。
505  506  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|北海道にある函館山展望台がおすすめですよ。

504  509  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|歴史的建造物はお好きですか？
509  510  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|お寺はお好きですか？
507  550  RECOG_EVENT_STOP|はい                  SYNTH_START|mei|mei_voice_normal|岩手県にある中尊寺金色堂がおすすめですよ。
507  560  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|青森県にある弘前城がおすすめですよ。
509  570  RECOG_EVENT_STOP|いえ                SYNTH_START|mei|mei_voice_normal|では、食べ物のおすすめを紹介しますね。秋田県のきりたんぽはいかがでしょう。

#宮城県

510  511  <eps>                                    SYNTH_START|mei|mei_voice_normal|宮城県の観光サイトを開きます。松島は日本三景のひとつにも数えられており、とても綺麗ですよ。また、宮城県は牛タンが有名なので食べてみてはいかがでしょう。おすすめのお店はりきゅうです。
511  512  <eps>                                    EXECUTE|https://www.pref.miyagi.jp/site/kankou/
512  513  RECOG_EVENT_STOP|ありがとう              SYNTH_START|mei|mei_voice_normal|どういたしまして。
513    2  SYNTH_EVENT_STOP|mei                     <eps>

#青森県

520  521  <eps>                                    SYNTH_START|mei|mei_voice_normal|青森県の観光サイトを開きます。白神山地は屋久島と並んで日本で初めてユネスコ世界遺産に登録されました。世界最大級の原生的なブナの天然林です。
521  522  <eps>                                   EXECUTE|https://www.aptinet.jp/index.html
522  523  RECOG_EVENT_STOP|ありがとう             SYNTH_START|mei|mei_voice_normal|どういたしまして。
523    2  SYNTH_EVENT_STOP|mei                    <eps>

#岩手県

530  531  <eps>                                    SYNTH_START|mei|mei_voice_normal|岩手県の観光サイトを開きます。小岩井農場では羊ショーや乗馬などのアクティビティがあります。また、牧場で作られたチーズは絶品であり、乳業工場の見学もできます。
531  532  <eps>                                   EXECUTE|https://iwatetabi.jp/
532  533  RECOG_EVENT_STOP|ありがとう             SYNTH_START|mei|mei_voice_normal|どういたしまして。
533    2  SYNTH_EVENT_STOP|mei                    <eps>

#北海道
540  541  <eps>                                    SYNTH_START|mei|mei_voice_normal|北海道の観光サイトを開きます。函館山展望台は函館市と近郊を一望できる展望台です。両側を海に囲まれた独特の地形が演出する眺望は特に夜景がおすすめです。
541  542  <eps>                                    EXECUTE|https://www.visit-hokkaido.jp/
542    2  RECOG_EVENT_STOP|ありがとう              SYNTH_START|mei|mei_voice_normal|どういたしまして。

#中尊寺

550  551  <eps>                                    SYNTH_START|mei|mei_voice_normal|中尊寺金色堂のサイトを開きます。ここは国宝としても名高い仏堂です。
551  552  <eps>                                    EXECUTE|http://www.chusonji.or.jp/guide/precincts/konjikido.html
552  553  RECOG_EVENT_STOP|ありがとう              SYNTH_START|mei|mei_voice_normal|どういたしまして。
553    2  SYNTH_EVENT_STOP|mei                     <eps>

#弘前城

560  561  <eps>                                    SYNTH_START|mei|mei_voice_normal|弘前城のサイトを開きます。桜が綺麗なお花見の季節がよりおすすめです。また、弘前公園では様々な動植物も見ることができます。
561  562  <eps>                                    EXECUTE|https://www.hirosakipark.jp
562  563  RECOG_EVENT_STOP|ありがとう              SYNTH_START|mei|mei_voice_normal|どういたしまして。
563    2  SYNTH_EVENT_STOP|mei                      <eps>

#きりたんぽ

570  571  <eps>                                    SYNTH_START|mei|mei_voice_normal|秋田県では、秋田きりたんぽやというお店がおすすめです。きりたんぽ以外にも様々な郷土料理が揃っています。
571  572  <eps>                                    EXECUTE|http://marutomisuisan.jpn.com/kiritanpoya/
572  573  RECOG_EVENT_STOP|ありがとう              SYNTH_START|mei|mei_voice_normal|どういたしまして。
573    2  SYNTH_EVENT_STOP|mei                     <eps>


#石井分(関東・中部)
601  602   <eps>                               SYNTH_START|mei|mei_voice_normal|世界遺産に興味はありますか？
602  603   RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|お肉は好きですか？
603  604   RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|広大な自然は好きですか？
604  619   RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|富士山がよく見える山梨県がおすすめです。
604  192   RECOG_EVENT_STOP|いえ             SYNTH_START|mei|mei_voice_normal|白川郷のある岐阜県はどうでしょう？
603  202   RECOG_EVENT_STOP|いえ             SYNTH_START|mei|mei_voice_normal|富岡製糸場で有名な群馬県はいかがですか？
602  608   RECOG_EVENT_STOP|いえ             SYNTH_START|mei|mei_voice_normal|揚げ物はお好きですか？
608  609   RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|お寺や神社に興味はありますか？
609  262   RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|善光寺のある長野県がおすすめですよ。
609  613   RECOG_EVENT_STOP|いえ             SYNTH_START|mei|mei_voice_normal|味噌カツがおいしい愛知県に行ってみてはどうでしょう？
608  616   RECOG_EVENT_STOP|いえ             SYNTH_START|mei|mei_voice_normal|越前ガニが名物の福井県に行ってみるのはいかがですか？

#愛知県
611  613   RECOG_EVENT_STOP|愛知               SYNTH_START|mei|mei_voice_normal|愛知県の観光サイトを開きます。
613  614   <eps>                               EXECUTE|https://www.aichi-now.jp/
614  614  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|名古屋城や東山動物園に行くのはどうでしょう？
614  614  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|味噌カツや手羽先を食べに行きましょう。
614  615  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
615    2    SYNTH_EVENT_STOP|mei               <eps>

#福井県
612  616   RECOG_EVENT_STOP|福井               SYNTH_START|mei|mei_voice_normal|福井県の観光サイトを開きます。
616  617   <eps>                               EXECUTE|https://www.fuku-e.com/
617  617  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|福井県立恐竜博物館や東尋坊は有名ですね。
617  617  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|越前ガニやデザートに羊羹を食べるのはどうでしょう？
617  618  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
618    2    SYNTH_EVENT_STOP|mei               <eps>

#山梨県
  1  605   RECOG_EVENT_STOP|山梨               SYNTH_START|mei|mei_voice_normal|山梨県の観光サイトを開きます。
605  620   <eps>                               EXECUTE|http://koshuyumekouji.com/yamanashi/
620  620  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|富士急ハイランドや山中湖は楽しめると思います。
620  620  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|馬刺しやといったブドウ、ワインがお勧めです。
620  621  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
621    2    SYNTH_EVENT_STOP|mei               <eps>
#ここまで（石井分） 

#九州沖縄
701  702   <eps>                                 SYNTH_START|mei|mei_voice_normal|ラーメンは好きですか？
702  703   RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|山や自然好きですか？
703  704   RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|豚肉は好きですか？
704  705   RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|桜島や黒豚が有名な鹿児島がおすすめです。
704  706   RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|阿蘇山や馬刺しが有名な熊本はいかがですか？
703  241   RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|とんこつラーメンや辛子明太子が有名な福岡はいかがですか？

702  707   RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|温泉は好きですか？
707  708   RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|湯布院や別府温泉が有名な大分がお勧めです。
707  709   RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|海は好きですか？
709  252   RECOG_EVENT_STOP|はい                 SYNTH_START|mei|mei_voice_normal|ダイビングやシュノーケリングができる沖縄がおすすめです。
709  710   RECOG_EVENT_STOP|いえ               SYNTH_START|mei|mei_voice_normal|花がきれいなハウステンボスで有名な長崎がおすすめです。

#鹿児島
  1  705   RECOG_EVENT_STOP|鹿児島             SYNTH_START|mei|mei_voice_normal|鹿児島県の観光サイトを開きます。
705  711   <eps>                               EXECUTE|http://www.kagoshima-kankou.com/
711  711  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|桜島や種子島宇宙センターがおすすめです。
711  711  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|鹿児島ラーメンや黒豚のしゃぶしゃぶが有名です。
711  712  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
712    2  SYNTH_EVENT_STOP|mei                 <eps>

#熊本
  1  706  RECOG_EVENT_STOP|熊本                SYNTH_START|mei|mei_voice_normal|熊本県の観光サイトを開きます。
706  713   <eps>                               EXECUTE|https://kumanago.jp/event/?mode=detail&id=430000000033
713  713  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|阿蘇山や阿蘇神社、ファームランドが有名ですね。
713  713  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|馬刺しやからしれんこんを食べるのはどうでしょう？
713  714  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
714    2  SYNTH_EVENT_STOP|mei                 <eps>

#大分
  1  708   RECOG_EVENT_STOP|大分               SYNTH_START|mei|mei_voice_normal|大分県の観光サイトを開きます。
708  715   <eps>                               EXECUTE|https://www.visit-oita.jp/
715  715  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|別府温泉や湯布院が有名ですね。
715  715  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|鳥飯や地獄蒸しぷりんを食べるのはどうでしょう？
715  716  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
716    2  SYNTH_EVENT_STOP|mei                 <eps>

#長崎
  1  710   RECOG_EVENT_STOP|長崎               SYNTH_START|mei|mei_voice_normal|長崎県の観光サイトを開きます。
710  717   <eps>                               EXECUTE|https://www.nagasaki-tabinet.com/
717  717  RECOG_EVENT_STOP|観光                SYNTH_START|mei|mei_voice_normal|ハウステンボスや軍艦島がおすすめです。
717  717  RECOG_EVENT_STOP|名物                SYNTH_START|mei|mei_voice_normal|ちゃんぽんやカステラがおいしいですよ。
717  718  RECOG_EVENT_STOP|ありがとう          SYNTH_START|mei|mei_voice_normal|どういたしまして。
718    2  SYNTH_EVENT_STOP|mei                 <eps>


#BGM
  1  800  RECOG_EVENT_STOP|音楽              SYNTH_START|mei|mei_voice_normal|五つのBGMがあります。1,2,3,4,5のなかから選んで下さい。
  1  800  RECOG_EVENT_STOP|BGM               SYNTH_START|mei|mei_voice_normal|五つのBGMがあります。1,2,3,4,5のなかから選んで下さい。
800    2  RECOG_EVENT_STOP|一                SOUND_START|music|Music\Music2\At_The_Fair.mp3
800    2  RECOG_EVENT_STOP|二                SOUND_START|music|Music\Music2\Jigsaw_Puzzle.mp3
800    2  RECOG_EVENT_STOP|三                SOUND_START|music|Music\Music2\Ponies_and_Balloons.mp3
800    2  RECOG_EVENT_STOP|四                SOUND_START|music|Music\Music2\Splashing_Around.mp3
800    2  RECOG_EVENT_STOP|五                SOUND_START|music|Music\Music2\Yoimatsurinokaze.mp3
  1    2  RECOG_EVENT_STOP|ストップ          SOUND_STOP|music



#高橋分海外編

1    2010  RECOG_EVENT_STOP|海外いきたい SYNTH_START|mei|mei_voice_normal|お勧めの海外の国々を紹介します。質問に答えてね！極寒地はいやである。
1    2010  RECOG_EVENT_STOP|海外         SYNTH_START|mei|mei_voice_normal|お勧めの海外の国々を紹介します。質問に答えてね！極寒地はいやである。
1    2010  RECOG_EVENT_STOP|海外旅行     SYNTH_START|mei|mei_voice_normal|お勧めの海外の国々を紹介します。質問に答えてね！極寒地はいやである。
2010 2020  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|近くがいいですか。
2020 2050  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|グルメを楽しみたい。観光はいいかな。
2020 2040  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|英語を使える地域がいいかな。
2020 2040  RECOG_EVENT_STOP|いえいえ     SYNTH_START|mei|mei_voice_normal|英語を使える地域がいいかな。
2040 2060  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|おいしいものがたくさんあるところがいい。
2040 2070  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|スペイン語話したい。
2060 2090  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|世界遺産たくさん見たい。
2060 2110  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|ジャンクフードが好き。
2050 2080  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|肉やからいもの食べたい。
2070 2100  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|本場でスペイン語学びたい。
2010 2030  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|英語が使える地域が良い。

2090 2215  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|イタリアはどうでしょう。
2090 2225  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|フランスはどうでしょう。
2090 2225  RECOG_EVENT_STOP|いえ         SYNTH_START|mei|mei_voice_normal|フランスはどうでしょう。
2110 2325  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|アメリカはどうでしょう。
2110 2235  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|イギリスはどうでしょう。
2100 2255  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|メキシコはどうでしょう。
2100 2245  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|スペインはどうでしょう。
2070 2265  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|トルコはどうでしょう。
2080 2275  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|台湾はどうでしょう。
2080 2285  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|韓国がいいですね。
2050 2295  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|中国に行ってみてはどうでしょう。
2030 2305  RECOG_EVENT_STOP|いいえ       SYNTH_START|mei|mei_voice_normal|ロシアはどうでしょう。
2030 2315  RECOG_EVENT_STOP|はい         SYNTH_START|mei|mei_voice_normal|カナダはどうでしょう。


#イタリア
2215 2210  <eps>                      SYNTH_START|mei|mei_voice_normal|チャオ。イタリアをお勧めします。おすすめの情報をお伝えしましょうか。
2210 2214  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|世界遺産の宝庫、イタリア。芸術、文化、観光、食、ショッピングなど魅力満載で、陽気にホスピタリティあふれる人々が迎えてくれる国です。
2210 2214  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！チャオ！
2214 2     SYNTH_EVENT_STOP|mei       <eps>
#フランス
2225 2220  <eps>                      SYNTH_START|mei|mei_voice_normal|ボンジュール。フランスをお勧めします。おすすめの情報をお伝えしましょうか。
2220 2221  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|フランスは、あらゆる面において豊かな国。食通をうならせる料理とワインにスイーツ、そして多彩な魅力にあふれた地方の町。飽きることのない世界有数の観光大国です。
2220 2222  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！オウ ルヴォワー！
2221 2     SYNTH_EVENT_STOP|mei       <eps>
2222 2     SYNTH_EVENT_STOP|mei       <eps>
#イギリス
2235 2230  <eps>                      SYNTH_START|mei|mei_voice_normal|イギリスをお勧めします。おすすめの情報をお伝えしましょうか。
2230 2231  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|ショッピング、エンターテインメントなど、あらゆる文化の最先端と伝統が混在するロンドンは、一味違った魅力が凝縮されているさまざまな顔を持っている国です。
2230 2231  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！バイバイ！
2231 2     SYNTH_EVENT_STOP|mei       <eps>
2232 2     SYNTH_EVENT_STOP|mei       <eps>
#スペイン
2245 2240  <eps>                      SYNTH_START|mei|mei_voice_normal|スペインをお勧めします。おすすめの情報をお伝えしましょうか。
2240 2241  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|太陽と情熱の国、フラメンコと闘牛の国。首都マドリッド、バルセロナをはじめ、地方や町ごとに多彩な個性をもつ建築や芸術などが豊かな文化遺産の中に息づいています。
2240 2242  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！エスタルエゴ！
2241 2     SYNTH_EVENT_STOP|mei       <eps>
2242 2     SYNTH_EVENT_STOP|mei       <eps>
#メキシコ
2255 2250  <eps>                      SYNTH_START|mei|mei_voice_normal|メキシコをお勧めします。おすすめの情報をお伝えしましょうか。
2250 2251  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|メキシコは日本の約5倍の国土面積をもつ大国。メキシコは各地に多様な文化があり、遺跡や古都、ビーチリゾートなどの観光要素が盛りだくさんです。
2250 2252  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！グラシアス！
2251 2     SYNTH_EVENT_STOP|mei       <eps>
2252 2     SYNTH_EVENT_STOP|mei       <eps>
#トルコ
2265 2260  <eps>                      SYNTH_START|mei|mei_voice_normal|トルコをお勧めします。おすすめの情報をお伝えしましょうか。
2260 2261  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|黒海、エーゲ海、地中海に囲まれ、世界遺産に登録されているカッパドキア、世界で愛されるトルコ料理など、その魅力は尽きません。
2260 2262  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！アラハウスマルラドゥク！
2261 2     SYNTH_EVENT_STOP|mei       <eps>
2262 2     SYNTH_EVENT_STOP|mei       <eps>
#台湾
2275 2270  <eps>                      SYNTH_START|mei|mei_voice_normal|台湾をお勧めします。おすすめの情報をお伝えしましょうか。
2270 2271  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|異国なのだがどこか懐かしい感じのする台湾。限りなく日本に愛着と憧憬を持ち続けている人が多く、訪れたならば彼らのあたたかい気持ちにふれることができます。
2270 2272  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！ツァイツェン！
2271 2     SYNTH_EVENT_STOP|mei       <eps>
2272 2     SYNTH_EVENT_STOP|mei       <eps>
#韓国
2285 2280  <eps>                      SYNTH_START|mei|mei_voice_normal|韓国をお勧めします。おすすめの情報をお伝えしましょうか。
2280 2281  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|日本から2時間で着くお隣の国韓国は、知れば知るほど興味深い国。人々の考え方も常識も似ているようでかなり違います。
2281 2282  RECOG_EVENT_STOP|はい 　　 SYNTH_START|mei|mei_voice_normal|在来市場や市場ご飯は日本にないものばかり。そして現代的な街と昔ながらのレトロな路地がひとつのエリアに同居するパラレルワールドや人々の情に出会えば、
2282 2283  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|もうあなたは韓国のとりこ。ノンバーバルパフォーマンスや伝統芸能も、ぜひ現地で体感してみたい。韓国で、人情ゆたかでおいしい旅を楽しみましょう！
2280 2283  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！アニョンヒ カシプシオ！
2283 2     SYNTH_EVENT_STOP|mei       <eps>

#中國
2295 2290  <eps>                      SYNTH_START|mei|mei_voice_normal|中国をお勧めします。おすすめの情報をお伝えしましょうか。
2290 2291  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|長い歴史と広大な土地をもつ中国。偉大なる歴史的文化遺産、美麗な景色や本場中国の味に舌鼓を打て、東西南北、中国への興味は尽きることがないでしょう。
2290 2292  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！ツァイツェン！
2291 2     SYNTH_EVENT_STOP|mei       <eps>
2292 2     SYNTH_EVENT_STOP|mei       <eps>
#ロシア
2305 2300  RECOG_EVENT_STOP|ロシア    SYNTH_START|mei|mei_voice_normal|ロシアをお勧めします。おすすめの情報をお伝えしましょうか。
2300 2301  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|世界最大の領土を持つロシア。ロシアでの一番の見どころは、劇場。“舞台芸術の王国”といわれ、オペラやバレエ、芝居などハイレベルの楽しい作品をみせてくれます。
2300 2302  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！ダ スウィダーニャ！
2301 2     SYNTH_EVENT_STOP|mei       <eps>
2302 2     SYNTH_EVENT_STOP|mei       <eps>
#カナダ
2315 2310  <eps>                      SYNTH_START|mei|mei_voice_normal|カナダをお勧めします。おすすめの情報をお伝えしましょうか。
2310 2311  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|カナダといえば、広大なカナダには土地ごとに四季折々の魅力があふれている。街々でのグルメ・ショッピング・エンターテインメントの楽しみが待っています。
2310 2312  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_normal|かしこまりました！グッバイ！
2311 2     SYNTH_EVENT_STOP|mei       <eps>
2312 2     SYNTH_EVENT_STOP|mei       <eps>
#アメリカ
2325 2320  <eps>                      SYNTH_START|mei|mei_voice_normal|アメリカをお勧めします。おすすめの情報をお伝えしましょうか。
2320 2321  RECOG_EVENT_STOP|はい      SYNTH_START|mei|mei_voice_normal|広大な国だけに、地域により町の雰囲気も異なり、行く度に異なった表情を見せてくれ、ユニークでエキサイティングな旅の魅力を満喫できます。
2320 2322  RECOG_EVENT_STOP|いいえ    SYNTH_START|mei|mei_voice_nodrmal|かしこまりました！シー ユー！
2321 2     SYNTH_EVENT_STOP|mei       <eps>
2322 2     SYNTH_EVENT_STOP|mei       <eps>
#ここまで（高橋分）
1    3000  RECOG_EVENT_STOP|もっと     SYNTH_START|mei|mei_voice_normal|誰のですか。
1    3000  RECOG_EVENT_STOP|かも　　   SYNTH_START|mei|mei_voice_normal|誰のですか。
3000 3001  <eps>                       SYNTH_START|mei|mei_voice_normal|松岡かなえちゃんですね。とてもかわいいですね。
3001   2   RECOG_EVENT_STOP|mei        <eps> 