1.00
========================================================================
	mthtmllint - HTML lint check for MovableType w/ BigPAPI
			Original Copyright (c) 2006 Piroli YUKARINOMIYA
			Open MagicVox.net - http://www.magicvox.net/
			@see http://www.magicvox.net/archive/2006/03092330.php
========================================================================

�� �T�v
	�Ζ�b��Y���񂪍��ꂽ Another HTML-lint �𗘗p���āA
	MovableType ����ҏW���̋L�����e��
	�ȒP����y�ɕ��@�`�F�b�N���邽�߂̃v���O�C���ł��B

	Another HTML-lint
	http://openlab.ring.gr.jp/k16/htmllint/htmllint.html


�� �����
	MovableType 3.2ja2 �ȏ�A���邢�� MovableType 3.16 �ȏ�
	�ʓr�ABigPAPI 1.04 �ȏオ��������������Ă��邱��
	Perl5.004 �ȍ~�APerl5.8 �ȏ�𐄏�


�� �������@ - �v���O�C���̓���

1. �p�b�P�[�W�Ɋ܂܂��t�@�C���� MovableType �� plugins �f�B���N�g���ɃR�s�[���܂�

	note:	�K���Ȗ��O�Ńf�B���N�g�����쐬���Ă����A���̒��ɃR�s�[����ƕ֗��ł�

2. mthtmllint.pl ���R�s�[���������f�B���N�g���� lib �f�B���N�g�����쐬���Ă����܂�

3. Another HTML-lint �̃_�E�����[�h�y�[�W����t���p�P�[�W���_�E�����[�h���܂�

	Another HTML-lint �̃_�E�����[�h�͂����火
	http://openlab.ring.gr.jp/k16/htmllint/download.html

4. �擾�����t�@�C����S�āA2.�ō쐬���� lib �f�B���N�g���̒��ɓW�J���܂�

	note:	���s������ Another HTML-lint �̊��ݒ�̕K�v�͂���܂���
	note:	�K�v�ɉ����� Another HTML-lint ���v������ CPAN ���C�u�����𓱓����Ă����܂�

5. MT�Ǘ���ʂ�[�v���O�C��]��H�� mthtmllint �v���O�C�����ǉ�����Ă��邱�Ƃ��m�F���܂�

6. MT�Ǘ���ʂ�[�e���v���[�g]-[���W���[���e���v���[�g]�ƒH��A
   "mthtmllint Entry Template" �Ƃ������O�Ń��W���[���e���v���[�g��V�K�쐬���܂�

7. HTML-lint �Ŏg�p����y�[�W�̃e���v���[�g���쐬���ۑ����Ă����܂�(��q)


�� �g����
	�G���g���̕ҏW��ʂ���сA�G���g���̃v���r���[��ʂɁA�V����"�ۑ�(+htmllint)"�{�^�����ǉ�����Ă��܂��B

	�L����ۑ����鎞�ɁA"�ۑ�(+htmllint)"�{�^���𗘗p���ċL����ۑ�����ƁA
	���̓��e�� Another HTML-lint �Ń`�F�b�N����܂��B

	�`�F�b�N���� HTML �y�[�W�ƁA���̌��ʂ�����̂́A�G���g���ҏW��ʂ̉��ɐV�����ǉ����ꂽ
	����� 2 �̃����N�ł��ꂼ��Q�Ƃ��Ă��������B

	"mthtmllint 0.90 : See INPUT page used in the last htmllint checking."
		�c ���@�`�F�b�N�Ɏg�p���� HTML �y�[�W�S�̂�\�����܂��B

	"mthtmllint 0.90 : See RESULT page of the last htmllint checking."
		�c ���@�`�F�b�N�̌��ʃy�[�W��\�����܂��B


�� "mthtmllint Entry Template" ���W���[���e���v���[�g�̗�
	MovableType �̕ҏW��ʂ�����͂��ꂽ�e�L�X�g�G���A�̓��e�́A
	���̂܂܂ł͑f�����Ȃ̂� Another HTML-lint �Ń`�F�b�N���邱�Ƃ��ł��܂���B
	���̂��߁A�����̃f�[�^�̓��ꕨ�ƂȂ�y�[�W�����W���[���e���v���[�g�Ƃ��č쐬���Ă����K�v������܂��B

	���͂��ꂽ�f�[�^�����̕��@�`�F�b�N�����ɂ���̂ŁA�{�Ԃ��Ȃ���̃e���v���[�g�ł���K�v�͂Ȃ��ł��傤�B
	<HTML> �� <HEAD>�A<TITLE> �ȂǁAHTML �����ɕK�v�ȍŒ���̗v�f������Ώ\���ł��B

--------��������--------
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
--------�����܂�--------

note:	encodeing �� charset �͓K�X���������Ă�������


�� HTML-lint �Ŏg�p����y�[�W�̃��W���[���e���v���[�g�ڍ�
	"mthtmllint Entry Template" �Ƃ������O�ō쐬���ꂽ���W���[���e���v���[�g�̓��e�ɁA
	"�G���g���[�̓��e(body)"��"�G���g���[�̓��e(body)"�𗬂�����ŏo���オ���� HTML ������
	Another HTML-lint ���`�F�b�N�����Ă���܂��B

	���̃��W���[���e���v���[�g���ł́A"�G���g���[�̓��e(body)"��"�G���g���[�̓��e(body)"��
	�ʒu����ꏊ�Ɉȉ��̃e���v���[�g�^�O���g�p���邱�Ƃ��ł��܂��B

	note:	�[���I�� MovableType �̃e���v���[�g�^�O��^���Ă��܂����S���̕ʕ��ł��B
	note:	�e���v���[�g�^�O�Ɏg�p�ł��� encode_html �Ȃǂ̃I�v�V�����w��͈�؂ł��܂���B

	note:	�`�F�b�N�̍ۂɂ����č\�z���s��Ȃ��̂́A���X�|���X�ƃT�[�o���ׂ��l�������ʂł� :-)


<$MTEntryTitle$>
	�G���g���ҏW��ʂ�"�^�C�g��"���ɓ��͂��ꂽ���e�ɒu���������܂��B

<$MTEntryBody$>
	�G���g���ҏW��ʂ�"�G���g���̓��e(body)"���ɓ��͂��ꂽ���e�ɒu���������܂��B

<$MTEntryMore$>
	�G���g���ҏW��ʂ�"�ǋL(extend)"���ɓ��͂��ꂽ���e�ɒu���������܂��B

<$MTEntryExcerpt$>
	�G���g���ҏW��ʂ�"�T�v(excerpt)"���ɓ��͂��ꂽ���e�ɒu���������܂��B

<$MTEntryKeywords$>
	�G���g���ҏW��ʂ�"�L�[���[�h"���ɓ��͂��ꂽ���e�ɒu���������܂��B

	note:	��L�ȊO�̃e���v���[�g�^�O�͊��S�ɖ�������܂�


�� �g�p��������
	���̃\�t�g�E�F�A�p�b�P�[�W�̓��e�ɂ��Ă͊��S�ɖ��ۏ؂ł��B
	���̃\�t�g�E�F�A�p�b�P�[�W�̔z�z����ςɊւ��������
	The Artistic License (http://www.opensource.jp/artistic/ja/Artistic-ja.html)
	�ɏ�������̂Ƃ��A����ɏ]�����莩�R�ɂ��邱�Ƃ��ł��܂��B
		This code is released under the Artistic License.
		The terms of the Artistic License are described at
		http://www.perl.com/language/misc/Artistic.html


�� �ӎ�
	���̃v���O�C���͒P�Ȃ���ꕨ�ɉ߂��܂���B
	���̖{���ł��� Another HTML-lint �Ƃ����f���炵����i���t���[�Ō��J����Ă���
	�Ζ�b��Y����ɑ傫�Ȋ��ӂ��I�@�{���ɂ��肪�Ƃ��������܂���m(_ _)m

	Another HTML-lint
	http://openlab.ring.gr.jp/k16/htmllint/htmllint.html


	mthtmllint �v���O�C���̍쐬�ɂ������Ă͎��̃y�[�W���Q�l�ɂ����Ē����܂����B
		BigPAPI (c)Kevin Shay
			http://www.staggernation.com/mtplugins/BigPAPI/


�� �X�V����
1.00	'06/03/27	���@�`�F�b�N�̋N�����@��ύX
					�v���r���[��ʂ�������@�`�F�b�N���s����悤�ɂ���
0.90    '06/03/09   ���Ō��J
