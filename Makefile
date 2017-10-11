

upload:
	bundle exec middleman deploy
	git commit -a -m update
	git push origin master
