1.00
========================================================================
	mthtmllint - HTML lint check for MovableType w/ BigPAPI
			Original Copyright (c) 2006 Piroli YUKARINOMIYA
			Open MagicVox.net - http://www.magicvox.net/
			@see http://www.magicvox.net/archive/2006/03092330.php
========================================================================

■ 概要
	石野恵一郎さんが作られた Another HTML-lint を利用して、
	MovableType から編集中の記事内容を
	簡単お手軽に文法チェックするためのプラグインです。

	Another HTML-lint
	http://openlab.ring.gr.jp/k16/htmllint/htmllint.html


■ 動作環境
	MovableType 3.2ja2 以上、あるいは MovableType 3.16 以上
	別途、BigPAPI 1.04 以上が正しく導入されていること
	Perl5.004 以降、Perl5.8 以上を推奨


■ 導入方法 - プラグインの導入

1. パッケージに含まれるファイルを MovableType の plugins ディレクトリにコピーします

	note:	適当な名前でディレクトリを作成しておき、その中にコピーすると便利です

2. mthtmllint.pl をコピーした同じディレクトリに lib ディレクトリを作成しておきます

3. Another HTML-lint のダウンロードページからフルパケージをダウンロードします

	Another HTML-lint のダウンロードはこちら↓
	http://openlab.ring.gr.jp/k16/htmllint/download.html

4. 取得したファイルを全て、2.で作成した lib ディレクトリの中に展開します

	note:	実行権限や Another HTML-lint の環境設定の必要はありません
	note:	必要に応じて Another HTML-lint が要求する CPAN ライブラリを導入しておきます

5. MT管理画面の[プラグイン]を辿り mthtmllint プラグインが追加されていることを確認します

6. MT管理画面の[テンプレート]-[モジュールテンプレート]と辿り、
   "mthtmllint Entry Template" という名前でモジュールテンプレートを新規作成します

7. HTML-lint で使用するページのテンプレートを作成し保存しておきます(後述)


■ 使い方
	エントリの編集画面および、エントリのプレビュー画面に、新しく"保存(+htmllint)"ボタンが追加されています。

	記事を保存する時に、"保存(+htmllint)"ボタンを利用して記事を保存すると、
	その内容が Another HTML-lint でチェックされます。

	チェックした HTML ページと、その結果を見るのは、エントリ編集画面の下に新しく追加された
	これら 2 つのリンクでそれぞれ参照してください。

	"mthtmllint 0.90 : See INPUT page used in the last htmllint checking."
		… 文法チェックに使用した HTML ページ全体を表示します。

	"mthtmllint 0.90 : See RESULT page of the last htmllint checking."
		… 文法チェックの結果ページを表示します。


■ "mthtmllint Entry Template" モジュールテンプレートの例
	MovableType の編集画面から入力されたテキストエリアの内容は、
	そのままでは素っ裸なので Another HTML-lint でチェックすることができません。
	そのため、これらのデータの入れ物となるページをモジュールテンプレートとして作成しておく必要があります。

	入力されたデータ部分の文法チェックが主眼にあるので、本番さながらのテンプレートである必要はないでしょう。
	<HTML> や <HEAD>、<TITLE> など、HTML 文書に必要な最低限の要素があれば十分です。

--------ここから--------
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<link rev="made" href="mailto:piroli@magicvox.net" />
	<link rel="start" href="http://www.magicvox.net/" />
	<title><$MTEntryTitle$></title>
</head>
<body>
<div><$MTEntryBody$></div>
<div><$MTEntryMore$></div>
</body>
</html>
--------ここまで--------

note:	encodeing と charset は適宜書き換えてください


■ HTML-lint で使用するページのモジュールテンプレート詳細
	"mthtmllint Entry Template" という名前で作成されたモジュールテンプレートの内容に、
	"エントリーの内容(body)"や"エントリーの内容(body)"を流し込んで出来上がった HTML 文書を
	Another HTML-lint がチェックをしてくれます。

	このモジュールテンプレート中では、"エントリーの内容(body)"や"エントリーの内容(body)"が
	位置する場所に以下のテンプレートタグを使用することができます。

	note:	擬似的に MovableType のテンプレートタグを真似ていますが全くの別物です。
	note:	テンプレートタグに使用できる encode_html などのオプション指定は一切できません。

	note:	チェックの際にこれら再構築を行わないのは、レスポンスとサーバ負荷を考えた結果です :-)


<$MTEntryTitle$>
	エントリ編集画面の"タイトル"欄に入力された内容に置き換えられます。

<$MTEntryBody$>
	エントリ編集画面の"エントリの内容(body)"欄に入力された内容に置き換えられます。

<$MTEntryMore$>
	エントリ編集画面の"追記(extend)"欄に入力された内容に置き換えられます。

<$MTEntryExcerpt$>
	エントリ編集画面の"概要(excerpt)"欄に入力された内容に置き換えられます。

<$MTEntryKeywords$>
	エントリ編集画面の"キーワード"欄に入力された内容に置き換えられます。

	note:	上記以外のテンプレートタグは完全に無視されます


■ 使用許諾条件
	このソフトウェアパッケージの内容については完全に無保証です。
	このソフトウェアパッケージの配布や改変に関する条件は
	The Artistic License (http://www.opensource.jp/artistic/ja/Artistic-ja.html)
	に準じるものとし、これに従う限り自由にすることができます。
		This code is released under the Artistic License.
		The terms of the Artistic License are described at
		http://www.perl.com/language/misc/Artistic.html


■ 謝辞
	このプラグインは単なる入れ物に過ぎません。
	その本質である Another HTML-lint という素晴らしい作品をフリーで公開されている
	石野恵一郎さんに大きな感謝を！　本当にありがとうございましたm(_ _)m

	Another HTML-lint
	http://openlab.ring.gr.jp/k16/htmllint/htmllint.html


	mthtmllint プラグインの作成にあたっては次のページを参考にさせて頂きました。
		BigPAPI (c)Kevin Shay
			http://www.staggernation.com/mtplugins/BigPAPI/


■ 更新履歴
1.00	'06/03/27	文法チェックの起動方法を変更
					プレビュー画面からも文法チェックが行えるようにした
0.90    '06/03/09   初版公開
