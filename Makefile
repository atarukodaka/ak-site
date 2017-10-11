

upload:
	bundle exec middleman deploy
	git commit -m update
	git push origin master
