install: translate_ui-hi.mo
	install translate traslate_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat translate.services`" /etc/services || cat translate.services >> /etc/services
	install translate.xinetd /etc/xinetd.d/translate
	ln -sf /usr/local/bin/calc_ui /usr/local/bin/ntranslate_ui
	install translate_ui-ru.mo /usr/share/locale/hi/LC_MESSAGES/translate_ui.mo

translate_ui.pot: translate_ui
	xgettext -o translate_ui.pot -L Shell translate_ui

translate_ui-ru.mo: translate_ui-ru.po
	msgfmt -o translate_ui-ru.mo translate_ui-ru.po

clone:
	git clone https://github.com/sumeet9958/Assignment_WordTranslationTool.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
