---
title: Bash Ubuntu Windows 環境
date: 2017-10-10
---

## BUW のインストール
- [Bash on Ubuntu on Windowsをインストールする \| BookPost 数学と物理とプログラミングのweb参考書](http://bookpost.jp/books/code/posts/install-bash-on-ubuntu-on-windows/)
- [Bash on Ubuntu on Windows環境構築メモ \- Qiita](https://qiita.com/pepo/items/52a19ce5994ebaff9add)

## terminal

gnome-terminal を使う。

```sh
sudo apt-get install gnome-terminal
```
## ruby/rbenv

git clone で持ってこなくてもapt-get で取れる

```sh
sudo apt-get install rbenv libreadline-dev
rbenv install 2.4.2
rbenv global 2.4.2
rbenv rehash
vi ~/.bashrc
...
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


. ~/.bashrc
ruby --version
```

## emacs

```
sudo apt-get install emacs anthy-el
sudo -E apt install gconf2   # avoid warnings
sudo dbus-uuidgen --ensure

vi ~/.emacs.d/init.el
;;; japanese language (mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-anthy")

(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

vi ~/.bashrc
export DISPLAY=localhost:0.0
alias emacs="NO_AT_BRIDGE=1 LIBGL_ALWAYS_INDIRECT=1 emacs"  # avoid warnings

```

### fonts
http://mix-mplus-ipa.osdn.jp/migu/ からダウンロードし解凍して中に入っている *.ttf を
~/.fonts にコピーし以下を実行：

```
fc-cache -fv
```

### tips

### 最新パッケージ
```
sudo add-apt-repository ppa:git-core/ppa
```

### locale を英語に戻す

```
sudo update-locale LANG=en_US.UTF8
```

## 再インストール
```sh
lxrun /uninstall /full /y
lxrun /install
```