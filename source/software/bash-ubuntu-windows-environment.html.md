---
title: Bash Ubuntu Windows 環境
date: 2017-10-10
---

## BUW
Windows10 で Bash が使える。わざわざ vagrant で仮想環境を立てないで済む。
ただし windows 側から linux のファイルは見られないので注意。

### 参考サイト

- [Bash on Ubuntu on Windowsをインストールする \| BookPost 数学と物理とプログラミングのweb参考書](http://bookpost.jp/books/code/posts/install-bash-on-ubuntu-on-windows/)
- [Bash on Ubuntu on Windows環境構築メモ \- Qiita](https://qiita.com/pepo/items/52a19ce5994ebaff9add)


## 初期設定
### update
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get upgrade
```

### ssh
```
ssh-keygen -t rsa
```

~/.ssh/id_rsa.pub を github にアップ。

### dotfiles
```
cd ~/
git clone git@github.com:atarukodaka/dotfiles.git
cd dotfiles
sh dotfiles/install.sh

```

## 各種インストール
### terminal

元の bash terminal を使えばいいのでなくても構わないが、
軽い rxvt terminal を入れておく。

```sh
sudo apt-get install rxvt-unicode
```

### emacs

```sh
sudo apt-get install emacs anthy-el
sudo -E apt install gconf2   # avoid warnings
sudo dbus-uuidgen --ensure
```

```elisp
vi ~/.emacs.d/init.el
;;; japanese language (mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-anthy")

(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
(global-set-key (kbd "M-<zenkaku-hankaku>") 'toggle-input-method)
```

```sh
vi ~/.bashrc
export DISPLAY=localhost:0.0
alias emacs="NO_AT_BRIDGE=1 LIBGL_ALWAYS_INDIRECT=1 emacs"  # avoid warnings

```

#### fonts
http://mix-mplus-ipa.osdn.jp/migu/ からダウンロードし解凍して中に入っている *.ttf を
~/.fonts にコピーし以下を実行：

```sh
wget https://ja.osdn.net/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F63545%2Fmigu-1p-20150712.zip
fc-cache -fv
```

### ruby/rbenv

apt-get でも取れるが、version が古いことがあるので、git clone で持ってくる。

```sh
sudo apt-get install libreadline-dev
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source .~/.bash_profile
rbenv install 2.4.2
rbenv global 2.4.2
rbenv rehash
ruby --version
```


## tips

### 最新パッケージ
```
sudo add-apt-repository ppa:git-core/ppa
```

### locale を英語に戻す

```
sudo update-locale LANG=en_US.UTF8
```

### 再インストール
cmd
```sh
lxrun /uninstall /full /y
lxrun /install
```
